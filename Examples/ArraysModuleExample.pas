uses FastPascal; 

// This example features Arrays Module from FastPascal Unit Library.
// Generates a random filled array and writes into console and finds minimum and maximum of elements.

// Этот пример показывает возможности модлуля Arrays из библиотеки FastPascal.
// Генеририует случайно заполненный в Integer диапазоне массив выбранной длины и показывает минимальное и максимальное значение элементов вместе с содержимым массива.

var a: IntUltimateArray;
    size: integer;

begin
  writeln('Введите количество элементов в массиве.');
  readln(size);
  assert(size<=ultimateArrSize,'Размер массива должен быть <='+Size.ToString);
  fillArray(a, size);
  writeln('Содержимое массива: ');
  writeArray(a, size);
  writeln('Минимальный элемент: ', FastPascal.findMinInArray(a, size));
  writeln('Максимальный элемент: ', FastPascal.findMaxInArray(a, size));
end.
