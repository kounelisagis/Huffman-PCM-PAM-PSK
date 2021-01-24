function y = modulator(x, M)
    
    Tsample = 10^-7; Tsymbol = 4*10^-6; fc = 2.5*10^6;
    
    symbol_samples = Tsymbol/Tsample;
    g = sqrt(2/Tsymbol);

    y = NaN(symbol_samples*length(x), 1);

    t = (1:symbol_samples)*Tsample;

    for k=1:length(x)
        s = x(k)*g*cos(2*pi*fc*t);
        pos = (k-1)*symbol_samples+1:k*symbol_samples;
        y(pos) = s;
    end
    
end
