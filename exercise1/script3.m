[symbolsB, probB, strB] = sourceB();
[my_dict, my_avglen] = my_huffmandict(symbolsB, probB);
[dict, avglen] = huffmandict(symbolsB, probB);
isequal(dict, my_dict)

my_code = my_huffmanenco(strB, my_dict);
code = huffmanenco(strB, dict);
isequal(my_code, code)

guessedStr = my_huffmandeco(my_code, my_dict);
isequal(strB, guessedStr)
