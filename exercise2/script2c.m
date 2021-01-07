x = sourceB();

min_value=-1; max_value=1;

for N=2:2:6
    [xq, centers] = my_quantizer(x, N, min_value, max_value);
    probs1 = get_probs(xq, length(centers));
    
    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    probs2 = get_probs(xq, length(centers));
end

% clear zeros from probability vectors
probs1 = probs1(probs1~=0);
probs2 = probs2(probs2~=0);

H1 = -sum(probs1.*log2(probs1));
H2 = -sum(probs2.*log2(probs2));


function probs = get_probs(xq, n_centers)
    centers_counter = zeros(1, n_centers);
        total = length(xq);
    for k=1:total
        centers_counter(xq(k)) = centers_counter(xq(k)) + 1;
    end

    probs = centers_counter./total;
end
