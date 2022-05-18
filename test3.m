%%zadnji update 30.3.2020. Hrvatska (od 3.4.)
rh=zeros(2,47);
rh(1,:)=[2,1,0,2,2,1,1,0,1,0,1,1,0,1,3,3,13,5,12,8,12,20,16,23,78,48,61,67,60,53,91,71,56,77,77,96,48,68,47,56,40,60,61,64,39,66,50];
rh(2,:)=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,0,0,0,0,0,0,11,6,0,15,12,3,12,3,6,15,4,27,6,5,37,12,40,92,50,27];%dodane i smrti 
n2 = max(size(rh));
rh_k = zeros(2,n2); rh_k(1,1) = rh(1,1);
for i = 2:n2
  rh_k(1,i)=rh_k(1,i-1)+rh(1,i)-rh(2,i);
  rh_k(2,i)=rh_k(2,i-1)+rh(2,i);
end

%rh_k(17)
r0 = 0;
s0 = 1;
t0 = 0;
h = 1;
k = 1/14;
B = @(x)(2.^(1/x)-1+k);

%% HRVATSKA
N=4076000;
i0 = 2/N;
n = 300;
b0 = b = B(4);
% druga procjena: CDC iz R_0=2.7 dobijemo b=0.192857
u = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0 = [s0;i0;r0];
[t2,y2] = Trapez(u,y0,t0,h,n);
y2=N*y2;
%y2(3,300)/N
%max(y2(2,:))/N
%y2(3,max(size(t3)))

fig1=figure(1)
P=plot(t2,y2(1,:),'-b',t2,y2(2,:),'-r',t2,y2(3,:),'-k');
set(P,'Linewidth',1.5');
axis([0 (n+1) 0 N]);
T=title(sprintf('b = %d, k = %d, R_0 = %d ', b,k,b/k));
set(T,'FontSize',16);
L=legend({'Izloženi','Zaraženi','Oporavljeni'});
set(L,'Location','East');
set(L,'FontSize',16);
grid on
xticks(0:50:300);


fig2=figure(2)
P=plot(0:n2-1,rh_k(1,:),'bk',t2,y2(2,:),'r');
set(P,'Linewidth',1.5');
axis([0 (n2+1) 0 1500]);
title('Zaraženi Hrvatska','FontSize',16);
L=legend({'podaci','projekcija'});
set(L,'Location','Northwest');
set(L,'FontSize',16);
grid on
xticks(0:2:n2+1);


% u 20. danu smo ukinuli škole pa u 30. "osjeæamo" uèinak??
fig3=figure(3)
p=zeros(1,47);
p(1:30)=y2(2,1:30);
b=0.65*b*y2(1,30)/N;

u = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0=[y2(1,30)/N;y2(2,30)/N;y2(3,30)/N];
[t3,y3] = Trapez(u,y0,t0,h,n);

%broj ukupno zaraženih y3(3,max(size(t3)))*N 
P=plot(t2,y2(2,:),'r',t3,N*y3(2,:),'b');
L=legend(sprintf('b=%d, b=%d',b0,b));
set(L,'Location','Northeast');
set(L,'FontSize',16);
set(P,'Linewidth',1.5');
grid on
xticks(0:50:300);

rez=zeros(1,n+1);
rez(1:30)=p(1:30);
rez(31:n+1)=N*(y3(2,2:n+1-29))';

fig4=figure(4)
P=plot(0:46,rez(1:47),'-b',0:46,rh_k(1,1:47),'-k');
set(P,'Linewidth',1.5');
L=legend({'projekcija','podaci'});
set(L,'Location','Northwest');
set(L,'FontSize',16);
axis([0 (n2+1) 0 1500]);
grid on
xticks(0:2:n2+1);

figure(6)
semilogy(rh_k(1,:))
grid on

% nova projekcija
y3=N*y3;
fig7=figure(7)
P=plot(t3,y3(1,:),'-b',t3,y3(2,:),'-r',t3,y3(3,:),'-k');
set(P,'Linewidth',1.5');
axis([0 (n+1) 0 N]);
T=title(sprintf('b = %d, k = %d, R_0 = %d ', b,k,b/k));
set(T,'FontSize',16);
L=legend({'Izloženi','Zaraženi','Oporavljeni'});
set(L,'Location','East');
set(L,'FontSize',16);
grid on
xticks(0:50:300);


% nova projekcija zraženih
fig8=figure(8)
P=plot(rez,'-b');
set(P,'Linewidth',1.5');
axis([0 (n+1) 0 N]);
T=title(sprintf('b = %d, k = %d, R_0 = %d ', b,k,b/k));
set(T,'FontSize',16);
L=legend({'Zaraženi'});
set(L,'Location','Northeast');
set(L,'FontSize',16);
grid on
xticks(0:50:300);

rez(1:47)
rh_k(1,:)
