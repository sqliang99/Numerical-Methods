diamonds=readtable('diamonds.csv','HeaderLines',1);
price=diamonds{:,1};
caret=diamonds{:,2};
depth=diamonds{:,3};
x_length=diamonds{:,4};
y_length=diamonds{:,5};
z_length=diamonds{:,6};

X = [ones(length(price),1) x_length depth caret];
Xtr=transpose(X);
b = inv(Xtr*X)*Xtr*price;

train=X*b;
b
top=0;
bottom=0;
for i=1:length(price)
    top=top+(price(i)-train(i))^2;
    bottom=bottom+(price(i)-mean(price))^2;
end

R_squared=1-(top/bottom);
R_squared