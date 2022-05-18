b = 0.2606;
k = 1/14;
s0 = 1;
r0 = 0;
i0 = 2/1000000;
t0 = 0;
T = 250;
n = 250;
h = 1;
N = 1000000;
g = @(t,y)[-b*y(1)*y(2);b*y(1)*y(2)-k*y(2);k*y(2)]; 
y0 = [s0;i0;r0];

[t,y] = Euler(g,y0,t0,h,n);
[tp,yp] = Euler_p(g,y0,t0,h,n);
[tt,yt] = Trapez(g,y0,t0,h,n);

l=linspace(0,250,251);
[tm,ym] = ode45(g,l,y0);

fig=figure(1)
P=plot(t,N*y(1,:),'-r',tp,N*yp(1,:),'--k',tt,N*yt(1,:),':b',tm,N*ym(:,1),'-.m',t,N*y(2,:),'-r',tp,N*yp(2,:),'--k',tt,N*yt(2,:),':b',tm,N*ym(:,2),'-.m',t,N*y(3,:),'-r',tp,N*yp(3,:),'--k',tt,N*yt(3,:),':b',tm,N*ym(:,3),'-.m');
set(P,'Linewidth',1.5');
L=legend({'Euler','prošireni Euler','Trapezna', 'ODE45'});
set(L,'Fontsize',16);
grid on;
xticks(0:20:250);
saveas(fig,'figura1.jpg');
for i=1:max(size(t))
  e(i) = y(1,i)-ym(i,1);
end
norm(e)

%{
figure(2)
P=plot(t,y(1,:),'o-r',t,y(2,:),'o-b',t,y(3,:),'o-k');
axis([0 250 0 1]);
title('Eulerova metoda','fontsize',16);
grid on

figure(3)
plot(tp,yp(1,:),'o-r',tp,yp(2,:),'o-b',tp,yp(3,:),'o-k');
axis([0 250 0 1]);
title('Proširena Eulerova metoda','fontsize',16);
grid on

figure(4)
plot(tt,yt(1,:),'o-r',tt,yt(2,:),'o-b',tt,yt(3,:),'o-k');
axis([0 250 0 1]);
title('Trapezna metoda','fontsize',16);
grid on

figure(5)
plot(tm,ym(:,1),'o-r',tm,ym(:,2),'o-b',tm,ym(:,3),'o-k');
axis([0 250 0 1]);
title('ODE45','fontsize',16);
grid on
%}



