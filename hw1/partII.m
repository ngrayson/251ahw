function [] = partII( hn, N, magaxis, phaseaxis)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
figure(4);
y=fftshift(fft(hn,N));
m=abs(y);
p=unwrap(angle(y));
subplot(2,2,1)
plot(0:.5/(N-1):.5,m);
title('Magnitude Response of H(k)');
grid
ylabel('response magnitude');
 
subplot(2,2,2);plot(0:.5/(N-1):.5,p); % plot angle
title('Phase response of H(k)');
grid
ylabel('phase');

y=fftshift(fft(hn,N)).^-1;
m=abs(y);
p=unwrap(angle(y));
subplot(2,2,3)
plot(0:.5/(N-1):.5,m);
title('Magnitude Response of H1(k)');
grid
ylabel('response magnitude');
xlabel('f [cycles/sample]');
 
subplot(2,2,4);plot(0:.5/(N-1):.5,p); % plot angle
title('Phase response of H1(k)');
grid
ylabel('phase');
xlabel('f [cycles/sample]');



h1n=ifft(fftshift(fft(hn,N)).^-1);
impulsePlot(h1n, 5, [-.5, 4.5, -0.75, 1.25], 'h1(n)');
zeroPlot(h1n,6,'H1(z)');
h1naug = augment(h1n, 256);
magphasePlot(h1naug,7,'H1(z)',magaxis,phaseaxis)


h2n = conv(hn,ifft(fftshift(fft(hn,2*N)).^-1));
impulsePlot(h2n, 8, [-.5, 4.5, -0.75, 1.25], 'h2(n)');
zeroPlot(h2n,9,'H2(z)');
h2naug = augment(h2n, 256);
magphasePlot(h2naug,10,'H2(z)',magaxis,phaseaxis)
end