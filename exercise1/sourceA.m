function [symbols, prob, str] = sourceA(order)
    symbols = {'a','b','c','d','e','f','g','h','i','j','k','l',...
        'm','n','o','p','q','r','s','t','u','v','w','x','y','z'};
    prob = [0.0820,0.0150,0.0280,0.0430,0.1258,0.0220,0.0200,0.0610,...
        0.0700,0.0015,0.0076,0.0400,0.0240,0.0670,0.0750,0.0190,...
        0.0010,0.0600,0.0630,0.0910,0.0280,0.0098,0.0240,0.0015,0.0200,0.0008];
    
    indices = randsrc(10000,1,[1:length(symbols); prob]);
    str = [symbols{indices}];

    if exist('order','var') && order == 2
        newLength = length(symbols)^2-length(symbols);
        symbols2 = cell(1,newLength);
        prob2 = zeros(1,newLength);

        counter = 1;
        % 2nd order
        for k=1:length(symbols)
            for l=1:length(symbols)
                if k ~= l
                    symbols2{counter} =  strcat(symbols{k}, symbols{l});
                    prob2(counter) =  prob(k) * prob(l);
                    counter = counter + 1;
                end
            end
            symbols2{counter} = strcat(symbols{k}, symbols{k});
            prob2(counter) =  prob(k)^2;
            counter = counter + 1;
        end


        str2 = cell(1,round(length(str)/2));
        for k=1:2:length(str)
            str2{round(k/2)} = str(k:k+1);
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