clear
f1 = 0.05;
A1 = .5*10;
f2 = 0.075;
A2 = .5*sqrt(10);
f3 = 0.1;
A3 = .5;
fc = .25;
L = 1024;
fftL = 256;
freqs = (-(fftL/2)+1:(fftL/2))/fftL;
g=3;
%    try xrn; catch ME
       xrn =  (A1*sin( (1:1024) .* 2 .* pi .* f1)+A2*sin( (1:1024) .* 2 .* pi .* f2)+A3*sin( (1:1024) .* 2 .* pi .* f3));
%    end
% Lower Side Band:
% Hilbert Transform
% f is a vector of frequency band edges in pairs from 0 -> 1
f = [0.1 0.9];
a = [1 1];
% A is a real vector the same size as f which specifies the desired 
%   amplitude of the frequency response of the resultant filter 
b = firpm(63,f,a,'hilbert');
figure(2)
t=(1:length(b))/length(b);
subplot(3,1,1);fftPlot(freqs,b,fftL,'Magnitude Plot of Hilbert Transform')
subplot(3,1,2);
w = window(@kaiser,length(b))';
w=w./mean(w);
Xn = fftshift(fft(b.*w,fftL)/fftL);
Xn = angle(Xn);
Xn(2:end-1) = 2*Xn(2:end-1);
% length(f)
% length(Xn)
plot(freqs,Xn)
ylabel('dB')
xlabel('cycles/sample')
title('Phase Plot of Hilbert Transform')
subplot(3,1,3);plot(freqs(4/10*length(freqs):6/10*length(freqs)),Xn(4/10*length(freqs):6/10*length(freqs)))
ylabel('dB')
xlabel('cycles/sample')
title('Phase Plot of Hilbert Transform')



figure(1)
subplot(g,2,6); 
stem(b);
title('Hilbert transformer impulse response')
xlabel('time');ylabel('magnitude')

a = 55;
subplot(g,2,1); fftPlot(freqs,xrn(a:a+255),fftL,'Xr(n)')
xipn = conv(b,xrn);
xipn = xipn(64:end-64);
subplot(g,2,3); fftPlot(freqs,xipn(a:a+255),fftL,'Xi(n)')
xipnsin = xipn.*sin((1:1024-64) .* 2 .* pi .* fc);
subplot(g,2,5); fftPlot(freqs,xipnsin(a:a+255),fftL,'Xi(n)*sin(2*fc*pi*n)')

% Upper Side Band:

filt = firpm(63,[0,.1*2,.2*2,1],[1,1,0,0]);
figure(1)
xrpn = conv(filt, xrn);
xrpn = xrpn(64:end-64);
subplot(g,2,2); fftPlot(freqs,xrpn(a:a+255),fftL,'Xr`(n)')
xrpncos = xrpn.*cos((1:1024-64) .* 2 .* pi .* fc);
subplot(g,2,4); fftPlot(freqs,xrpncos(a:a+255),fftL,'Xr`(n)*cos(2*fc*pi*n)')

% end
figure(4)
lsb = xrpncos+xipnsin;
subplot(2,1,1); fftPlot(freqs,lsb(a:a+255),fftL,'LSB')
title('lower side band')

usb = xrpncos-xipnsin;
subplot(2,1,2); fftPlot(freqs,usb(a:a+255),fftL,'USB')
title('upper side band')

figure(3)
x=xrpn+j*xipn;
subplot(2,1,1);fftPlot(freqs,x(a:a+255),fftL,'X')
s=x.*exp(j*2*pi*fc*(1:length(x)));
subplot(2,1,2);fftPlot(freqs,s(a:a+255),fftL,'S')
