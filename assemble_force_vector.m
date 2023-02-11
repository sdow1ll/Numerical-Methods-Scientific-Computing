function [F] = assemble_force_vector(mesh, bvpdata)
    F = bvpdata.forcecoeff(mesh.xpoints).*mesh.cvlengths;
end