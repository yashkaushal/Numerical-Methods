function p = Regular_falsi(f,a,b)

f1=subs(f,a);
f2=subs(f,b);
if f1*f2>0
    disp('Wrong intervals')
else
    p = (a*subs(f,b)-b*subs(f,a))/(subs(f,b)-subs(f,a));
    err = abs(subs(f,p));
    while err > 1e-4
        
        if subs(f,p)>0
            b = p;
        else
            a = p;
        end 
    p = (a*subs(f,b)-b*subs(f,a))/(subs(f,b)-subs(f,a));
   err = abs(subs(f,p));
   disp(vpa(err,10))
    end
end