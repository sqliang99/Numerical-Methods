 
x=[530,650,750,1000,1200,1360,1425];
a=[1899,2145,2582,2700,2575,2900,3600];
n=length(x)-1;

 m = n - 1;
 h = zeros(1,m+1);
 for i = 0:m
   h(i+1) = x(i+2) - x(i+1);
 end

 aa = zeros(1,m+1);
 for i = 1:m
   aa(i+1) = 3.0*(a(i+2)*h(i)-a(i+1)*(x(i+2)-x(i))+a(i)*h(i+1))/(h(i+1)*h(i));
 end

 xl = zeros(1,n+1);
 xu = zeros(1,n+1);
 xz = zeros(1,n+1);
 xl(1) = 1;
 xu(1) = 0;
 xz(1) = 0;

 for i = 1:m
   xl(i+1) = 2*(x(i+2)-x(i))-h(i)*xu(i);
   xu(i+1) = h(i+1)/xl(i+1);
   xz(i+1) = (aa(i+1)-h(i)*xz(i))/xl(i+1);
 end

 xl(n+1) = 1;
 xz(n+1) = 0;
 b = zeros(1,n+1);
 c = zeros(1,n+1);
 d = zeros(1,n+1);
 c(n+1) = xz(n+1);

 for i = 0:m
   j = m-i;
   c(j+1) = xz(j+1)-xu(j+1)*c(j+2);
   b(j+1) = (a(j+2)-a(j+1))/h(j+1) - h(j+1) * (c(j+2) + 2.0 * c(j+1)) / 3.0;
   d(j+1) = (c(j+2) - c(j+1)) / (3.0 * h(j+1));
 end

%creat subintervals to draw the interpolation plots
t=zeros(1,1);
cubict=zeros(1,1);
j=1;
for i=1:n
    for k=x(i):x(i+1)
        t(j)=k;
        diff=t(j)-x(i);
        cubict(j)=a(i)+b(i)*diff+c(i)*diff^2+d(i)*diff^3;
        j=j+1;
    end
end

l=[530,620,650,710,750,800,1000,1050,1200,1300,1360,1409,1425];
f=[1899,2145,2145,2930,2582,1950,2700,2495,2575,2600,2900,3995,3600];


li=zeros(1,1);
j=1;

for i=1:n
    for k=1:2
        diff=l(j)-x(i);
        li(j)=a(i)+b(i)*diff+c(i)*diff^2+d(i)*diff^3;
        j=j+1;
    end
end

li(length(l))=a(length(a));

for i=1:length(li)
    rel_error(i)=abs(li(i)-f(i))/f(i);
end
figure(1)
title("relative error and sqft")
rel_error=nonzeros(rel_error);
lr=[620,710,800,1050,1300,1409];
plot(lr,rel_error);
figure(2)
title("cubic interpolation and true values")
plot(t,cubict)
hold on
plot(x,a,'o')
hold on
plot(l,f,'-x')
hold off