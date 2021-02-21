function y = detector(r, M)

    sm = zeros(M, 2);
    for m = 0:M-1
        sm(m+1,:) = [cos(2*pi*m/M), sin(2*pi*m/M)];
    end
    
    num_of_symbols = size(r, 1);
    y = zeros(1, num_of_symbols);

    for i = 1:num_of_symbols
        k = dsearchn(sm, r(i,:));
        y(i) = k-1;
    end

end
