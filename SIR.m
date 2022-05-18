function [y,t]=SIR (b,k,T,i0,N)
s0=1;
r0 = 0;
t0 = 0;
n = T;
h = 1;

g = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0 = [s0;i0;r0];

[t,y] = Trapez(g,y0,t0,h,n);
y=N*y;
plot(t,y(1,:),'d-r',t,y(2,:),'o-g',t,y(3,:),'s-k');
axis([0 (n+1) 0 N]);
T=title(sprintf('b = %d, k = %d, R_0 = %d ', b,k,b/k));
set(T,'FontSize',16);
L=legend({'Izloženi','Zaraženi','Oporavljeni'});
set(L,'Location','East');
set(L,'FontSize',16);
grid on

endfunction
