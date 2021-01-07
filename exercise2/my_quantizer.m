function [xq, centers] = my_quantizer(x, N, min_value, max_value)
    
    % limit signal's dynamic range
    for k=1:length(x)
        if x(k) < min_value
            x(k) = min_value;
        elseif x(k) > max_value
            x(k) = max_value;
        end
    end
    
    d = (max_value-min_value)/2^N;
    centers = NaN(2^N, 1);
    for k=1:length(centers)
        centers(k) = max_value - k*d + d/2;
    end
    
    xq = NaN(length(x), 1);
    for k=1:length(x)
        xq(k) = closest_center(centers, x(k));
    end
    
end
