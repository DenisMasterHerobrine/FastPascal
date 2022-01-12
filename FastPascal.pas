unit FastPascal;
uses GraphABC;

// FastPascal Unit Library.
// Licensed under MIT License.
// @author Denis Kalashnikov (DenisMasterHerobrine)
// https://github.com/DenisMasterHerobrine/FastPascal

// TODO: Сортировка массива по возрастанию и убыванию
// TODO: Решение квадратных уравнений.
// TODO: Графики функций со встраиваемой функцией и системой координат.

var Delimiter: string := ' ';

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
    
// Module: Unified Constants
const tinyArrSize = 10;
const smallArrSize = 100;
const mediumArrSize = 1000;
const hugeArrSize = 10000;
const extremeArrSize = 100000;
const ultimateArrSize = 1000000;

// Module: Unified Types
type IntTinyArray = array [1..tinyArrSize] of integer;
type IntSmallArray = array [1..smallArrSize] of integer;
type IntMediumArray = array [1..mediumArrSize] of integer;
type IntHugeArray = array [1..hugeArrSize] of integer;
type IntExtremeArray = array [1..extremeArrSize] of integer;
type IntUltimateArray = array [1..ultimateArrSize] of integer;

type LongTinyArray = array [1..tinyArrSize] of longint;
type LongSmallArray = array [1..smallArrSize] of longint;
type LongMediumArray = array [1..mediumArrSize] of longint;
type LongHugeArray = array [1..hugeArrSize] of longint;
type LongExtremeArray = array [1..extremeArrSize] of longint;
type LongUltimateArray = array [1..ultimateArrSize] of longint;

type StrTinyArray = array [1..tinyArrSize] of string;
type StrSmallArray = array [1..smallArrSize] of string;
type StrMediumArray = array [1..mediumArrSize] of string;
type StrHugeArray = array [1..hugeArrSize] of string;
type StrExtremeArray = array [1..extremeArrSize] of string;
type StrUltimateArray = array [1..ultimateArrSize] of string;

// Module: Integer
/// Меняет местами два числа типа Integer.
procedure swap(var I,J: integer);
  var Temp: integer;
      begin
        Temp:=I;
        I:=J;
        J:=Temp
      end;
      
/// Находит наибольшее значение среди двух чисел.
function findMax(var I,J: integer): integer;
   begin
      if (I > J) 
        then 
          FindMax:=I
        else 
          FindMax:=J
    end;
    
// Module: Arrays
/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647]
procedure fillArray(var a: IntUltimateArray; n: integer);
begin
  for var i:=1 to n do
    a[i] := Random(-maxint+1, maxint-1);
end;

/// Выводит массив
procedure writeArray(const a: IntUltimateArray; n: integer);
begin
  for var i:=1 to n do
    write(a[i], Delimiter);
  writeln;  
end;

/// Возвращает минимальный элемент в массиве
function findMinInArray(const a: IntUltimateArray; n: integer): integer;
begin
  Result := a[1];
  for var i:=1 to n do
    if Result>a[i] then 
      Result := a[i];
end;

/// Возвращает максимальный элемент в массиве
function findMaxInArray(const a: IntUltimateArray; n: integer): integer;
begin
  Result := a[1];
  for var i:=1 to n do
    if Result<a[i] then 
      Result := a[i];
end;

// Module: Math

/// Возвращает факториал числа типа BigInteger.
function factorial(j: Integer): BigInteger;
var
  i: integer;
  f: BigInteger;

begin
for i := 0 to j do
begin
  if (i=0) or (i=1) then
    f:=1
      else
       f:=f*i;
       end;
  Result:=f;
end;

/// Возвращает факториал числа типа Integer. Невозможно определить факториал числа, большего чем 16.
function factorialInt(j: Integer): integer;
var
  i,f: integer;

begin
for i := 0 to j do
begin
  if (i=0) or (i=1) then
    f:=1
      else
       f:=f*i;
       end;
  Result:=f;
end;

// Module: GraphAPI

/// Создаёт на экране GraphABC.NET декартовую систему координат.
procedure drawCoordinateSystem();
var
  x: integer;
  y: integer;
  // Base
  begin
  
  GraphABC.Line(0,240,640,240, FastPascal.Black);
  GraphABC.Line(320,0,320,480, FastPascal.Black);
  GraphABC.Line(640,240,635,235, FastPascal.Black);
  GraphABC.Line(640,240,635,245, FastPascal.Black);
  GraphABC.Line(320,0,325,5, FastPascal.Black);
  GraphABC.Line(320,0,315,5, FastPascal.Black);
  
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
    then lineto(x,round(240-40*f((x-320)/40)), FastPascal.Black)
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
    then lineto(x,round(240-40*f((x-320)/40)), FastPascal.Black)
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
    then lineto(x,round(240-40*f((x-320)/40)), FastPascal.Black)
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
    then lineto(x,round(240-40*f((x-320)/40)), FastPascal.Black)
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

/// Рисует график произвольной функции. Выводит значение функции в параметр F. В параметрах drawFunction() указать саму функцию. Например, если необходимо начертить график функции y=sin(x) - укажите "sin(x)".
procedure drawFunction();
var
  x: integer;
function f(x:real):real;
  begin
    Result:=1;
  end;
  
  begin
    // Move function location
  moveto(0,round(240-40*f((x-320)/40)));
  
  // Draw the function.
  for x:=1 to 640 do
    if (round(240-40*f((x-320)/40)) > 0)
    then lineto(x,round(240-40*f((x-320)/40)), FastPascal.Black)
    else moveto(x,round(240-40*f((x-320)/40)));
  end;
  
// fix: Empty Body of a library unit to compile it easily.
begin
end.