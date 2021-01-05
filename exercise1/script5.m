[symbolsA, probA, ~] = sourceA(2);

[my_dict, my_avglen] = my_huffmandict(symbolsA, probA);
[dict, avglen] = huffmandict(symbolsA, probA);
isequal(dict, my_dict)


[~, ~, strB] = sourceB(2, 'alpha');

my_code = my_huffmanenco(strB, my_dict);
code = huffmanenco(strB, dict);
isequal(my_code, code)

guessedStr = my_huffmandeco(my_code,my_dict);
isequal(strB, guessedStr)


[symbolsB, probB, strB] = sourceB(2);

[my_dict, my_avglen] = my_huffmandict(symbolsB, probB);
[dict, avglen] = huffmandict(symbolsB, probB);
isequal(dict, my_dict)

my_code = my_huffmanenco(strB, my_dict);
code = huffmanenco(strB, dict);
isequal(my_code, code)

guessedStr = my_huffmandeco(my_code,my_dict);
isequal(strB, guessedStr)

