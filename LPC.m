[y,fs]=audioread('bye.wav');
audiowrite('bye1.wav',y,7418);
[y,fs1]=audioread('bye1.wav');
y=y(:,1); 
segmentlen = 100;
noverlap = 90;
NFFT = 128;
spectrogram(y,segmentlen,noverlap,NFFT,fs1,'yaxis')
title('Signal Spectrogram')
dt = 1/fs1;
I0 = round(0.1/dt);
Iend = round(0.6/dt);
x = y(I0:Iend);
x1 = x.*hamming(length(x));
preemph = [1 0.63];
x1 = filter(1,preemph,x1);
A = lpc(x1,8);
rts = roots(A);
rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));
[frqs,indices] = sort(angz.*(fs1/(2*pi)));
bw = -1/2*(fs1/(2*pi))*log(abs(rts(indices)));
nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) <400)
        formants(nn) = frqs(kk);
        nn = nn+1;
    end
end
Formants
