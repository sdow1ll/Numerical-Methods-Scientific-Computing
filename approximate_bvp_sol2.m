function [mesh, bvpdata, approximateMat, jtab] = approximate_bvp_sol2(N, Nt)
    %Algorithm 1
    bvpdata = set_bvp_data();
    mesh = set_uniform_partition(bvpdata.domain, N);
    %Uniform time steps
    Dt = bvpdata.timeendval/Nt;
    A = assemble_diffusion_matrix(mesh, bvpdata);
    F = zeros(1, N+1);
    M = assemble_mass_matrix(mesh);
    if isfield(bvpdata, 'forcecoeff')
        F = assemble_force_vector(mesh, bvpdata);
    end
    %set the initial condition, and make it the initial guess for the next
    %timestep (which is actually a pretty good guess)
    W = bvpdata.initialCond(mesh.xpoints);
    %Include M in the setting of the boundary
    [F, A, M] = set_boundary(mesh, bvpdata, F, A, M);
    %initialize a matrix to keep track of the changing U in time
    %preallocating for speed
    Umat = zeros(N+1, Nt);
    Umat(:, 1) = W';
    %initialize a vector to keep track of the number of iterations for each
    %timestep
    jtab = zeros(Nt, 1);
    for i = 1:Nt-1
        j = 0;
        while(1)
            j = j + 1;
            [R, JR] = assemble_reaction_data(mesh, bvpdata, N, 0.5.*(W + Umat(:, i)'));
            H = M*(W' - Umat(:, i)) + Dt.*(0.5.*A*(W' + Umat(:, i)) + R - F');
            Hprime = M + Dt.*(0.5.*A + JR);
            delta = -Hprime\H;
            W = delta' + W;
            if max(abs(M*(W' - Umat(:, i)) + Dt.*(0.5.*A*(W' + Umat(:, i)) + R - F'))) < 1e-5
                jtab(i, 1) = j;
                break;
            end
        end
        Umat(:, i + 1) = W';
    end
    approximateMat = Umat;
end