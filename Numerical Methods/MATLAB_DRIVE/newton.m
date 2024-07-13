function newton
x = sym("x");
f = input('Digite f(x) = ');
x0 = input('Digite x0 = ');
m = input('Casas decimais corretas m = ');
fd = diff(f)

%4*cos(x) - exp(x)

k = 0; %contador de iteração

fprintf('x_%d = %.*f \n', k, 2*m, x0)

while k < 100
    if abs(subs(fd,x0)) <= 10^-5
        disp('Derivada igual a 0. ')
        return
    end
    x1 = eval(x0 - subs(f,x0)/subs(fd,x0));

    CP = abs(x1 - x0)/abs(x1);
    
    if CP < 10^-m
        disp('Raiz encontrada')
        return
    end

    x0 = x1;
    fprintf('x_%d = %.*f, CP=%.*f\n', k, 2*m, x0, 2*m, CP)
    k = k + 1;
end