function [] = partB()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f1 = 0.05;
A1 = 3;
f2 = 0.075;
A2 = 2;
f3 = 0.1;
A3 = 1;
fc = .25;
L=1024;
xrn =  (A1*sin( (1:1024) .* 2 .* pi .* f1)+A2*sin( (1:1024) .* 2 .* pi .* f2)+A3*sin( (1:1024) .* 2 .* pi .* f3));
% figure(1);
% subplot(2,2,1);
% plot(xrn);
% subplot(2,2,2);
% plot(20.*log(abs(fft(xrn))));
% Xrn = [zeros(1,41);0:.025:1]';
% Xrn(3,1) = 1;
% Xrn(4,1) = 1;
% Xrn(5,1) = 1;
% subplot(2,2,4);
% plot(Xrn);
% subplot(2,2,3);
% plot(abs(ifft(Xrn,1024)));
figure(1)
Xrn = fft(xrn,1024);
subplot(4,2,1); plot(xrn);
P2 = abs(Xrn);
subplot(4,2,3);plot(P2)
P2=P2/L;
P1 = P2(1:L/2+1);
subplot(4,2,5);plot(P1)
P1(2:end-1)= 2*P1(2:end-1);
subplot(4,2,7);plot(P1)
f = (0:(L/2))/L;
% subplot(2,2,1)
% plot(xrn)
% subplot(2,2,2)
% plot(P2);

f2 = 1:L/2;
Xrn2 = zeros(1,L/2);
Xrn2(52) = A1;
Xrn2(78) = A2;
Xrn2(103) = A3;
subplot(4,2,8);plot(f2,Xrn2)
Xrn2=Xrn2/2;
subplot(4,2,6);plot(f2,Xrn2)
Xfin=Xrn2*L;
Xfin = [Xfin , fliplr(Xfin)];
subplot(4,2,4);plot(Xfin)
subplot(4,2,2);plot(ifft(Xfin,'symmetric'))

% f is a vector of frequency band edges in pairs from 0 -> 1
f = [0 0.04 0.05 0.1 0.15 1];
a = [0 0.00 1.00 1.0 0.00 0];
% A is a real vector the same size as f which specifies the desired 
%   amplitude of the frequency response of the resultant filter 
b = firpm(64,f,a,'hilbert');
[h,w] = freqz(b,1,256);
plot(f,a,w/pi,abs(h))
end

