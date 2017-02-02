function [] = fftPlot( f, xn, l , name)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
w = window(@kaiser,length(xn))';
w=w./mean(w);
Xn = fftshift(fft(xn.*w,l)/l);
Xn = abs(Xn);
Xn(2:end-1) = 2*Xn(2:end-1);
% length(f)
% length(Xn)
plot(f,mag2db(Xn))
ylabel('dB')
xlabel('cycles/sample')
title(name)
end

