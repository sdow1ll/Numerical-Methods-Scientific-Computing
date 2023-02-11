% hold on;
%  N1 = 50;
%  [mesh, bvpdata, sol1] = approximate_bvp_sol(N1)
%  plot(mesh.xpoints, sol1)
% 
% 
% N2 = 100
% [mesh, bvpdata, sol2] = approximate_bvp_sol(N2)
% plot(mesh.xpoints, sol2)
% 
% 
% N3 = 200
% [mesh, bvpdata, sol3] = approximate_bvp_sol(N3)
% plot(mesh.xpoints, sol3)
% 
% N4 = 400
% [mesh, bvpdata, sol4] = approximate_bvp_sol(N4)
% plot(mesh.xpoints, sol4)
% 
% N5 = 800
% [mesh, bvpdata, sol5] = approximate_bvp_sol(N5)
% plot(mesh.xpoints, sol5)
% 
figure(1)
N6 = 1600
[mesh, bvpdata, sol6] = approximate_bvp_sol(N6)
plot(mesh.xpoints, sol6)

legend('N1', 'N2', 'N3', 'N4', 'N5', 'N6')
figure(2)
utrue = @(x) (x <= pi/6 ).* (-1/6 .* x.^3 + 1/12 .* x.^4 + (0.0338).*x + 0) + ( pi/6 <= x).*(10^(-4).*((-1/6 .* x.^3 + 1/12 .* x.^4 - (-0.0555).*x + (0.1388))))
%utrue = @(x) (x <= pi/6 ).* (-1/6 .* x.^3 + 1/12 .* x.^4 + (0.089).*x + 0) + ( pi/6 <= x).*(10^(-4).*(((600 .* x.^3) + (600 .* x.^4) - (6*1000).*x + (6000))))
plot(mesh.xpoints, utrue(mesh.xpoints))
% check flux continuity
dudx = @(x) (x <= pi/6 ).* ((1/3).*x.^3 - (1/2) .* x.^2 + 301.9814) + ( pi/6 < x).*(10^4 * ((1/3).*x.^3 - (1/2) .* x.^2 - 301.8981))
figure(3)
plot(mesh.xpoints, dudx(mesh.xpoints))
