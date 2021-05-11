x=[530,650,750,1000,1200,1360,1425];
a=[1899,2145,2582,2700,2575,2900,3600];
x=transpose(x);
a=transpose(a);

l=[620,710,800,1050,1300,1409,];
f=[2145,2930,1950,2495,2600,3995];
l=transpose(l);
f=transpose(f);

X = [ones(length(x),1) x];
b = X\a;

figure(1)
train = X*b;
title("Linear Regression on Training Data")
plot(x,train,'--')
hold on
plot(x,a,'o')
legend('linear regression','real values')
hold off

figure(2)
L = [ones(length(l),1) l];
test=L*b;
title("Linear Regression on Testing Data")
plot(l,test,'--')
hold on
plot(l,f,'o')
hold off
legend('linear regression','real values')

for i=1:length(train)
    rel_errortrain(i)=abs(train(i)-a(i))/a(i);
end
figure(3)
title("relative error and sqft")
plot(x,rel_errortrain);

for i=1:length(test)
    rel_error(i)=abs(test(i)-f(i))/f(i);
end
figure(4)
title("relative error and sqft")
plot(l,rel_error);

