A = [-1/3 -16/3 -1/3 0; 0 -1/3 -16/3 -1/3; 0 0 -1/3 -17/3; -17/3 -1/3 0 0];
b = [54; 54; -3; 0];

U = A\b

x = linspace(0, 9, 1000);
f = 9*x - x.^2;
utrue = ((1/4)*(7*sqrt(2)*sin(sqrt(2)*x))) + (1/(4*sin(9*sqrt(2))))*sqrt(2)*cos(sqrt(2)*x)*(7*cos(9*sqrt(2)) + 3) + (1/2)*x.^2 - (9/2)*x - 1/2;
plot(x, utrue);
hold on;
plot(linspace(0,9,4), U, 'r')
title('Problem 4 Solution Plot')
xlabel('x')
ylabel('u(x)')
legend('Approx. Soln.', 'True Soln.')
