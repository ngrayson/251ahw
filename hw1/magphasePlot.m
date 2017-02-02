function [] = magphasePlot(ff, fignum, label, magaxis, phaseaxis)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
y = fftshift(fft(ff));
m=abs(y);
p=unwrap(angle(y));

figure(fignum)
subplot(2,1,1)
plot(0:.5/255:.5,m);
title(['Magnitude Response of augmented ' label]);
axis(magaxis)
grid
ylabel('response magnitude');
xlabel('f [cycles/sample]');
 
subplot(2,1,2);plot(0:.5/255:.5,p); % plot angle
title(['Phase response of augmented ' label]);
axis(phaseaxis)
grid
ylabel('phase');
xlabel('f [cycles/sample]');
end