function jacobi(A,b,e)
[m,n] = size(A);
if m ~= n
disp('Matriz não quadrada')
return %acaba o programa
end
k = 0;
erro = 100;
x = b./diag(A); %chute inicial x0 = b*
prec = -log10(e)+2;
while k<1000 && erro>e % &&: E
xant = x;
for i = 1:n
x(i) = (b(i)-A(i,1:i-1)*xant(1:i-1)-A(i,i+1:n)*xant(i+1:n))/A(i,i);
end
erro = max(abs(x-xant))/max(abs(x));
k = k+1;
fprintf('x_%d = ',k)
disp(x')
fprintf('erro = %.*f\n\n',prec,erro)
end