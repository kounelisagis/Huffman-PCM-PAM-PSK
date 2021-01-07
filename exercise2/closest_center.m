% function pos = closest_center(centers, d, val)
%     % Returns index of arr that is closest to val. If several entries
%     % are equally close, return the first.
%     % ===============
%     % Parameter list:
%     % ===============
%     % arr : increasingly ordered array
%     % val : scalar in R
%     left = 1;
%     right = length(centers);
%     pos = NaN;
%     % Binary search for index
%     while right - left >= 0
%         mid = floor((left+right)/2);
% 
%         if abs(centers(mid) - val) <= d/2
%             pos = mid;
%             break;
%         elseif val < centers(mid)
%             left = mid + 1;
%         else
%             right = mid - 1;
%         end
%     end
% end

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
