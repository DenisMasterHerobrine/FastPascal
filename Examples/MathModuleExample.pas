uses FastPascal; 

// This example features Math Module from FastPascal Unit Library.
// Finds a factorial of a number.

// Этот пример показывает возможности модлуля Arrays из библиотеки FastPascal.
// Находит факториал числа.

var a: integer;
    b: real;

begin
  writeln('Введите число.');
  readln(a);
  writeln('Факториал числа ', a, ': ', FastPascal.factorial(a));
  
  writeln('Введите количество радиан.');
  readln(b);
  FastPascal.toDegrees(b);
  writeln('Угловая величина равна: ', b);
end.