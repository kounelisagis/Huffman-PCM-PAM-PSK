function symbols = mapper(bitstream, M, symbol_order)
    
    symbol_bit_size = log2(M);
    dec_values = zeros(1, length(bitstream)/symbol_bit_size);

    for k=1:length(dec_values)
        start_pos = (k-1)*symbol_bit_size + 1;
        end_pos = k*symbol_bit_size;
        dec_value = bi2de(bitstream(start_pos:end_pos), 'left-msb');
        dec_values(k) = dec_value;
    end

    symbols = real(pammod(dec_values,M,0,symbol_order));

end
