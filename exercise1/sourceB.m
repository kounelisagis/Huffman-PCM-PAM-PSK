function [symbols, prob, str] = sourceB(order, strOption)
    fileID = fopen('kwords.txt','r');
    str = fscanf(fileID, '%c');
    fclose(fileID);

    if exist('strOption','var') && isequal(strOption, 'alpha')
        str = str(ismember(str,('a':'z')));
    end
    
    [C,~,ic] = unique(str);
    s_counts = accumarray(ic,1);
    
    symbols = cell(1, length(C));
    
    for k=1:length(C)
        symbols{1,k} = C(k);
    end

    prob = s_counts./sum(s_counts);
    prob = prob';
    
    if exist('order','var') && order == 2
        newLength = length(symbols)^2-length(symbols);
        symbols2 = cell(1,newLength);
        prob2 = zeros(1,newLength);

        counter = 1;
        % 2nd order
        for k=1:length(symbols)
            for l=1:length(symbols)
                if k ~= l
                    symbols2{counter} =  [symbols{k}, symbols{l}];
                    prob2(counter) =  prob(k) * prob(l);
                    counter = counter + 1;
                end
            end
            symbols2{counter} = [symbols{k}, symbols{k}];
            prob2(counter) =  prob(k)^2;
            counter = counter + 1;
        end

        str2 = cell(1,floor(length(str)/2));
        for k=1:2:length(str)
            if k+1<=length(str)
                str2{round(k/2)} = str(k:k+1);
            end
        end
        
        symbols = symbols2;
        prob = prob2;
        str = str2;
    else % convert char array to cell array
        newStr = cell(1,length(str));
        for k=1:length(str)
            newStr{k} = str(k);
        end
        str = newStr;
    end
    
end