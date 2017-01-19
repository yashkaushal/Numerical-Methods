function p = newton(f,a,b)
syms x;
f1=subs(f,a);
f2=subs(f,b);
if f1*f2>0
    disp('Wrong intervals')
else
    p = a - (subs(f,a))/(subs(diff(f,x),a));
    last = p+1;
    while last-p> 1e-7
        
        last = p;
        a = p;
        p = a - (subs(f,a))/(subs(diff(f,x),a));
        

   disp(vpa(last,10))
    end
end