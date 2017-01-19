function p = aitkens(f,a)
syms x;
uint64 p

    p = (subs(f,a));
   x1=0;x2=0;x3=0;
    for n=1:15
        a = p;
        p = (subs(f,a));
        x1=x2;
        x2=x3;
        x3=p;
        
        if n>3
        delx1=x2-x1;
        delx2=x3-x2;

        del2x1=delx2-delx1;

        R=x3-(delx2)^2/(del2x1);
        disp('aitken:'+(vpa(R,5)))
        end
   disp(vpa(p,5))
    end
end