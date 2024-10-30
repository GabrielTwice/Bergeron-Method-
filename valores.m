function valores()

VS=75;
RS=100;
RL=200;
L= 0.04;
C= 62500;
U= 0.02;
Td=2; %milissegundos
Zo = 50;

bosingwa = 0;
while bosingwa == 0
clc;
fprintf("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");
fprintf("@                                                                               \n");
fprintf("@              1 - Tensão de entrada (atualmente %d)                            \n", VS);
fprintf("@                                                                               \n");
fprintf("@              2 - Impedância de alimentação (atualmente %d)                    \n", RS);
fprintf("@                                                                               \n");   
fprintf("@              3 - Impedância de carga (atualmente %d)                          \n", RL);
fprintf("@                                                                               \n");
fprintf("@              4 - Linha de comprimento (atualmente %d)                         \n", L);
fprintf("@                                                                               \n");   
fprintf("@              5 - Capacidade distribuída na linha (atualmente %d)              \n", C);
fprintf("@                                                                               \n");   
fprintf("@              6 - Velocidade de propagação (atualmente %d)                     \n", U);
fprintf("@                                                                               \n");   
fprintf("@              7 - Tempo de propagação (atualmente %d)                          \n", Td);
fprintf("@                                                                               \n");
fprintf("@              8 - Sair para o início                                           \n");
fprintf("@                                                                               \n");
fprintf("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n");

mirmir = input('Introduza uma aba: ');

if mirmir == 1
VS = 0;
                    while(isempty(VS) || ~isscalar(VS) || VS <= 0)
                         VS = input('Tensão da fonte (V): ');
                         if(isempty(VS) || ~isscalar(VS))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(VS <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                     end

elseif mirmir == 2
    RS = 0;
                    while(isempty(RS) || ~isscalar(RS) || RS <= 0)
                         RS = input('Impedância de alimentação (Ohms): ');
                         if(isempty(RS) || ~isscalar(RS))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(RS < 0)
                            fprintf('O número introduzido é negativo!!! Tente novamente:\n');
                         end
                    end

elseif mirmir == 3
    RL = 0;
                    while(isempty(RL) || ~isscalar(RL) || RL <= 0)
                         RL = input('Impedância de carga (Ohms): ');
                         if(isempty(RL) || ~isscalar(RL))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(RL < 0)
                            fprintf('O número introduzido é negativo!!! Tente novamente:\n');
                         end
                    end
                    
elseif mirmir == 4
    L = 0;
                    while(isempty(L) || ~isscalar(L) || L <= 0)
                         L = input('Linha de comprimento (m): ');
                         if(isempty(L) || ~isscalar(L))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(L <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                    end
                    
elseif mirmir == 5
    C = 0;
                    while(isempty(C) || ~isscalar(C) || C <= 0)
                         C = input('Capacidade distribuída na linha (C): ');
                         if(isempty(C) || ~isscalar(C))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(C <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                    end
                    
elseif mirmir == 6
    Td = 0;
                    while(isempty(Td) || ~isscalar(Td) || Td <= 0)
                         Td = input('Velocidade de propagação (V): ');
                         if(isempty(Td) || ~isscalar(Td))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(Td <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                    end
                    
elseif mirmir == 7
    U = 0;
                    while(isempty(U) || ~isscalar(U) || U <= 0)
                         U = input('Tempo de propagação (ms): ');
                         if(isempty(RS) || ~isscalar(RS))
                             fprintf('O número introduzido não é um escalar!!! Tente novamente:\n');
                         end
                         if(RS <= 0)
                            fprintf('O número introduzido é negativo ou 0!!! Tente novamente:\n');
                         end
                    end
elseif mirmir == 8
    clc;
    break;
                    
end                    
end                    