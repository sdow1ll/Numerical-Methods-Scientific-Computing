T = 160;
Nt = 600; 
N = 200;
maxIters = 20;
tol = 1e-4;
hbar = 1;
H = 1;

sigma0 = 5;
k0 = 1;
x0 = 0;
normFactor = 1 / sqrt(sigma0) / sqrt(pi);
exactSol = @(x,t) exp(-1i/hbar * H .* t) .* ...
    (normFactor .* exp(1i*k0*x) .* exp( -(x-x0).^2 /2 /sigma0^2));

bvpdata = set_bvp_data();
mesh = set_uniform_partition(bvpdata, N);

[U, iterations] = approximate_sol_Alg2(N, Nt, T, maxIters, tol);

figure(1)
title('Probability Density at Different Times')
xlabel('x')
ylabel('P(x,t)')
plot( mesh.xpoints, abs( U(:,1 ) ).^2 )
hold on;
plot( mesh.xpoints, abs( U(:,100) ).^2  )
plot( mesh.xpoints, abs( U(:,200) ).^2  )
plot( mesh.xpoints, abs( U(:,300 ) ).^2 )
plot( mesh.xpoints, abs( U(:,400 ) ).^2 ) 
plot( mesh.xpoints, abs( U(:,500 ) ).^2 )
plot( mesh.xpoints, abs( U(:,Nt ) ).^2  )
title('Probability Density at Different Times')
xlabel('x')
ylabel('P(x,t)')
legend('t = 1', 't = 100','t = 200','t = 300','t = 400','t = 500','t = 600')
hold off;

figure(2)
title('Wave function at t=0')
xlabel('x')
ylabel('\psi(x)')
hold on;
plot( mesh.xpoints, real( U(:,100) ) )
plot( mesh.xpoints, imag( U(:,100) ), 'b:')
legend('Real', 'Imaginary')
hold off;


figure(3)
title('Wave function at t=300')
xlabel('x')
ylabel('\psi(x)')
hold on;
plot( mesh.xpoints, real( U(:,300) ),'g' )
plot( mesh.xpoints, imag( U(:,300) ), 'g:')
legend('Real', 'Imaginary')
hold off;

figure(4)
title('Wave function at t=600')
xlabel('x')
ylabel('\psi(x)')
hold on;
plot( mesh.xpoints, real( U(:,Nt) ),'r' )
plot( mesh.xpoints, imag( U(:,Nt) ), 'r:')
legend('Real', 'Imaginary')
hold off;

figure(5)
hold on;
title('Wavefunction Exact Sol at t=0')
xlabel('x')
ylabel('\psi (x)')
initial_t_ES = exactSol(mesh.xpoints, 600);
plot(mesh.xpoints, real(initial_t_ES))
plot(mesh.xpoints, imag(initial_t_ES))
legend('Real', 'Imaginary')