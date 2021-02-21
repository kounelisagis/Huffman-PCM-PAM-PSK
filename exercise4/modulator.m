function y = modulator(symbols, M, Tsymbol, fc, Es)
    
    g = sqrt((2 * Es) / Tsymbol);
    n = length(symbols);
    y = zeros(n,Tsymbol);

    t = 1:Tsymbol;

    for k = 1:n
        y(k,t) = cos((2*pi*symbols(k))/M)*g*cos(2*pi*fc*t) + ...
                 sin((2*pi*symbols(k))/M)*g*sin(2*pi*fc*t);
    end

end
