function [t,y] = Trapez (f,y0,t0,h,n)
T=t0+n*h;
t=linspace(t0,T,n+1);
y(:,1)=y0;
for i=1:n
  %implicitno zadano u varijabli z = y(i+1)
  g = @(z)(y(:,i)+(h/2)*(f(t(i),y(:,i))+f(t(i+1),z))-z);
  y(:,i+1) = fsolve(g,y(:,i));
end
endfunction
