function voi = voiunvoi(x,N,Pth,Zth)
% Short-time power Px and zero crossing Zx measures.
Px = stpower(x,N);
Zx = stzerocross(x,N);
% Compare estimates with threshold values.
voi = (Px>Pth*max(Px)) & (Zx<Zth);
% Shift the voi-flag N/2 samples to the left (middle sample in window).
voi = [voi(fix(N/2)+1:length(voi));voi(length(voi))*ones(fix(N/2),1)];

%Classifying voiced sound and unvoiced sound
