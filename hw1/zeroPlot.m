function [] = zeroPlot( ff, fignum, label )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
figure(fignum);
zplane(ff)
title(['Zero Locations of ' label]);
end