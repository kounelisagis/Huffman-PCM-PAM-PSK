function symbols = mapper(bitstream, M, symbol_order)
    
    symbol_bit_size = log2(M);
    symbols = zeros(1, length(bitstream)/symbol_bit_size);

    for k=1:length(symbols)
        start_pos = (k-1)*symbol_bit_size + 1;
        end_pos = k*symbol_bit_size;
        dec_value = bi2de(bitstream(start_pos:end_pos), 'left-msb');
        symbols(k) = dec_value;
    end
    
    if (isequal(symbol_order, 'gray'))
        symbols = bin2gray(symbols, 'psk', M);
    end

end
