function y = nf_eval ( xi, nf, t )

n   = length ( t );
deg = length(nf) - 1;

y = nf(deg+1) * ones(1,n);
for j = deg : -1 : 1
	y = y .* ( t - xi(j) * ones(1,n) ) + nf(j) * ones(1,n);
end