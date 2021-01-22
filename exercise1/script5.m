[symbolsA, probA, ~] = sourceA(2);

[my_dict, my_avglen] = my_huffmandict(symbolsA, probA);
[dict, avglen] = huffmandict(symbolsA, probA);
isequal(dict, my_dict)


[~, ~, strB1] = sourceB(2, 'alpha');

my_code1 = my_huffmanenco(strB1, my_dict);
code1 = huffmanenco(strB1, dict);
isequal(my_code1, code1)

guessedStr = my_huffmandeco(my_code1,my_dict);
isequal(strB1, guessedStr)


[symbolsB, probB, strB2] = sourceB(2);

[my_dict, my_avglen] = my_huffmandict(symbolsB, probB);
[dict, avglen] = huffmandict(symbolsB, probB);
isequal(dict, my_dict)

my_code2 = my_huffmanenco(strB2, my_dict);
code2 = huffmanenco(strB2, dict);
isequal(my_code2, code2)

guessedStr = my_huffmandeco(my_code2,my_dict);
isequal(strB2, guessedStr)
