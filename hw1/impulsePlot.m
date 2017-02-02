function [] = impulsePlot(ff, fignum, axs, label)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
figure(fignum)
impz(ff)
title(['Impulse Response ' label]);
end