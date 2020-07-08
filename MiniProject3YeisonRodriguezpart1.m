
%part a
load('noisyECGMiniProject3');
figure (1)
plot(t,noisyECG);
xlabel('time (sec)');
ylabel('ECG signal');
title('Noisy ECG signal in the time domain');
%part b
Fs = 1000/max(t);
Ts = 1/Fs;
%part c
f = linspace(-Fs/2,Fs/2,length(noisyECG));
FreqSig = fft(noisyECG);
FreqSig = fftshift(FreqSig);
MagF = abs(FreqSig);
%Plot the magnitude spectrum of the noisyECG
figure (2);
plot(f,MagF);
xlabel('Frequency (Hz)');
ylabel('Magnitude Spectrum');

%Filter the signal. I used a low pass filter w/ Fpass = 9 & Fstop = 15,
%Astop = 80
Filtt = filter(Num2,1, noisyECG);
Filtf = fft(Filtt);
Filtf = fftshift(Filtf);
Mag2 = abs(Filtf);
%Graph the cleaned signal in time and frequency domain
figure (3);
subplot(2,1,1);
plot(t,Filtt);
title('Cleaned ECG signal in time domain');
ylabel('ECG signal');
xlabel('time');
subplot(2,1,2);
plot(f,Mag2);
xlim([-20 20]);
title('Cleaned ECG signal in frequency domain');
ylabel('Magnitude Spectrum');
xlabel('frequency (Hz)');
sgtitle('Clean ECG Signal')
