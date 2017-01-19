function csc = cubic_clamped ( xi, fi, fpa, fpb )

%CUBIC_CLAMPED     compute the cubic spline interpolant, subject to 
%                  "clamped" boundary conditions, associated with a 
%                  given set of interpolating points and function values
%
%     calling sequences:
%             csc = cubic_clamped ( xi, fi, fpa, fpb )
%             cubic_clamped ( xi, fi, fpa, fpb )
%
%     inputs:
%             xi      vector containing the interpolating points
%                     (must be sorted in ascending order)
%             fi      vector containing function values
%                     the i-th entry in this vector is the function
%                     value associated with the i-th entry in the 'xi'
%                     vector
%             fpa     derivative value at left endpoint; i.e., xi(1)
%             fpb     derivative value at right endpoint; i.e., xi(n)
%
%     output:
%             csn     five column matrix containing the information which
%                     defines the "clamped" cubic spline interpolant
%                     - first column: interpolating points
%                     - second column: function values
%                     - third column: coefficients of linear terms
%                     - fourth column: coefficients of quadratic terms
%                     - fifth column: coefficients of cubic terms
%
%     NOTE:
%             to evaluate the "clamped" cubic spline interpolant apply
%             the routine SPLINE_EVAL to the output of this routine 
%

n = length ( xi );
m = length ( fi );

if ( n ~= m )
   disp ( 'number of ordinates and number of function values must be equal' )
   return
end

for i = 1 : n-1
    hi(i) = xi(i+1) - xi(i);
end
dd(1) = 2.0*hi(1);  dd(n) = 2.0*hi(n-1);
ri(1) = (3.0/hi(1))*(fi(2)-fi(1)) - 3.0 * fpa;
ri(n) = 3.0 * fpb - (3.0/hi(n-1))*(fi(n)-fi(n-1));
for i = 1 : n-2
    dd(i+1) = 2.0 * ( hi(i) + hi(i+1) );
	ri(i+1) = (3.0/hi(i+1))*(fi(i+2)-fi(i+1))-(3.0/hi(i))*(fi(i+1)-fi(i));
end

disp ( [dd' ri'] )
c = tridiagonal ( hi(1:n-1), dd, hi(1:n-1), ri );

d = zeros ( n,1 );
b = d;

for i = 1 : n-1
    d(i) = (c(i+1)-c(i))/(3.0*hi(i));
	b(i) = (fi(i+1)-fi(i))/hi(i) - hi(i)*(c(i+1)+2.0*c(i))/3.0;
end

if ( nargout == 0 )
   disp ( [ xi' fi' b c' d ] )
else
   csc = [ xi' fi' b c' d ];
end
