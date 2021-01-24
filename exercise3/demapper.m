function bitstream = demapper(symbols, M, symbol_order)

    symbol_bit_size = log2(M);
    bitstream = NaN(1, length(symbols)*symbol_bit_size);
    dec_values = pamdemod(symbols,M,0,symbol_order); % detector
    
    for k=1:length(dec_values)
        binary_value = de2bi(dec_values(k), symbol_bit_size, 'left-msb');
        bitstream((k-1)*symbol_bit_size+1:k*symbol_bit_size) = binary_value;
    end
end
