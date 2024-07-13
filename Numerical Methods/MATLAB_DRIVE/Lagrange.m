function Lagrange(x,y)
t = sym('t');
n = length(x);
Pn = 0;
for k = 1:n
Lk = 1;
for i = 1:n
if k~=i
Lk = Lk*(t-x(i))/(x(k)-x(i));
end
end
fprintf('L_%d = %s\n',k-1,Lk)
Pn = Pn + y(k)*Lk;
end
Pn = simplify(Pn);
fprintf('P_%d = %s\n',n-1,Pn)
eixox = linspace(x(1)-1,x(n)+1);
eixoy = subs(Pn,eixox);
plot(eixox,eixoy,'b-',x,y,'k*')
grid on
