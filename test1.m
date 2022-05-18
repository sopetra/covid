%% k fiksan na populaciji od milijun ljudi
N=1000000;
bv = linspace(0.01,0.8,20);
k=1/14;

figure(1)
for i = max(size(bv)):-1:1
  SIR(bv(i),k,250,2/N,N);
  pause(0.1);
end

%% b fiksan na populaciji od milijun ljudi
b = 1/2;
figure(2)
for i = 0.025:0.01:0.4
  SIR(b,i,250,1/N,N);
  pause(0.1);
end


fig=figure(3)
[y1,t]=SIR(0.2606,1/14,250,2/N,N);
[y2,t]=SIR(0.2606,1/9,250,2/N,N);
[y3,t]=SIR(0.2606,1/6,250,2/N,N);
P=plot(t,y1(2,:),'-r',t,y2(2,:),'-b',t,y3(2,:),'-k');
set(P,'Linewidth',1.5');
L=legend({'k=1/14','k=1/9','k=1/6'});
set(L,'fontsize',16)
grid on;
xticks(0:20:250);
saveas(fig,'figura2.jpg');
y1(3,250)
y3(3,250)

fig=figure(4)
[y1,t]=SIR(0.2606,1/14,250,2/N,N);
[y2,t]=SIR(0.20,1/14,250,2/N,N);
[y3,t]=SIR(0.15,1/14,250,2/N,N);
P=plot(t,y1(2,:),'-r',t,y2(2,:),'-b',t,y3(2,:),'-k');
set(P,'Linewidth',1.5');
L=legend({'b=0.2606','b=0.2','b=0.15'});
set(L,'fontsize',16)
grid on;
xticks(0:20:250);
saveas(fig,'figura3.jpg');
