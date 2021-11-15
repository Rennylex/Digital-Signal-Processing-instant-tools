function Zx = stzerocross(x, N)
M  =  length(x);
Zx  =  zeros(M,1);
Zx (N+1)=sum (abs (sign (x (2:N+1))–sign (x (1:N) ) ) )/ (2*N);
for (m= (N+2):M)
  Zx (m) = Zx (m-1) + (abs (sign (x (m) ) – sign (x (m-1) ) ) …
－abs(sign (x (m-N) ) – sign (x (m-N-1 ) ) ) )/ (2*N);
end

%Calculating Short-term zero-crossing rate
