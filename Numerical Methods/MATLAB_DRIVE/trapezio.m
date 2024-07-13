function I = trapezio(f,a,b,n)
h = (b - a)/n;
I = eval(subs(f,a) + subs(f,b));
for i = 1:n-1
    I = I + 2*eval(subs(f,a+i*h));
end
I = (h/2)*I;
fprintf("Regra do trapezio\n")
fprintf("Integral de %s de %.4f até %.4f\n",f,a,b)
fprintf("Com h = %f (%d intervalos) é de\n",h,n)
fprintf("%.15f",I)