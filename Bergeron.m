function [Ax,Ay,Bx,By] = Bergeron(Vs,Rs,RL,Z0,it,Td)

clc;
close all;
i = linspace(0,10,20);
% escadas é tipo o AX,AY,BX,BY
if mod(it,2) == 0
    Ax=zeros(1,(it/2)+1); %x correntes y tensoes
    Ay=zeros(1,(it/2)+1);
    Bx=zeros(1,it/2);
    By=zeros(1,it/2);
else
    Bx=zeros(1,(it/2)+0.5);
    By=zeros(1,(it/2)+0.5);
    Ax=zeros(1,(it/2)+0.5);
    Ay=zeros(1,(it/2)+0.5);
end

v = Vs - Rs * i;
r = RL * i;
x = Vs/(RL+Rs);

figure;
plot(i,v,'b'); hold on;
plot(i,r,'r'); hold on;
plot(x,RL*x,'.g','MarkerSize',25); hold on;
grid on;

y = Z0 * i;
x1 = Vs/(Z0+Rs);
y1 = Z0*x1;

xlim([0 x1+1]);
ylim([0 Vs]);

plot(i,y,'--k'); hold on;
plot(x1,y1,'.k','MarkerSize',20); hold on;

a = 0;
indiceA = 1;
indiceB = 1;

Ax(indiceA) = x1;
Ay(indiceA) = y1;
indiceA = indiceA + 1;

while a ~= it  
    it1 = a + 1;
    if mod(it1,2) == 1
        b = y1+Z0*x1;
        %y = -Z0*i + b;
        x2 = b/(RL+Z0);
        y2 = x2*RL;
        
        plot([x1,x2],[y1,y2],'--k'); hold on;
        plot(x2,y2,'.k','MarkerSize',20); hold on;

        Bx(indiceB) = x2;
        By(indiceB) = y2;
        indiceB = indiceB + 1;
    else
        b = y2-Z0*x2;
        %y = Z0*i + b;
        x1 = -((b-Vs)/(Rs+Z0));
        y1 = Z0*x1+b;

        plot([x1,x2],[y1,y2],'--k'); hold on;
        plot(x1,y1,'.k','MarkerSize',20); hold on;
        
        Ax(indiceA) = x1;
        Ay(indiceA) = y1;
        indiceA = indiceA + 1;
    end

    a = a + 1;
end

Ay
By
% parte das escadas

n = 0:Td:it*Td;
    

if(mod(it,2) ~= 0)
    figure;
    stairs(n(1:2:end),Ay,'r');
    hold on;
    stairs([0,n(2:2:end)],[0,By],'b');
    grid on;

elseif(mod(it,2) == 0)
    figure;
    stairs(n(1:2:end),Ay,'r');
    hold on;
    stairs([0,n(2:2:end-1)],[0,By],'b');
    grid on;
end


