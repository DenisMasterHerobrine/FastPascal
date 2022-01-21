uses FastPascal, GraphABC;

// This example features File Module from FastPascal Unit Library.
// Read a random file, then cleans it from random symbols, provided as input and outputs an array of words.

// Этот пример показывает возможности модлуля File из библиотеки FastPascal.
// Генеририует случайно заполненный в Integer диапазоне массив выбранной длины и показывает минимальное и максимальное значение элементов вместе с содержимым массива.

begin
  GraphABC.MaximizeWindow; // TODO: Fix incorrect rendering when file have lots of lines.
  writeln(FastPascal.readFile('E:\FastPascal\Pascal School Tasks\Examples\Sochinenie_Dirty_OBJ.txt', Encoding.UTF8));
  
end.
