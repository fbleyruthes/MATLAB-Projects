function bisseccao
x = sym("x");
f = input('Digite f(x) = ');
a = input('Digite a: ');
b = input('Digite b: ');
m = input('Quantidade de decimais: ');

%Critério de Bolzano
if subs(f,a)*subs(f,b) >= 0
    disp('ERRO: f(a)*f(b) >= 0!')
    return 
else
    k = 0; %Contador de iteração
    while k <= 1000
        xk = (a + b)/2;
        
        if subs(f,a)*subs(f,xk) < 0
            b = xk;
        else
            a = xk;
        end
        disp(xk)
        %a e bjá atualizados
        xk1 = (a + b)/2; %xk1 = x_{k + 1}
        
        CP = abs(xk1 - xk)/abs(xk1);
        if CP < 10^(-m)
            disp('Raiz encontrada!')
            disp(xk1)
            return
        end

        k = k + 1;
    end
end

a