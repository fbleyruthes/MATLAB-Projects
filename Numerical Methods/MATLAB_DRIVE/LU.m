function LU(A,b)
[m,n] = size(A)
if m ~= n
    disp('Matriz não quadrática')
    return
end
%menores principais
for k = 1:n - 1
    if abs(det(A(1:k,1:k))) < 10^-4
        disp('det(Ak) = 0')
        return
    end
end
%LU
for i = 2:n
    for j = 1:n
        if i <= j %elementos de U
            %S = 0;
            %for k = 1:i - 1
               % S = S + A(i,k)*A(k,j);
           %end
            A(i,j) = A(i,j) - A(i,1:i - 1)*A(1:i - 1,j);
        else %elementos de L
            %S = 0;
            %for k = 1:j - 1
                %S = S + A(i,k)*A(k,j);
            %end
            A(i,j) = (A(i,j) - A(i,1:j - 1)*A(1:j - 1,j))/A(j,j)
        end
    end
end
disp('Parte diagonal e superior: U')
disp('Parte estritamente inferior: L')
disp(A)