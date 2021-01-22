x = sourceA();

N=6; min_value=0; max_value=4;

[xq, centers] = my_quantizer(x, N, min_value, max_value);

my_x = centers(xq);
sqnr_db = get_sqnr(x, my_x);

distortion = 0;
for k=1:length(x)
    distortion = distortion + (x(k) - my_x(k))^2;
end
distortion = distortion/length(x);


% theoretical distortion
distortion_t = 0;
d = (max_value-min_value)/2^N;
for k=1:length(centers)
    fun = @(x) ((x-centers(k)).^2).*exp(-x);
    distortion_t = distortion_t + integral(@(x) fun(x),centers(k)-d/2, centers(k)+d/2);
end


% b
% oor = out of range
counter_oor = 0;
for k=1:length(x)
    if x(k) < min_value || x(k) > max_value
        counter_oor = counter_oor + 1;
    end
end

prob = counter_oor/length(x);
