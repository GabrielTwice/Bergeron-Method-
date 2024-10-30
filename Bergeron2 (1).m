function [tabelaAx,tabelaAy,tabelaBx,tabelaBy,TDa,TDb] = Bergeron(v,r,VS,RS,RL,Z0,TD,i,int)

if int <= 0
    error('O numero de iterações tem que ser >=0!!');
end 

if mod(int,2) == 0
    tabelaAx=zeros(1,(int/2)+1);
    tabelaAy=zeros(1,(int/2)+1);
    tabelaBx=zeros(1,int/2);
    tabelaBy=zeros(1,int/2);
else
    tabelaBx=zeros(1,(int/2)+0.5);
    tabelaBy=zeros(1,(int/2)+0.5);
    tabelaAx=zeros(1,(int/2)+0.5);
    tabelaAy=zeros(1,(int/2)+0.5);
end

f = @(i) v(i) - r(i);

aux = fsolve(f,[0,10])
%if aux(1) ~= aux(2)
%    error('As curvas caraterísticas introduzidas não garantem um ponto de operação, assim o circuito não é viável!!');
%end

x = fzero(f,[0,10])
y = r(x);


figure
fplot(v,'b'); hold on;
fplot(r,'r'); hold on;
plot(x,y,'.g','MarkerSize',25); hold on;
grid on;

y = @(i) Z0 * i;
f1 = @(i) v(i) - y(i);
x1 = fzero(f1,[0,10]);
y1 = y(x1);

xlim([0 10]);
ylim([0 14]);

fplot(y,'--k'); hold on;
plot(x1,y1,'.k','MarkerSize',20); hold on;

a = 0;
a1 = 1;
a2 = 1;

tabelaAx(a1) = x1;
tabelaAy(a1) = y1;
a1 = a1 + 1;

while a ~= int
    int1 = a + 1;
    if mod(int1,2) == 1
        b = y1+Z0*x1;
        y = @(i) -Z0*i + b;
        f2 = @(i) r(i) - y(i);
        x2 = fzero(f2,[0,10]);
        y2 = r(x2);
        
        plot([x1,x2],[y1,y2],'--k'); hold on;
        plot(x2,y2,'.k','MarkerSize',20); hold on;

        tabelaBx(a2) = x2;
        tabelaBy(a2) = y2;
        a2 = a2 + 1;
    elseif mod(int1,2) == 0
        b = y2-Z0*x2;
        y = @(i) Z0*i + b;
        f1 = @(i) v(i) - y(i);
        x1 = fzero(f1,[0,10]);
        y1 = Z0*x1+b;

        plot([x1,x2],[y1,y2],'--k'); hold on;
        plot(x1,y1,'.k','MarkerSize',20); hold on;
        
        tabelaAx(a1) = x1;
        tabelaAy(a1) = y1;
        a1 = a1 + 1;
    end

    a = a + 1;
end

n=0:TD:TD*int;

figure;
stairs(n(1:2:end),tabelaAy,'r'); hold on; 
stairs([0,n(2:2:end)],[0,tabelaBy],'b'); hold on; 
grid on;
if mod(int,2) == 0
    stairs([n(end),n(end)+TD],[tabelaAy(end),tabelaAy(end)],'r'); hold on;
    stairs([n(end)-TD,n(end)],[tabelaBy(end),tabelaBy(end)],'b'); 
else
    stairs([n(end)-TD,n(end)],[tabelaAy(end),tabelaAy(end)],'r'); hold on;
    stairs([n(end),n(end)+TD],[tabelaBy(end),tabelaBy(end)],'b');
end    

xlim([0 TD*(int+1)]);
if max(tabelaAy) >= max(tabelaBy)
    ylim([0 max(tabelaAy)+3]);
else
    ylim([0 max(tabelaBy)+3]);
end

figure;
stairs(n(1:2:end),tabelaAx,'r');
hold on;
stairs([0,n(2:2:end)],[0,tabelaBx],'b'); hold on;
grid on;
if mod(int,2) == 0
    stairs([n(end),n(end)+TD],[tabelaAx(end),tabelaAx(end)],'r'); hold on;
    stairs([n(end)-TD,n(end)],[tabelaBx(end),tabelaBx(end)],'b'); 
else
    stairs([n(end)-TD,n(end)],[tabelaAx(end),tabelaAx(end)],'r'); hold on;
    stairs([n(end),n(end)+TD],[tabelaBx(end),tabelaBx(end)],'b');
end

xlim([0 TD*(int+1)]);
if max(tabelaAx) >= max(tabelaBx)
    ylim([0 max(tabelaAx)+0.10]);
else
    ylim([0 max(tabelaBx)+0.10]);
end

TDa = n(1:2:end);
TDb = n(2:2:end);