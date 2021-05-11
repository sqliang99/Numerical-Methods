
t=[530,650,750,1000,1200,1360,1409];
y=[1899,2145,2582,2700,2575,2900,3995];

N=length(t);%total number of points
n=N-1;%number of subintervals

h=(t(N)-t(1))/n; %step size
Trid=diag(4*ones(1,n-1))+diag(ones(1,n-2),1)+diag(ones(1,n-2),-1);

for i = 1:n-1 %finding the value on the RHS
    z(i)=6/h^2 * (y(i+2)-2*y(i+1)+y(i));
end

tz=transpose(z);
w=inv(Trid)*tz
sigma=[0;w;0]

for i=1:n
    d(i)=y(i);
    b(i)=sigma(i)/2;
    a(i)=(sigma(i+1)-sigma(i))/(6*h);
    c(i)=(y(i+1)-y(i))/h - h/6 *(2*sigma(i)+sigma(i+1));
end

r=2; %number of subsubintervals
hh=h/r; %stepsize of subsubintervals

x=t(1):hh:t(N);

%x=[530,650,710,750,800,1000,1200,1300,1346,1360,1409];
%real=[1899,2145,2930,2582,1950,2700,2575,2600,3765,2900,3995];

for i=1:n
    for j=r*(i-1)+1:r*i
        s(j)=a(i)*(x(j)-t(i))^3+b(i)*(x(j)-t(i))^2+c(i)*(x(j)-t(i))+d(i);
    end
end

s(r*n+1)=y(N);

plot(t,y,'o')
hold on
plot(x,s,'-x')
hold off



