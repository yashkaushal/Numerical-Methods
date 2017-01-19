function y = tridiagonal ( c, a, b, r )

%TRIDIAGONAL  solve a linear system with a tridiagonal coefficient matrix
%
%     calling sequence:
%             x = tridiagonal ( c, a, b, r )
%             tridiagonal ( c, a, b, r )
%
%     inputs:
%             c       vector containing the entries along lower diagonal 
%                     of the coefficient matrix
%             a       vector containing the entries along main diagonal 
%                     of the coefficient matrix
%             b       vector containing the entries along upper diagonal 
%                     of the coefficient matrix
%             r       right-hand side vector
%
%     output:
%             x       solution vector
%
%     NOTE:
%             the entries in the vectors c, a and b are assumed to be
%             numbered as follows:
%
%                 | a(1)  b(1)                                 |
%                 | c(1)  a(2)  b(2)                           |
%                 |       c(2)  a(3)  b(3)                     |
%                 | 	         .     .     .                 |
%                 | 			       .     .     .           |
%                 | 				         .     .    b(n-1) |
%                 | 					        c(n-1)  a(n)   |
%

n = length ( a );

%
%   factorization step
%

for i = 1 : n-1
    b(i) = b(i) / a(i);
	a(i+1) = a(i+1) - c(i) * b(i);
end

%
%   forward substitution
%

r(1) = r(1) / a(1);
for i = 2 : n
    r(i) = ( r(i) - c(i-1) * r(i-1) ) / a(i);
end

%
%   back substitution
%

for i = n-1 : -1 : 1
    r(i) = r(i) - r(i+1) * b(i);
end

if ( nargout == 0 )
   disp ( r )
else
   y = r;
end
