[symbolsA, probA, strA] = sourceA(2);

[my_dict, my_avglen] = my_huffmandict(symbolsA, probA);
[dict, avglen] = huffmandict(symbolsA, probA);
isequal(dict, my_dict)

my_code = my_huffmanenco(strA, my_dict);
code = huffmanenco(strA, dict);
isequal(my_code, code)

guessedStr = my_huffmandeco(my_code, my_dict);
isequal(strA, guessedStr)

H = -sum(probA.*log2(probA));
