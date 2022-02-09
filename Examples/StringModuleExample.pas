uses FastPascal; 

// This example features String Module from FastPascal Unit Library.
// Finds if is there any repeated symbols in the string. If it finds one, it prints "true". If not - "false".

// Этот пример показывает возможности модлуля String из библиотеки FastPascal.
// Находит, есть ли в строке повторяющийся символ, если находит, тогда возвращает "true", если нет - "false"

var s: string;

begin
  s:='exist';
  writeln(FastPascal.isRepeatedSymbolsExist(s));
  s:='not exist ?';
  writeln(FastPascal.isRepeatedSymbolsExist(s));
end.