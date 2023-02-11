function [mesh] = set_uniform_partition(bvpdata, N)
%input needed is a column vector [a;b] and N a scalar number.
% outputs a structure array called 'mesh' that includes
%fields that partition the domain which is [a;b].
%includes midpoints, tau, steplength h_i, etc.

mesh.NumOfSubIntervals = N;
mesh.xpoints = linspace(bvpdata.domain(1), bvpdata.domain(2), N+1);

mesh.silengths = diff(mesh.xpoints);
mesh.midpoints = mesh.xpoints(1, 1:N) + mesh.silengths./2 ;
mesh.cvlengths = [mesh.midpoints(1,1) - mesh.xpoints(1,1), ...
     mesh.midpoints(2:N) - mesh.midpoints(1:N-1), ...
     mesh.xpoints(1,1) - mesh.midpoints(1,N)];
end