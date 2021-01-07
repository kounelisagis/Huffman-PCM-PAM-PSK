function [xq, centers, D] = Lloyd_Max(x, N, min_value, max_value)
    
    [~, centers] = my_quantizer(x, N, min_value, max_value);
    centers = [max_value; centers;  min_value];

    D = [];
    e = 10^(-16);
    
    while length(D) < 2 || abs(D(end) - D(end-1)) >= e

        xq = NaN(length(x), 1);
        centers_sums = zeros(length(centers), 1);
        centers_counters = zeros(length(centers), 1);
        distortion = 0;
        
        for k=1:length(x)
            my_center = closest_center(centers, x(k));
            centers_sums(my_center) = centers_sums(my_center) + x(k);
            centers_counters(my_center) = centers_counters(my_center) + 1;
            distortion = distortion + (abs(x(k) - centers(my_center)))^2;
            xq(k) = my_center;
        end
        
        D(end+1) = distortion/length(x);
        
        for k=2:length(centers)-1
            if centers_counters(k) ~= 0
                centers(k) = centers_sums(k)/centers_counters(k);
            end
        end

    end

end
