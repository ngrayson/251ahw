disp('3.8')
pb=.01;
pnb=1-pb;
palb=.99;
palnb=.05;
pnalnb=1-palnb;
pwla=.9;
pnwla=1-pwla;
pwlna=.5;
pnwlna=1-pwlna;
pgla=.7;
pngla=1-pgla;
pglna = .2;
pnglna = 1 - pglna;
pnalb = 1 - palb;
disp('1b')
pbwng=pb*(pngla*pwla*palb+pnglna*pwlna*pnalb)
pnbwng=pnb*(pngla*pwla*palnb+pnglna*pwlna*pnalnb)
pwng=pbwng+pnbwng
pblwng=pbwng/pwng
disp('2a')
png=.9
pnw=.7
disp('we want pblW')
pnbw=pb*(palnb*pwla+pnalnb*pwlna)
pbw=pb*(palb*pwla+pnalb*pwlna)
pw=pnbw+pbw
pblw=pbw/pw
pwlW=.3
pnwlW=.7
pblW=pblnw*pnwlW+pblw*pwlW
