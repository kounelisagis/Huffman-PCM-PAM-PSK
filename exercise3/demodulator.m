function y = demodulator(x, M)
    
    Tsample = 10^-7; Tsymbol = 4*10^-6; fc = 2.5*10^6;
    
    symbol_samples = Tsymbol/Tsample;
    g = sqrt(2/Tsymbol);

    y = NaN(length(x)/symbol_samples, 1);
    
    t = (1:symbol_samples)*Tsample;

    for k=1:length(y)
        start_pos = (k-1)*symbol_samples + 1;
        end_pos = k*symbol_samples;
        temp_x = x(start_pos:end_pos).*g.*cos(2*pi*fc*t)';
        y(k) = sum(temp_x)*Tsample;
    end
    
end
