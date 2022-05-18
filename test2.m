%%zadnji update 28.3.2020. Italija (od 15.2.)
it(1,:)=[3,0,0,0,0,1,17,58,78,72,94,147,185,234,239,573,335,466,587,769,778,1247,1487,1797,977,2313,2651,2547,3497,3590,3233,3526,4207,5322,5986,6557,5560,4789,5249,5210,6203,5909,5974];
it(2,:)=[0,0,0,0,0,0,1,1,0,1,1,1,42,1,4,33,66,11,116,138,109,66,33,102,280,41,213,181,527,369,414,192,1084,415,689,943,952,408,894,1036,999,589,1434];
d=[0,0,0,0,0,0,1,1,1,4,4,1,5,4,8,12,11,27,28,41,49,36,133,97,168,196,189,250,175,368,349,345,457,427,627,793,651,601,743,683,712,919,889];
it(2,:)=it(2,:)+d;
n1 = max(size(it));
it_k = zeros(2,n1); it_k(1,1) = it(1,1);
for i = 2:n1
  it_k(1,i)=it_k(1,i-1)+it(1,i)-it(2,i);
  it_k(2,i)=it_k(2,i-1)+it(2,i);
end
r0 = 0;
s0 = 1;
t0 = 0;
h = 1;
k = 1/14;
B = @(x)(2.^(1/x)-1+k);

%% ITALIJA
N=60480000;
i0 = 3/N;
n = 500; 
b = B(2.6);
g = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0 = [s0;i0;r0];
[t1,y1] = Trapez(g,y0,t0,h,n);
y1=N*y1;

figure(1)
P=plot(t1,y1(1,:),'-b',t1,y1(2,:),'-r',t1,y1(3,:),'-k');
set(P,'Linewidth',2');
axis([0 (n+1) 0 N]);
T=title(sprintf('b = %d, k = %d, R_0 = %d ', b,k,b/k));
set(T,'FontSize',16);
L=legend({'Izloženi','Zaraženi','Oporavljeni'});
set(L,'Location','East');
set(L,'FontSize',16);
grid on

figure(2)
P=plot(1:n1, it_k(1,:),'bk',t1,y1(2,:),'r');
set(P,'Linewidth',2');
axis([0 (n1+1) 0 max(it_k(1,:))]);
title('Zaraženi Italija','FontSize',16);
L=legend({'podaci','projekcija'});
set(L,'Location','Northwest');
set(L,'FontSize',16);
grid on

figure(3)
p=zeros(1,43);
p(1:30)=y1(2,1:30);
b=0.5*b*y1(1,30)/N;
u = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0=[y1(1,30)/N;y1(2,30)/N;y1(3,30)/N];
[t3,y3] = Trapez(u,y0,t0,h,n);

%broj ukupno zaraženih y3(3,max(size(t3)))*N 
P=plot(t1,y1(2,:),'r',t3,N*y3(2,:),'b');
N*max(y3(2,:))
set(P,'Linewidth',2');
rez=zeros(1,31);
rez(1:30)=p(1:30);
rez(31:43)=N*y3(2,2:14);

figure(4)
P=plot(1:43,rez,'-b',1:43,it_k(1,1:43),'-k');
set(P,'Linewidth',2');
it_k(1,:)
rez

figure(5)
semilogy(it_k(1,:))
grid on
