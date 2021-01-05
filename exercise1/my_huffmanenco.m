function code = my_huffmanenco(sig, dict)
    code = [];
    for k=1:length(sig)
        codeword = find_my_codeword(sig(k), dict);
        code = [code, codeword];
    end
end


function codeword = find_my_codeword(char, dict)
    codeword = NaN;
    for j = 1:length(dict)
         if( strcmp(char, dict{j, 1}) )
             codeword = dict{j, 2};
             break;
         end
    end
end
