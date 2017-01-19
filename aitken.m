function [ R ] = aitken( f,x1)

format long 
y=inline(f);
x2=y(x1);
x3=y(x2);

delx1=x2-x1;
delx2=x3-x2;

del2x1=delx2-delx1;

R=x3-(delx2)^2/(del2x1);

end

