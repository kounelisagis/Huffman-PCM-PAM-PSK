Lb = 100002;
bitstream = source(Lb);

Tsymbol = 40; fc = 1/4; Es = 1;
symbol_order = 'gray';
SNRs = 0:2:16;

BERs = [];


for M=[4,8]
    sm = mapper(bitstream, M, symbol_order);
    st = modulator(sm, M, Tsymbol, fc, Es);
    st = reshape(st.',1,[]); % convert matrix to row vector

    my_BERs = [];
    for SNR=SNRs
        rt = noiser(st, M, SNR, Lb, Tsymbol); % this is the signal
        rt = reshape(rt, Tsymbol, length(rt)/Tsymbol)'; % convert row vector to matrix
        
        r = demodulator(rt, Tsymbol, fc, Es);
        sm_hat = detector(r, M);
        bitstream_out = demapper(sm_hat, M, symbol_order);
        my_BERs(end+1) = sum(bitstream-bitstream_out~=0)/Lb;
    end
    BERs = [BERs; my_BERs];

end

% theoretical BER for M = 4
BERs_4 = [];
for SNR=SNRs
    x = sqrt(2*10^(SNR/10));
    fun = @(t) exp( (-t.^2)/2 );
    Q = (1/sqrt(2*pi))*integral(fun,x,Inf);
    P4 = 2*Q*(1-0.5*Q);
    BERs_4(end+1) = P4;
end

% theoretical BER for M = 8
BERs_8 = [];
for SNR=SNRs
    sigma_squared = 10^(-SNR/10)/(2*log2(M));
    x = sin(pi/8)/sqrt(sigma_squared);
    fun = @(t) exp( (-t.^2)/2 );
    Q = (1/sqrt(2*pi))*integral(fun,x,Inf);
    P8 = 2*Q;
    BERs_8(end+1) = P8;
end

figure
semilogy(SNRs,BERs(1,:),'-x');
hold on;
semilogy(SNRs,BERs(2,:),'-o');
semilogy(SNRs,BERs_4,'-*');
semilogy(SNRs,BERs_8,'-s');


title('BER');
xlabel('SNR');
ylabel('Error Probability');
legend('M=4', 'M=8', 'M=4 theoretical', 'M=8 theoretical');
grid on

hold off;
