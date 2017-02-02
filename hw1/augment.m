function newvar = augment(vect,n)
%augments zeros to a vector out to n
    newvar = [vect,zeros(1,n-length(vect))];
end