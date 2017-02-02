% ECE 251A HW 1
% Nick Grayson
% Due 1/17/2017
clear;
n0 = 4;
magaxis=[0,.5,.25,2.25];
phaseaxis =[0,.5,-1,1];
hn = [1,0,0,0,-.5];
N1 = 16;
N2 = 64;
% A. Plot h(n)
impulsePlot(hn, 1, [-.5, 4.5, -0.75, 1.25], 'h(n)');
zeroPlot(hn,2,'H(z)');
hnaug = augment(hn, 256);
magphasePlot(hnaug,3,'H(z)',magaxis,phaseaxis)
% B
partII(hn,N1,magaxis,phaseaxis);
% C
partII(hn,N2,magaxis,phaseaxis);