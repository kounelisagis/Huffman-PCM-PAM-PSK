function y = noiser(x, M, SNR, Lb)
    y = awgn(x, SNR, 'measured');
end
