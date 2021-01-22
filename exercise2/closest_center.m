function pos = closest_center(centers, val)
    min = abs(centers(1)-val);
    pos = 1;
    
    for k=2:length(centers)
        if abs(centers(k)-val) < min
           min = abs(centers(k)-val);
           pos = k;
        end
    end
end
