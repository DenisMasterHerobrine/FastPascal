unit FastGraph;
uses FastPascal, GraphABC;

var
    // Module: GraphAPI Color Map Library
    Red: System.Drawing.Color := rgb(163, 11, 3);
    Yellow: System.Drawing.Color := rgb(235, 231, 7);
    Green: System.Drawing.Color := rgb(23, 191, 26);
    Blue: System.Drawing.Color := rgb(12, 165, 207);
    Pink: System.Drawing.Color := rgb(250, 125, 227);
    Magenta: System.Drawing.Color := rgb(207, 12, 207);
    DarkGreen: System.Drawing.Color := rgb(6, 99, 8);
    DarkBlue: System.Drawing.Color := rgb(4, 118, 135);
    LightRed: System.Drawing.Color := rgb(230, 165, 165);
    Black: System.Drawing.Color := rgb(0, 0, 0);

// Module: GraphAPI

/// Создаёт на экране GraphABC.NET декартовую систему координат.
procedure drawCoordinateSystem();
var
  x: integer;
  y: integer;
  
  begin
  // Base
  GraphABC.Line(0,240,640,240, FastGraph.Black);
  GraphABC.Line(320,0,320,480, FastGraph.Black);
  GraphABC.Line(640,240,635,235, FastGraph.Black);
  GraphABC.Line(640,240,635,245, FastGraph.Black);
  GraphABC.Line(320,0,325,5, FastGraph.Black);
  GraphABC.Line(320,0,315,5, FastGraph.Black);
  
  GraphABC.TextOut(630,250,'x');
  GraphABC.TextOut(325,10,'y');
  GraphABC.TextOut(310,245,'0');
  
  // Lines
  for x:=1 to 15 do
    line(x*40,238,x*40,242);
  for y:=1 to 11 do
    line(318,y*40,322,y*40);
  end;

/// Рисует в созданной декартовой системе координат график функции sin(x). Выводит значение sin(x) в параметр F.
procedure drawSinFunction();
var
  x: integer;
function f(x:real):real;
  begin
    Result:=sin(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), FastGraph.Black)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции sin(x). Окращен в определённый цвет color. Выводит значение sin(x) в параметр F.
procedure drawSinFunction(var color: System.Drawing.Color);
var
  x: integer;
function f(x:real):real;
  begin
    Result:=sin(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), color)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции cos(x). Выводит значение cos(x) в параметр F.
procedure drawCosFunction();
var
  x: integer;
function f(x:real):real;
  begin
    Result:=cos(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), FastGraph.Black)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции cos(x). Окращен в определённый цвет color. Выводит значение cos(x) в параметр F.
procedure drawCosFunction(var color: System.Drawing.Color);
var
  x: integer;
function f(x:real):real;
  begin
    Result:=cos(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), color)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции tg(x). Выводит значение tg(x) в параметр F.
procedure drawTanFunction();
var
  x: integer;
function f(x:real):real;
  begin
    Result:=tan(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), FastGraph.Black)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции tg(x). Окращен в определённый цвет color. Выводит значение tg(x) в параметр F.
procedure drawTanFunction(var color: System.Drawing.Color);
var
  x: integer;
function f(x:real):real;
  begin
    Result:=tan(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), color)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;
  

/// Рисует в созданной декартовой системе координат график функции ctg(x). Выводит значение ctg(x) в параметр F.
procedure drawCotanFunction();
var
  x: integer;
function f(x:real):real;
  begin
    if (tan(x) <> 0) and (sin(x) <> 0)
    then f:= 1/tan(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), FastGraph.Black)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

/// Рисует в созданной декартовой системе координат график функции ctg(x). Окращен в определённый цвет color. Выводит значение ctg(x) в параметр F.
procedure drawCotanFunction(var color: System.Drawing.Color);
var
  x: integer;
function f(x:real):real;
  begin
    if (tan(x) <> 0) and (sin(x) <> 0)
    then f:= 1/tan(x);
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), color)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

// TODO: Add a proper implementation of this.
/// Рисует график произвольной функции. Выводит значение функции в параметр F. В параметрах drawFunction() указать саму функцию. Например, если необходимо начертить график функции y=sin(x) - укажите "sin(x)".
procedure drawFunction(logicalParameter: real; color: System.Drawing.Color);
var
  x: integer;
function f(x:real):real;
  begin
    Result:=logicalParameter;
  end;
  
  begin
  // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), color)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;

// fix: Empty Body of a library unit to compile it easily.
begin
end.