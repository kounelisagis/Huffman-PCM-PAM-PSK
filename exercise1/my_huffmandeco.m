function sig = my_huffmandeco(code,dict)
    left = 1;
    right = 1;
    sig = {};
    
    while right <= length(code)
        temp_codeword = code(left:right);

        symbol = find_my_symbol(temp_codeword, dict);
        if strcmp(symbol, '')
            right = right + 1;
        else % symbol found
            sig{end+1} = symbol;
            left = right + 1;
            right = left;
        end
    end
end


function symbol = find_my_symbol(codeword, dict)
    symbol = '';
    for j = 1:length(dict)
         if( isequal(codeword, dict{j, 2}) )
             symbol = dict{j, 1};
             break;
         end
    end
end
        
