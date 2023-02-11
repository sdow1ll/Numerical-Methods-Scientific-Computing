function [mesh, bvpdata, approximatevector, W] = approximate_bvp_sol(domain, N, W, MaxIters, tol)
    bvpdata = set_bvp_data();
    mesh = set_uniform_partition(domain, N);
    mat = assemble_diffusion_matrix(mesh, bvpdata);
% 
%     if isfield(bvpdata, 'reactioncoeff')
%         mat = mat + assemble_reaction_data(mesh, bvpdata);
%     end
    

    F = zeros(1, N+1);
    if isfield(bvpdata, 'forcecoeff')
        F = assemble_force_vector(mesh, bvpdata);
    end
[F, mat] = set_boundary(mesh, bvpdata, F, mat);
% 
%     approximatevector = mat\F';

%Note that mat, W, R, and F are all supposed to column vectors in order for
%this to work.
   
    for m = MaxIters
        [R, JR] = assemble_reaction_data(mesh, domain, N, bvpdata, W);
        G = (mat*W') + R' - F';
        J = mat + JR;
        delta = -J\G;
        W = W + delta';
        if max(abs(G)) < tol
            break
        end
    end
    approximatevector = W;
    end