function [t,y] = Euler_p (f,y0,t0,h,n)
T=t0+n*h;
t=linspace(t0,T,n+1);
y(:,1)=y0;
for i=1:n
  y(:,i+1) = y(:,i) + h*f(t(i)+h/2, y(:,i)+(h/2)*f(t(i),y(:,i)));
end

endfunction
