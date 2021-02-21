clear all
Lb = 100002;
bitstream = source(Lb);

Tsymbol = 40; fc = 1/4; Es = 1;
symbol_order = 'gray';

for M=[4,8]
    sm = mapper(bitstream, M, symbol_order);
    st = modulator(sm, M, Tsymbol, fc, Es);
    st = reshape(st.',1,[]); % convert matrix to row vector
    
    N = 2048;
    fshift_x = ((-N/2:N/2-1)/N)*2*pi;
    sum = zeros(1,N);
    for i=1:N:length(st)-N
        sum = sum + abs(fftshift(fft(st(i:i+N-1)))).^2;
    end
    
    semilogy(fshift_x, sum/floor(length(st)/N)); if M==4, hold on; end
end

legend('4-PSK','8-PSK');
title('Power Spectral Density');
xlabel('Frequency');
ylabel('Spectral Power Level (dB)');

hold off

