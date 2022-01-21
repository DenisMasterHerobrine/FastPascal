uses FastPascal, GraphABC;

// This example features GraphABC Module from FastPascal Unit Library.
// Draws a dekart coordinates system on screen and draws graphics of basic trigonometric functions.

// Этот пример показывает возможности модлуля GraphABC из библиотеки FastPascal.
// Рисует декартовую систему координат на экране и рисует графики базовых тригонометрических функций.

begin
  // Вызов процедуры для того, чтобы отобразить систему координат.
  FastPascal.drawCoordinateSystem;
  
  // Вызов процедуры draw() для функции sin(x) зелёным цветом.
  FastPascal.drawSinFunction(FastPascal.Green);
  
  // Вызов процедуры draw() для функции sin(x).
  FastPascal.drawCosFunction(FastPascal.DarkBlue);
  
  // Вызов процедуры draw() для функции sin(x).
  FastPascal.drawTanFunction(FastPascal.DarkGreen);
  
  // Вызов процедуры draw() для функции sin(x).
  FastPascal.drawCotanFunction(FastPascal.Magenta);
end.