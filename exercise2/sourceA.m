function x = sourceA()
    M = 10000;
    t = (randn(M,1)+1i*randn(M,1))/sqrt(2);
    x = abs(t) .^ 2;
end
