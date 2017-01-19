function p = bisection(f,a,b)

f1=subs(f,a);
f2=subs(f,b);
if f1*f2>0 
    disp('Wrong intervals')
else
    p = (a + b)/2;
    err = abs(subs(f,p));
    while err > 1e-7
   if f1*subs(f,p)<0 
       b = p;
   else
       a = p;   
   end
    p = (a + b)/2; 
   err = abs(subs(f,p));
    end
end