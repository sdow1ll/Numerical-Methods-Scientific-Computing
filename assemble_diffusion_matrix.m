function [mat] = assemble_diffusion_matrix(mesh, bvpdata)
    %Define the number of subintervals as N for quick reference in vector later
    %on
    N = mesh.NumOfSubIntervals;
    %Create each alpha from the bvpdata
    alpha = bvpdata.diffusioncoeff(mesh.midpoints)./mesh.silengths;
    %Define each diagonal, I'm going to call them UD, LD, and MD, because it
    %makes more sense to me
    UD = -alpha;
    LD = -alpha;
    MD = [alpha(1, 1), alpha(1, 1:N - 1) + alpha(1, 2:N), alpha(1, N)];
    mat = sparse(diag(MD) + diag(LD, -1) + diag(UD, 1));
end