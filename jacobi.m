function x = jacobi ( A, b, xold, TOL, Nmax )


n = length ( b );
[r c] = size ( A );
if ( c ~= n ) 
   disp ( 'jacobi error: matrix dimensions and vector dimension not compatible' )
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
    xnew(1) = ( b(1) - sum ( A(1,2:n) .* xold(2:n) ) ) / A(1,1);
	for i = 2 : n-1
	    xnew(i) = ( b(i) - sum ( A(i,1:i-1) .* xold(1:i-1) ) - sum ( A(i,i+1:n) .* xold(i+1:n) ) ) / A(i,i);
	end;
	xnew(n) = ( b(n) - sum ( A(n,1:n-1) .* xold(1:n-1) ) ) / A(n,n);
	
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
disp ( 'jacobi error: maximum number of iterations exceeded' );
if ( nargout == 1 ) x = xnew; end;
	   
