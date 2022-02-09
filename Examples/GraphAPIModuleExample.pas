uses FastGraph, GraphABC;

// This example features GraphABC Module from FastPascal Unit Library.
// Draws a dekart coordinates system on screen and draws graphics of basic trigonometric functions.

// Этот пример показывает возможности модлуля GraphABC из библиотеки FastPascal.
// Рисует декартовую систему координат на экране и рисует графики базовых тригонометрических функций.
var x1: integer;

begin
  // Вызов процедуры для того, чтобы отобразить систему координат.
  FastGraph.drawCoordinateSystem;
  
  // Вызов процедуры draw() для функции sin(x) зелёным цветом.
  FastGraph.drawSinFunction(FastGraph.Green);
  
  // Вызов процедуры draw() для функции cos(x).
  FastGraph.drawCosFunction(FastGraph.DarkBlue);
  
  // Вызов процедуры draw() для функции tg(x).
  FastGraph.drawTanFunction(FastGraph.DarkGreen);
  
  // Вызов процедуры draw() для функции ctg(x).
  FastGraph.drawCotanFunction(FastGraph.Magenta);
  
  // Вызов процедуры draw() для произвольной функции.
  for x1:=1 to 640 do FastGraph.drawFunction(cos(x1)+2/12, FastGraph.Red);
end.