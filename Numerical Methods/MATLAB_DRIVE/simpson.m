function I = simpson(f,a,b,n)
h = (b - a)/n;
if n == 1
    I = trapezio(f,a,b,n);
elseif rem(n,2) == 0
    disp("Regra 1/3 de Simpson")
    I = eval(subs(f,a) + subs(f,b));
    for i = 1:n-1
        if rem(i,2) == 0
            I = I + 2*eval(subs(f,a+i*h));
        else
            I = I + 4*eval(subs(f,a+i*h));
        end
    end
    I = (h/3)*I;
    fprintf("Integral de %s de %.4f até %.4f\n",f,a,b)
    fprintf("Com h = %f (%d intervalos) é de\n",h,n)
    fprintf("%.15f",I)
elseif rem(n,3) == 0
    disp("Regra 3/8 de Simpson")
    I = eval(subs(f,a) + subs(f,b));
    for i = 1:n-1
        if rem(i,3) == 0
            I = I + 2*eval(subs(f,a+i*h));
        else
            I = I + 3*eval(subs(f,a+i*h));
        end
    end
    I = (3*h/8)*I;
    fprintf("Integral de %s de %.4f até %.4f\n",f,a,b)
    fprintf("Com h = %f (%d intervalos) é de\n",h,n)
    fprintf("%.15f",I)
else
    disp("Misto das regras de Simpson")
    I1 = simpson(f,a,a+(n-3)*h,n-3);
    I2 = simpson(f,a+(n-3)*h,b,3);
    I = I1 + I2;
    fprintf("Integral de %s de %.4f até %.4f\n",f,a,b)
    fprintf("Com h = %f (%d intervalos) é de\n",h,n)
    fprintf("%.15f",I)
end