[y,Fs]=audioread('hmm.wav')%input your audio file name
y = y(:,1)
segmentlen = 100;
noverlap = 90;
NFFT = 128;

spectrogram(y,segmentlen,noverlap,NFFT,Fs,'yaxis')
title('Signal Spectrogram')
Fs = 7418;
dt = 1/Fs;

I0 = round(0.001/dt);%numerator is initial time in seconds
Iend = round(0.9/dt);% here numerator is final time till when formants have to be found

%Make sure that Iend lies within length of y, otherwise it says index out of range.

x = y(I0:Iend);
x1 = x.*hamming(length(x));
preemph = [1 0.63];
x1 = filter(1,preemph,x1);

A = lpc(x1,8);
rts = roots(A);
rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));
[frqs,indices] = sort(angz.*(Fs/(2*pi)));
bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));
nn = 1;

for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) <1000)
        formants(nn) = frqs(kk);
        nn = nn+1;
    end
end
formants
