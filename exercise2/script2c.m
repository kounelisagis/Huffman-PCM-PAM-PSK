x = sourceB();

min_value=-1; max_value=1;

H1s = zeros(3,1);
H2s = zeros(3,1);
for N=2:2:6
    [xq, centers] = my_quantizer(x, N, min_value, max_value);
    probs1 = get_probs(xq, length(centers));
    probs1_t = theor_probs(x, centers, min_value, max_value);

    [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value);
    probs2 = get_probs(xq, length(centers));
    probs2_t = theor_probs(x, centers, min_value, max_value);

    % clear zeros from probability vectors
    probs1_hat = probs1(probs1~=0);
    probs2_hat = probs2(probs2~=0);

    H1s(N/2) = -sum(probs1_hat.*log2(probs1_hat));
    H2s(N/2) = -sum(probs2_hat.*log2(probs2_hat));
    break
end

% theoretical probabilities
function probs = theor_probs(x, centers, min_value, max_value)
    m = mean(x);
    sigma = var(x);
    pdf = @(x) (1/(sigma*sqrt(2*pi)))*exp(-0.5*((x-m)/sigma).^2);
    probs = [];
    probs(1) = integral(@(x) pdf(x), (max_value+centers(1))/2, max_value);
    for k=2:length(centers)-1
        probs(end+1) = integral(@(x) pdf(x), (centers(k)+centers(k+1))/2, (centers(k-1)+centers(k))/2);
    end
    probs(end+1) = integral(@(x) pdf(x), min_value, (min_value+centers(length(centers)))/2);
end


function probs = get_probs(xq, n_centers)
    centers_counter = zeros(1, n_centers);
    total = length(xq);
    for k=1:total
        centers_counter(xq(k)) = centers_counter(xq(k)) + 1;
    end

    probs = centers_counter/total;
end
