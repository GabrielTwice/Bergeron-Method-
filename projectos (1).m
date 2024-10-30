clc; close all; clear;
tchola=1;

while tchola==1
    menu1();
colho=input('Introduza uma aba-->'); 

if colho==1 
    clc;
    
    valores();

   
elseif colho==2
        iterations();
elseif colho==3
    %%
        Ni=4;
if mod(Ni,2) == 0
    Ax=zeros(1,(Ni/2)+1); %x correntes y tensoes
    Ay=zeros(1,(Ni/2)+1);
    Bx=zeros(1,Ni/2);
    By=zeros(1,Ni/2);
else
   Bx=zeros(1,(Ni/2)+0.5);
   By=zeros(1,(Ni/2)+0.5);
   Ax=zeros(1,(Ni/2)+0.5);
   Ay=zeros(1,(Ni/2)+0.5);
end
        clc; close all; clear;
        Td=5;
        Ni=4;
        Vs=75;
        Rs=100;
        Rl=200;
        Z0=50;
        %v=@(z,t) v.*(z-v.*t)+v.*(z + u.*t);
        %i=@(z,t) (1/Z0).*(v.*(z-v.*t)-v-(z+u.*t));
        i=linspace(0,0.75,1000);
        v=Vs-Rs.*i;
        V=Rl.*i;
        RZ0=Z0.*i;
        RMZ0=-Z0.*i;
        figure;
        plot(i,V,'b','LineWidth',1.5);hold on;
        plot(i,v,'r','LineWidth',1.5);hold on;     
        plot(i,RZ0,'--k','LineWidth',1.5);hold on;
        inc=0;
        X1=Vs/(Z0+Rs);   % I(0)
        Y1=X1*Z0; %V(0)
        plot(X1,Y1,'.k','Markersize',20);hold on;

        
        while inc ~= Ni
        it1 = inc + 1;
        if(mod(it1,2) ~= 0) 
        b=Y1+Z0.*X1;
        X2 = b/(Rl+Z0); %Ib...Rl pq é onde vai intersetar
        Y2 = X2*Rl;     %Vb
        plot([X1,X2],[Y1,Y2],'--k'); hold on;
        plot(X2,Y2,'.k','MarkerSize',20); hold on;
        
        
        Bx(indiceB) = X2;
        By(indiceB) = Y2;
        indiceB = indiceB + 1;
        
        
        elseif ( mod(it1,2) == 0)
        b=Y2-Z0.*X2;
        X1=(-b+Vs)./(Z0+Rs);
        Y1=Z0.*X1+b;
        plot([X1,X2],[Y1,Y2],'--k'); hold on;
        plot(X1,Y1,'.k','MarkerSize',20); hold on;
            
        
        
        Ax(indiceA) = X1;
        Ay(indiceA) = Y1;
        indiceA = indiceA + 1;
        

        end
       
        
         inc= inc + 1;
        end
        xlabel('Corrente(A)');ylabel('Tensão(V)');
        grid on;



%stairs parte
n = 0:Td:Ni*Td;
    

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


elseif colho==4
    return
else
    continue
end
end


