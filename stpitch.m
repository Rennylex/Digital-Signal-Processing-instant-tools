function Fp = stpitch(x,N,Pth,Zth,NFFT,R,Fs)
M = length(x);
N = 2*fix(N/2);
win = hann(N);
Fp = zeros(M,1);
 
voi = voiunvoi(x,N,Pth,Zth);
invoi = 0;
 
for (m=N:N/2:M)
  n1 = m-N+1:m-N/2;      
  n2 = m-N/2+1:m;        
  n  = [n1 n2];          
 
  if (any(~voi(n)))      
    if (invoi)            
      Fp(n1) = Fmax;     
      invoi  = 0;
    end
  else                    
    [HPSmax,Fmax] = max(abs(hpspectrum(x(n),NFFT,R)));
 
    if (invoi)            
      Fp(n) = Fp(n) + win*Fmax;
    else                 
      Fp(n) = Fmax*[ones(N/2,1) win(N/2+1:N)];
      invoi = 1;
    end
  end
end
 
wsave = warning; warning('off');
Fp = (Fp*Fs/NFFT).*(Fp./Fp);
warning(wsave);
