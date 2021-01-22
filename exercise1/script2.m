% A
[symbolsA, probA, strA] = sourceA();
[my_dict, my_avglen] = my_huffmandict(symbolsA, probA);
[dict, avglen] = huffmandict(symbolsA, probA);
isequal(dict, my_dict)

H = -sum(probA.*log2(probA));

my_codeA = my_huffmanenco(strA, my_dict);
codeA = huffmanenco(strA, dict);
isequal(my_codeA, codeA)

guessedStrA = my_huffmandeco(my_codeA, my_dict);
isequal(strA, guessedStrA)


% B
[~, ~, strB] = sourceB(1, 'alpha');

my_codeB = my_huffmanenco(strB, my_dict);
codeB = huffmanenco(strB, dict);
isequal(my_codeB, codeB)

guessedStrB = my_huffmandeco(my_codeB, my_dict);
isequal(strB, guessedStrB)
