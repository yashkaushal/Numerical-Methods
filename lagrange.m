function lp = lagrange ( xi, fi )

n = length ( xi );
m = length ( fi );

if ( n ~= m )
   disp ( 'lagrange error: number of ordinates and number of function values must be equal' )
   return
end

temp = [0];
for i = 1:n
    temp = temp + lagrange_poly ( xi, i ) * fi(i);
end


   lp = temp;
end
