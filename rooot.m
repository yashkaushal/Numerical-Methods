function [mid]=rooot(eq,a,b)
x=subs(eq,a);
y = subs(eq,b);

if(x*y<0)
  mid = (a+b)/2;
    d=subs(eq,mid);
    if(d*x<0)
       mid=(mid+a)/2;
       rooot(eq, a,mid)

   else
    mid=(mid+b)/2;
    rooot(eq, mid, b)
    
    
    end

%end
end