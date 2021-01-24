Lb = 20232;
bitstream = source(Lb);

symbol_orders={'bin' 'gray'};

set(gca, 'YScale', 'log')

hold on
xlabel('SNR')
ylabel('Error Probability')
title('BER')
% title('SER')

LegendString = cell(1,0);

for k=1:length(symbol_orders)
    symbol_order = symbol_orders{k};
    Ms = [4 8 16];

    if isequal(symbol_order, 'bin')
        Ms = [2 Ms];
    end

    for l=1:length(Ms)
        M = Ms(l);
        s = mapper(bitstream, M, symbol_order);
        y = modulator(s, M);
        
        SNRs = 0:5:40;
        BERs = NaN(1, length(SNRs));
%         SERs = NaN(1, length(SNRs));

        for m=1:length(SNRs)
            SNR = SNRs(m);

            y_temp = noiser(y, M, SNR, Lb);
            y_temp = demodulator(y_temp, M);
            bitstream_out = demapper(y_temp, M, symbol_order);

            BERs(m) = sum(bitstream-bitstream_out~=0)/Lb;

%             guessed_symbols = mapper(bitstream_out, M, symbol_order);
%             SERs(m) = sum(s-guessed_symbols~=0)/length(guessed_symbols);
        end
        
        plot(SNRs, BERs);
%         plot(SNRs, SERs);

        LegendString{end+1} = sprintf('M = %i, symbol order = %s', M, symbol_order);

    end
end

legend(LegendString)

hold off
