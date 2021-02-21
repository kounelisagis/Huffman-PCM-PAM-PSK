function r = demodulator(x, Tsymbol, fc, Es)
    
    g = sqrt((2 * Es) / Tsymbol);

    t = 1:Tsymbol;
    y1 = g*cos(2*pi*fc*t)';
    y2 = g*sin(2*pi*fc*t)';

    r = [x*y1, x*y2];
    
end
