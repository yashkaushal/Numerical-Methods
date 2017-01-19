function p = FixedPointIteration(f,a)
syms x;
uint64 p

    p = (subs(f,a));
 %   last = p+1;
  %  while last-p> 1e-7
   %     last = p;
    for n=1:15
        a = p;
        p = (subs(f,a));
        

   disp(vpa(p,5))
    end
end