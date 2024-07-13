function Euler(f,x0,y0,xN,N)
h = (xN-x0)/N;
resp(1,:) = [x0,y0];
disp("Método de Euler!")
fprintf("com h = %f \n", h)
fprintf("xn \t\t yn \n")
fprintf("%f \t %.15f\n", resp(1,:))
for i = 1:N
    y1 = y0 + h*eval(subs(f,{'x','y'},{x0,y0}))
    y0 = y1;
    x0 = x0+h;
    resp(i+1,:) = [x0,y0];
    fprintf("%f \t %.15f\n", resp(i+1,:))
end
plot(resp(:,1) , resp(:,2), '*b')
grid on
legend ("Euler")