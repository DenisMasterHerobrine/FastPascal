uses FastPascal; 

// This example features Math Module from FastPascal Unit Library.
// Finds a factorial of a number.

// Этот пример показывает возможности модлуля Arrays из библиотеки FastPascal.
// Находит факториал числа.

var a: integer;

begin
  writeln('Введите число.');
  readln(a);
  writeln('Факториал числа ', a, ': ', FastPascal.factorial(a));
end.