%%Part 1
i = [0, 1, 2, 3, 4, 5, 6];
N = 500 .* 2.^i;

truesol = @(x) 5.656.*airy((1e-6)^(-1/3).*x);
x1 = linspace(-1, 1, N(1));
x2 = linspace(-1, 1, N(2));
x3 = linspace(-1, 1, N(3));
x4 = linspace(-1, 1, N(4));
x5 = linspace(-1, 1, N(5));
x6 = linspace(-1, 1, N(6));
x7 = linspace(-1, 1, N(7));
hold on;
[mesh,bvpdata, sol1] = approximate_bvp_sol(N(1));
plot(mesh.xpoints, sol1);
[mesh,bvpdata, sol2] = approximate_bvp_sol(N(2));
plot(mesh.xpoints, sol2);
[mesh,bvpdata, sol3] = approximate_bvp_sol(N(3));
plot(mesh.xpoints, sol3);
[mesh,bvpdata, sol4] = approximate_bvp_sol(N(4));
plot(mesh.xpoints, sol4);
[mesh,bvpdata, sol5] = approximate_bvp_sol(N(5));
plot(mesh.xpoints, sol5);
[mesh,bvpdata, sol6] = approximate_bvp_sol(N(6));
plot(mesh.xpoints, sol6);
[mesh,bvpdata, sol7] = approximate_bvp_sol(N(7));
plot(mesh.xpoints, sol7);





plot(x7, truesol(x7));

hold off;
