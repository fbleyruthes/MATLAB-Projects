function RK4(f,x0,y0,xN,N)
h = (xN-x0)/N;
resp(1,:) = [x0,y0];
disp("Método de Runge-Kutta 4a ordem!")
fprintf("com h = %f \n", h)
fprintf("xn \t\t yn \n")
fprintf("%f \t %.15f\n", resp(1,:))
for i = 1:N
    k1 = eval(subs(f,{'x','y'},{x0,y0}));
    k2 = eval(subs(f,{'x','y'},{x0+h/2,y0+h*k1/2}));
    k3 = eval(subs(f,{'x','y'},{x0+h/2,y0+h*k2/2}));
    k4 = eval(subs(f,{'x','y'},{x0+h,y0+h*k3}));
    y1 = y0 + (h/6)*(k1+2*k2+2*k3+k4);
    y0 = y1;
    x0 = x0+h;
    resp(i+1,:) = [x0,y0];
end
fprintf("\t  . . . \n")
fprintf("%f \t %.15f\n", resp(i+1,:))
plot(resp(:,1) , resp(:,2), '*b')
grid on
legend ("Runge-Kutta 4a ordem")