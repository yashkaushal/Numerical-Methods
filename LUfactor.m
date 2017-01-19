function [lu, pvt] = LUfactor ( A )


[nrow ncol] = size ( A );
if ( nrow ~= ncol )
   disp ( 'LUfactor error: Square coefficient matrix required' );
   return;
end;

%
%   initialize row pointers
%

for i=1:nrow
    pvt(i) = i;
end;

for i = 1 : nrow - 1

%
%   partial pivoting
%

	t =  min ( find ( abs(A(pvt(i:nrow),i)) == max(abs(A(pvt(i:nrow),i))) ) + i-1 );
    if ( t ~= i )
	   temp = pvt(i);
	   pvt(i) = pvt(t);
	   pvt(t) = temp;
	end;

%
%   terminate if matrix is singular
%

	if ( A(pvt(i),i) == 0 ) 
	   disp ( 'LUfactor error: coefficient matrix is singular' );
	   lu = A;
	   return
	end;
	
%
%   elimination steps
%

    for j = i+1 : nrow
	    m = -A(pvt(j),i) / A(pvt(i),i);
		A(pvt(j),i) = -m;
		A(pvt(j), i+1:nrow) = A(pvt(j), i+1:nrow) + m * A(pvt(i), i+1:nrow);
    end;
end;

lu = A;
