function [symbols, prob, str] = sourceA(order)
    symbols = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
    prob = [0.08200,0.01500,0.02800,0.04300,0.12581,0.02200,0.02000,0.06100,0.07000,0.00150,0.00770,0.04000,0.02400,0.06700,0.07500,0.01900,0.00095,0.06000,0.06300,0.09100,0.02800,0.00980,0.02400,0.00150,0.02000,0.00074];

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