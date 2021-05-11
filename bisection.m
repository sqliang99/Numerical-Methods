function [root] = bisection(a,b,c,d,xl,xu,tol)
%xl is the lower bound of the guess interval
%xu is the upper bound of the guess interval
%tol is the tolerance level, ie we will stop if we don't get any
%significant improvement
xnew(1)=0;
xr=(xu+xl)/2;
    
    if f(a,b,c,d,xu)*f(a,b,c,d,xr)<0
        xl=xr;
    else
        xu=xr;
    end
    
if f(a,b,c,d,xl)*f(a,b,c,d,xr)<0
    xu=xr;
else
    xl=xr;
end
xnew(2)=xr;

i=2;

while abs((xnew(i)-xnew(i-1)))>tol
    
    xr=(xu+xl)/2;
    
    if f(a,b,c,d,xu)*f(a,b,c,d,xr)<0
        xl=xr;
    else
        xu=xr;
    end
    
    if f(a,b,c,d,xl)*f(a,b,c,d,xr)<0
        xu=xr;
    else
        xl=xr;
    end

    i=i+1;
    xnew(i)=xr;
end

root=xnew(length(xnew));

end

