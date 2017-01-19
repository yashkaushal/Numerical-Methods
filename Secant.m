function c = Secant(f,a,b)

f1=subs(f,a);
f2=subs(f,b);
if f1*f2>0
    disp('Wrong intervals')
else
    c = (a*subs(f,b)-b*subs(f,a))/(subs(f,b)-subs(f,a));
    err = abs(subs(f,c));
    while err > 1e-4
        
        
            a = b;
        
            b = c;
         
    c = (a*subs(f,b)-b*subs(f,a))/(subs(f,b)-subs(f,a));
   err = abs(subs(f,c));
   disp(vpa(err,10))
    end
end