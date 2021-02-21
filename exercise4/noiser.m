function y = noiser(x, M, SNR, Lb, Tsymbol)
    sigma = sqrt(10^(-SNR/10)/(2*log2(M)));
    noise = sigma * randn( 1, (Lb/log2(M))*Tsymbol );
    y = x + noise;
end
