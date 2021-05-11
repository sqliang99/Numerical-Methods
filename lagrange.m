function [yp]=lagrange(xp,x,y)
n=length(x)-1;
sm=0;
for i = 1:n+1
    pr=1;
    for j = 1:n+1
        if j ~=i
            pr=pr.*(xp-x(j))/(x(i)-x(j));
        end
    end
    sm=sm+y(i)*pr;
end
yp=sm;
end