% I
% IA
% IA1
x1=rand(1,1024)';
% IA2
x2=randn(1,1024)';

% IB
figure(1)
subplot(2,1,1);hist(x1);title('Histogram of Flat distributed vars. x1');
ylabel('Number of Samples');
subplot(2,1,2);hist(x2);title('Histogram of Gaussian distributed vars. x2');
ylabel('Number of Samples');xlabel('Bins');

% IC
figure(2)
[autocor1, lags1]=xcorr(x1(1:256),'biased');subplot(2,1,1);stem(lags1(256-15:256+15),autocor1(256-15:256+15)); 
title('Autocorrelation of x1');ylabel('magnitude');
[autocor2, lags2]=xcorr(x2(1:256),'biased');subplot(2,1,2);stem(lags2(256-15:256+15),autocor2(256-15:256+15));
title('Autocorrelation of x2');ylabel('magnitude');xlabel('lags');

% II
% IIA
% IIA1
fftL = 256;
f = (-(fftL/2)+1:(fftL/2))/fftL;

hn=[ones(1,8) zeros(1,248)];
figure(3); zplane(hn);title('Poles and Zeroes in Z-Plane of FIR Low Pass Filter');
% IIA2
figure(4); fftPlot(f,hn,256,'FFT of FIR LPF');

% IIB1
x2p=conv(x2,hn);
figure(5);
subplot(2,1,1);plot(x2(1:256)); 
title('x2');ylabel('Magnitude');
subplot(2,1,2);plot(x2p(1:256));
title('x2`');ylabel('Magnitude');xlabel('time');

% IIB2
figure(6)
[autocor2p, lags2p]=xcorr(x2p(1:256),'biased');subplot(2,1,1);stem(lags2p(256-15:256+15),autocor2p(256-15:256+15));
title('Autocorrelation of x2`');ylabel('magnitude');
[autocor2p, lags2p]=xcorr(x2p(1:256),x2(1:256),'biased');subplot(2,1,2);stem(lags2p(256-15:256+15),autocor2p(256-15:256+15));
title('Crosscorrelation of x2 and x2`');ylabel('magnitude');xlabel('lags');