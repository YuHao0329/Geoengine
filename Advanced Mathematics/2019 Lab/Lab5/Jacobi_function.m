function [A] = jacobipq(A,itermax,tol)

%[A] = jacobipq returns the converge diagonal matrix A 
%elements are the eigen value of the orginal input matrix A
%
%set 'itermax' for the max iterations of the function
%
%set 'tol' to set any value smaller than 'tol' during process to 0

A0 = A - diag(diag(A));
[r,c] = find(A0 == max(A0(:)));
p = r(1);
q = c(1);

for n = 1:itermax
    U = diag(ones(1,size(A,2)));
    %zeros(size(A,1),size(A,2));
    cot_2phi = (A(q,q) - A(p,p))/(2*A(p,q));
    tan_2phi = 1/cot_2phi;
    sec_2phi = sqrt(tan_2phi^2 + 1);
    cos_2phi = 1/sec_2phi;
    cos_phi = sqrt((cos_2phi + 1)/2);
    sin_phi = sqrt((1 - cos_2phi)/2);
    U(p,p) = cos_phi;
    U(q,q) = cos_phi;
    U(p,q) = sin_phi;
    U(q,p) = -sin_phi;
    %U = U - diag(diag(U)) + diag(ones(1,size(U,1)));
    
    A = U'*A*U;
    sym = A-A';
    if all(sym,'all') > tol
        error('A is not symmetric')
    end
    A(abs(A) < tol) = 0;
    
    A0 = A - diag(diag(A));
    [r,c] = find(abs(A0) == max(abs(A0(:))));
    p = r(1);
    q = c(1); 
end
end
