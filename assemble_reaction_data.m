function [R, JR] = assemble_reaction_data(mesh, N, bvpdata, W)
    set_uniform_partition(bvpdata, N);
    beta = bvpdata.reactioncoeff(mesh.xpoints', W')*mesh.cvlengths';
    %mat = sparse(diag(beta));
   
    %U0 = bvpdata.initial_cond(mesh.xpoints);
    %Uhalf = (1/2) * (U0 + W);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %R
    R = beta;
    if bvpdata.leftbdryisDirichlet
        R(1) = 0;
    end 

    if bvpdata.rightbdryisDirichlet
        R(N+1) = 0;
    end
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %JR
    JR = bvpdata.partialureaction(mesh.xpoints, W) .* mesh.cvlengths';
    JR = sparse(diag(JR));

   if bvpdata.leftbdryisDirichlet
       JR(1,1) = 0;
   end

   if bvpdata.rightbdryisDirichlet
       JR(N+1, N+1) = 0;
   end
  
end