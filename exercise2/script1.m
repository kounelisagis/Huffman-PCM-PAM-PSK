x = sourceA();

N=6; min_value=0; max_value=4;

[xq, centers] = my_quantizer(x, N, min_value, max_value);

my_x = centers(xq);
sqnr_db = get_sqnr(x, my_x);

% b

% oor = out of range
counter_oor = 0;
for k=1:length(x)
    if x(k) < min_value || x(k) > max_value
        counter_oor = counter_oor + 1;
    end
end

prob = counter_oor/length(x);
