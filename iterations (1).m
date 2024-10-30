function iterations()

Ni = 4;
fprintf("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");
fprintf("@                                                                               \n");   
fprintf("@              1 - Número de iterações (atualmente %d)                          \n", Ni);
fprintf("@                                                                               \n");
fprintf("@              2 - Sair para o início                                           \n");
fprintf("@                                                                               \n");
fprintf("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");

miromiro = input('Introduza uma aba: ');

if miromiro == 1
Ni = 0;
                    while(isempty(Ni) || ~isscalar(Ni) || Ni <= 0)
                         Ni = input('N de iterações: ');
                         if(isempty(Ni) || ~isscalar(Ni))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(Ni <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                    end
elseif miromiro == 2
    clc;
    return
end