function bitstream = demapper(symbols, M, symbol_order)

    symbol_bit_size = log2(M);
    bitstream = NaN(1, length(symbols)*symbol_bit_size);
    
    if (isequal(symbol_order, 'gray'))
        symbols = gray2bin(symbols, 'psk', M);
    end

    for k=1:length(symbols)
        binary_value = de2bi(symbols(k), symbol_bit_size, 'left-msb');
        bitstream((k-1)*symbol_bit_size+1:k*symbol_bit_size) = binary_value;
    end
    
end
