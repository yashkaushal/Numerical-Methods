function y = neville ( xi, fi, t )

n = length ( xi );
m = length ( fi );

if ( n ~= m )
   disp ( 'neville error: number of ordinates and number of function values must be equal' )
   return
end

temp = fi;
for j = 2:n
    for i = n:-1:j
	    temp(i) = ( (t-xi(i-j+1))*temp(i) - (t-xi(i))*temp(i-1) ) / ...
		          ( xi(i) - xi(i-j+1) );
	end
end


   y = temp(n);
end
