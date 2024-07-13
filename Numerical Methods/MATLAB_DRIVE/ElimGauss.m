function ElimGauss(A,B)
[m,n] = size(A)
if m ~= n
    disp('Matriz não quadrática')
    return
end

for k = 1:n-1
    for i = k + 1:n
        aux = A(i,k)/A(k,k);
        for j = k:n
            A(i,j) = A(i,j) - A(k,j)*aux;
        end
        B(i) = B(i) - B(k)*aux;
    end
    Amp = [A,B];
    fprintf('Escalonamento após etapa %d:\n',k)
    disp(Amp)
end

for i = n:-1:1
    S = 0;
    for j = i+1:n
        S = S + A(i,j)*x(j);
    end
    x(i) = (B(i) - S)/A(i,i);
end
format rational
disp('A solução do sistema é')
disp(x')%transposta
format default
