clear all
clc

A = [9 -3 2 1 2;
    -3 2 1 8 2;
     2 1 -4 -4 1;
     1 8 -4 4 1;
     2 2 1 1 10];
A0 = A - diag(diag(A));
[r,c] = find(A0 == max(A0(:)));
p = r(1);
q = c(1);
itermax = 200;
valve = zeros(1,size(A,1));
for a = 1:size(A,1)
    valve(a) = a + (a-1)*size(A,1);
end
iter = 0;
for n = 1:itermax
    U = zeros(size(A,1),size(A,2));
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
    U = U - diag(diag(U)) + diag(ones(1,size(U,1)));
    
    A = U'*A*U;
    iter = iter + 1;
    A(abs(A) < 1e-10) = 0;
    f = transpose(find(abs(A) >= 1e-04));
    if size(f,2) == size(valve,2)
        if f == valve
            break
        end
    end
        
    A0 = A - diag(diag(A));
    [r,c] = find(abs(A0) == max(abs(A0(:))));
    p = r(1);
    q = c(1);
end