uses FastGraph, GraphABC;

// This example features GraphABC Module from FastPascal Unit Library.
// Draws a dekart coordinates system on screen and draws graphics of basic trigonometric functions.

// Этот пример показывает возможности модлуля GraphABC из библиотеки FastPascal.
// Рисует декартовую систему координат на экране и рисует графики базовых тригонометрических функций.

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
end.