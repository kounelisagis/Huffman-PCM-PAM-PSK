function [dict,avglen] = my_huffmandict(symbols,prob)

    if length(symbols) ~= length(prob)
       error('Wrong dimensions')
    end
    
    if ~isa(symbols,'cell')
        error('symbols must be a cell vector')
    end

    if ~isa(prob,'double')
        error('prob must be a double vector')
    end

    if sum(prob) ~= 1.0
       error('prob vector must sum to 1')
    end


    dict = cell(length(symbols),2);
    dict(:,1) = symbols;

    symbol_indices = num2cell(1:length(symbols));
    prob_copy = prob;
    
    while length(symbol_indices) > 1
        [prob,sort_indices] = sort(prob);
        symbol_indices = symbol_indices(sort_indices);
        
        team1 = symbol_indices{1}; team2 = symbol_indices{2};
        
        prob = [sum(prob(1:2)) prob(3:end)];
        symbol_indices = [{[team1 team2]} symbol_indices(3:end)];
        
        for k=1:length(team1)
            index = team1(k);
            dict{index, 2} = [ 1 , dict{index, 2} ];
        end

        for k=1:length(team2)
            index = team2(k);
            dict{index, 2} = [ 0 , dict{index, 2} ];
        end
    end
    
    avglen = 0;
    for k=1:length(dict)
        avglen = avglen + prob_copy(k)*length(dict{k, 2});
    end

end
