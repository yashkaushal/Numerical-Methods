function x = sor ( A, b, xold, omega, TOL, Nmax )


n = length ( b );
[r c] = size ( A );
if ( c ~= n ) 
   disp ( 'sor error: matrix dimensions and vector dimension not compatible' )
   return
end;
xnew = zeros ( 1, n );

if ( nargout == 0 )
   s = sprintf ( '%3d \t %10f ', 0, xold(1) );
   for j = 2 : n 
	   s = sprintf ( '%s%10f ', s, xold(j) );
   end;
   disp ( s );
end;

for its = 1 : Nmax
    xnew(1) = ( 1 - omega ) * xold(1) + omega * ( b(1) - sum ( A(1,2:n) .* xold(2:n) ) ) / A(1,1);
	for i = 2 : n-1
	    xnew(i) = ( 1 - omega ) * xold(i) + omega * ( b(i) - sum ( A(i,1:i-1) .* xnew(1:i-1) ) - sum ( A(i,i+1:n) .* xold(i+1:n) ) ) / A(i,i);
	end;
	xnew(n) = ( 1 - omega ) * xold(n) + omega * ( b(n) - sum ( A(n,1:n-1) .* xnew(1:n-1) ) ) / A(n,n);
	
    if ( nargout == 0 )
	   s = sprintf ( '%3d \t %10f ', its, xnew(1) );
	   for j = 2 : n 
	       s = sprintf ( '%s%10f ', s, xnew(j) );
	   end;
	   disp ( s );
	end;

    conv = max ( abs ( xnew - xold ) );
	if ( conv < TOL )
	   x = xnew;
	   return
	else
	   xold = xnew;
	end;
end;
disp ( 'sor error: maximum number of iterations exceeded' );
if ( nargout == 1 ) x = xnew; end;
	   
