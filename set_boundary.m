function [F, mat] = set_boundary(mesh, bvpdata, F, mat)
    N = mesh.NumOfSubIntervals;
    if bvpdata.leftbdryisDirichlet
        mat(1, 1) = 1;
        mat(1, 2) = 0;
        F(1) = bvpdata.leftbdryvalue;
       
    else
        mat(1, 1) = mat(1, 1) - bvpdata.leftgamma;
        F(1) = F(1) - bvpdata.leftbdryvalue;
    end

    if bvpdata.rightbdryisDirichlet
        mat(N+1, N) = 0;
        mat(N+1, N+1) = 1;
        F(N+1) = bvpdata.rightbdryvalue;
        
    else
        mat(N+1, N+1) = mat(N+1, N+1) - bvpdata.rightgamma;
        F(N+1) = F(N+1) - bvpdata.rightbdryvalue;
    end
end