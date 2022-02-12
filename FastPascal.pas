unit FastPascal;

// FastPascal Unit Library.
// Licensed under MIT License.
// @author Denis Kalashnikov (DenisMasterHerobrine)
// https://github.com/DenisMasterHerobrine/FastPascal

// TODO: Решение квадратных уравнений.
// TODO: Скобочная последовательность, с учётом <(>)

const CC: string[16] = '0123456789ABCDEF';

var DELIMITER: string := ' ';
    TESTSTRING: string := '/*TEMPLATE_STRING_FOR_TESTING_PURPOSES!!!*/';
    EPSILON: real := 0.0000000000001;
    
    // Module: FastMath Library
    DEGREES_TO_RADIANS: real := 0.017453292519943295;
    RADIANS_TO_DEGREES: real := 57.29577951308232;
    SQRT2: real := 1.41421356237309;
    
// Module: Unified Constants
const tinyArrSize = 10;
const smallArrSize = 100;
const mediumArrSize = 1000;
const hugeArrSize = 10000;
const extremeArrSize = 100000;
const ultimateArrSize = 1000000;

const glasn_RU = 'АОУИЫЭЕЁЮЯаоуиыэеёюя';
const soglasn_RU = 'БВГДЖЗЙКЛМНПРСТФХЦЧШЩбвгджзйклмнпрстфхцчшщ';
const glasn_EN = 'AEIOUYaeiouy';
const soglasn_EN = 'BCDFGHJKLMNPQRSTVWXYZbcdfghjklmnpqrstvwxyz';

// Module: Unified Types
type IntTinyArray = array [1..tinyArrSize] of integer;
type IntSmallArray = array [1..smallArrSize] of integer;
type IntMediumArray = array [1..mediumArrSize] of integer;
type IntHugeArray = array [1..hugeArrSize] of integer;
type IntExtremeArray = array [1..extremeArrSize] of integer;
type IntUltimateArray = array of integer;

type LongTinyArray = array [1..tinyArrSize] of longint;
type LongSmallArray = array [1..smallArrSize] of longint;
type LongMediumArray = array [1..mediumArrSize] of longint;
type LongHugeArray = array [1..hugeArrSize] of longint;
type LongExtremeArray = array [1..extremeArrSize] of longint;
type LongUltimateArray = array of longint;

type StrTinyArray = array [1..tinyArrSize] of string;
type StrSmallArray = array [1..smallArrSize] of string;
type StrMediumArray = array [1..mediumArrSize] of string;
type StrHugeArray = array [1..hugeArrSize] of string;
type StrExtremeArray = array [1..extremeArrSize] of string;
type StrUltimateArray = array of string;

type CleanedArrayOutput = record
     CleanedArray: StrUltimateArray;
     Length: integer;
     end;

// Module: Integer
/// Переводит число из десятичной системы счисления в любую другую, указанную параметром divider и возвращает его типом string.
function changeNotation(var defaultNumber:integer; divider:integer):string;
var
  ConvertedToCCValue:string; 
begin
readln(defaultNumber, divider);
ConvertedToCCValue:='';
while defaultNumber > 0 do
 begin
      ConvertedToCCValue := CC[defaultNumber mod divider+1] + ConvertedToCCValue;
      defaultNumber := defaultNumber div divider;
 end;
 Result := ConvertedToCCValue;
end;

// Module: Arrays
/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647], где n - количество чисел в массиве.
procedure fillArray(var a: IntUltimateArray; n: integer);
begin
  SetLength(a, n);
  for var i:=1 to n-1 do
    a[i] := Random(-maxint+1, maxint-1);
end;

/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647], где n - количество чисел в массиве, min - минимальное значение сгенерированного числа, max - максимальное значение сгенерированного числа.
procedure fillArray(var a: IntUltimateArray; n, min, max: integer);
begin
  SetLength(a, n);
  if (min > -maxint+1) and (min < maxint) and (max < maxint-1) and (max > -maxint+1)
  then for var i:=1 to n-1 do
    a[i] := Random(min, max);
end;

/// Выводит массив до n-ного элемента
procedure writeArray(var a: IntUltimateArray; n: integer);
begin
  SetLength(a, n);
  for var i:=1 to n-1 do
    write(a[i], Delimiter);
  writeln;
end;

/// Возвращает минимальный элемент в массиве
function findMinInArray(var a: IntUltimateArray; n: integer): integer;
begin
  SetLength(a, n);
  Result := a[1];
  for var i:=1 to n do
    if Result>a[i] then 
      Result := a[i];
end;

/// Возвращает максимальный элемент в массиве
function findMaxInArray(var a: IntUltimateArray; n: integer): integer;
begin
  SetLength(a, n);
  Result := a[1];
  for var i:=1 to n do
    if Result<a[i] then 
      Result := a[i];
end;

/// Находит сумму n чисел в массиве типа BigInteger.
function sum(var a: IntUltimateArray; n: integer): BigInteger;
var b: BigInteger;
begin
  for var i:=1 to n-1 do
    b := b + a[i];
  Result := b;
end;

/// Выводит арифметическую прогрессию из n чисел, с шагом d и первым членом прогрессии a1.
procedure printArithmeticProgression(n: integer; a1, d: real);
var i:integer;
    a:array of real;
begin
  SetLength(a, n);
  a[0] := a1;
  for i:=1 to N-1 do
    a[i] := a[i-1] + d;
  for i:=0 to N-1 do
    write(a[i],' ');
end;

/// Создаёт арифметическую прогрессию из n чисел, с шагом d и первым членом прогрессии a1 и выдаёт в виде массива чисел типа integer.
function generateArithmeticProgression(n: integer; a1, d: integer): array of integer;
var i:integer;
    a:array of integer;
begin
  SetLength(a, n);
  a[0] := a1;
  for i:=1 to N-1 do
    a[i] := a[i-1] + d;
  Result := a;
end;

/// Создаёт арифметическую прогрессию из n чисел, с шагом d и первым членом прогрессии a1 и выдаёт в виде массива чисел типа real.
function generateArithmeticProgression(n: integer; a1, d: real): array of real;
var i:integer;
    a:array of real;
begin
  SetLength(a, n);
  a[0] := a1;
  for i:=1 to N-1 do
    a[i] := a[i-1] + d;
  Result := a;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(a: array of integer; n: integer): boolean;
var len: integer;
begin
  len := length(a);
  Result := False;
  for var i:=0 to len do
    if a[i] = n then 
    begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(a: array of real; n: integer): boolean;
var len: integer;
begin
  len := length(a);
  Result := False;
  for var i:=0 to len do
    if a[i] = n then 
    begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(a: array of real; n: real): boolean;
var len: integer;
begin
  len := length(a);
  Result := False;
  for var i:=0 to len-1 do
    if a[i] = n then 
    begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(a: array of string; n: string): boolean;
var len: integer;
begin
  len := length(a);
  Result := False;
  for var i:=0 to len-1 do
    if a[i] = n then 
    begin
      Result := True;
      break
    end;
end;

/// Вставляет в массив элемент n, который будет стоять на index месте.
procedure insertIntoArray(var a: array of integer; n: integer; index: integer);
var i, l: integer;
begin
    SetLength(a, length(a)+1);
    for i := length(a)-2 downto index do
        a[i+1] := a[i];
    a[index] := n;
end;

/// Вставляет в массив элемент n, который будет стоять на index месте.
procedure insertIntoArray(var a: array of real; n: real; index: integer);
var i, l: integer;
begin
    SetLength(a, length(a)+1);
    for i := length(a)-2 downto index do
        a[i+1] := a[i];
    a[index] := n;
end;

/// Вставляет в массив строку s, которая будет стоять на index месте.
procedure insertIntoArray(var a: array of string; s: string; index: integer);
var i, l: integer;
begin
    SetLength(a, length(a)+1);
    for i := length(a)-2 downto index do
        a[i+1] := a[i];
    a[index] := s;
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
  if (i=0) or (i=1) 
  then f:=1
  else f:=f*i;
end;
  Result:=f;
end;

/// @Deprecated
/// Возвращает факториал числа типа Integer. Невозможно определить факториал числа, большего чем 16 этим методом.
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

/// Конвертирует градусы в радианы.
procedure toRadians(var angdeg: real);
begin
  angdeg := angdeg * DEGREES_TO_RADIANS;
end;

/// Конвертирует радианы в градусы.
procedure toDegrees(var angrad: real);
begin
  angrad := angrad * RADIANS_TO_DEGREES;
end;

/// Находит корни квадратного уравнения и возвращает в виде параметров m и n, если корни существует, то вернёт true параметром f, иначе вернёт false, если корни не удалось найти.
procedure findSquaredRoots(a,b,c:real; var m,n:real; f:boolean);
var d:real;
begin
  f:=true;
  d:=b*b-4*a*c;
  if d<0 then f:=false;
  if (d=0)
    then begin
    n:=-b/2*a;
    m:=-b/2*a;
  end
end;

/// Находит НОД двух чисел m и n.
function findGreatestCommonDivider(m,n:integer):integer;
  begin
  while m*n<>0 do
    if m>n then m:=m mod n
           else n:=n mod m;
    if n=0 then Result := m
           else Result := n;
  end;

/// Определяет, является ли число простым. Выводит true, если число простое. Если число не является простым - выводит false.
function isSimple(N:integer):boolean;
var i:integer;
begin
  Result := true;
  for i:=2 to n div 2 do
    if n mod i = 0 then Result := false;
end;

/// Определяет, является ли данное число палиндромом
function isPalindrome(a: integer):boolean;
var b,c:integer;
begin
b:=a;
c:=0;
while b>0 do
 begin
  c:=c*10+(b mod 10);
  b:=b div 10;
 end;
 if c=a then Result:=true;
end;

/// Определяет, является ли число n числом Фибоначчи. 
function isFibonacciNumber(n: integer):boolean;
var
  a, b, c, i: integer;

begin
  b := 1;
  c := b;
  for i := 1 to trunc(power(n, 2)) do
  begin
    a := c;
    c := b;
    b := a + b;
    if (n = a) then
    begin
      Result := true;
      a := -1;
      break;
    end;
    if (a > n) then
    begin
      Result := false;
      break;
    end;
  end;
end;

// Module: File
/// Считывает файл с диска в кодировке UTF-16 до конца файла. Выводит содержимое файла типа string.
function readFile(filePath: string): string;
var
  txt: Text;
begin
  assignFile(txt, filePath);
  reset(txt);
  Result:=txt.ReadToEnd;
end;

/// Считывает файл с диска в кодировке encoding до конца файла. Выводит содержимое файла типа string.
function readFile(filePath: string; encoding: System.Text.Encoding): string;
var
  txt: Text;
  s: Object;
begin
  assignFile(txt, filePath);
  reset(txt, encoding);
  Result:=txt.ReadToEnd;
end;

/// Удаляет один или несколько типов символов из строки uncleanedString, находящиеся в параметре remove типа String. Возвращает массив, состоящий из комбинаций строк, состоящих из символов, которые были не удалены и разделены пробелом в unclearedString. 
function clean(uncleanedString, remove: string): CleanedArrayOutput;
var
  cleaned: StrUltimateArray;
  i, n: integer;
begin
  uncleanedString:=uncleanedString+' ';
  setLength(cleaned, mediumArrSize);
  
  for i:= 1 to length(uncleanedString) do
  begin
    if (pos(uncleanedString[i], remove) > 0)
      then uncleanedString[i] := ' ';
  end;
  while pos('  ', uncleanedString) > 0 do
  begin
    delete(uncleanedString, pos('  ', uncleanedString), 1)
  end;
  if (uncleanedString[1] = ' ')
    then delete(uncleanedString, 1, 1);
  n:=0;
  while (uncleanedString <> '') do
  begin
    n:=n+1;
    cleaned[n]:=copy(uncleanedString, 1, pos(' ', uncleanedString)-1);
    delete(uncleanedString, 1, pos(' ', uncleanedString));
  end;
  Result.CleanedArray := cleaned;
  Result.Length := n;
end;

// Module: String
/// Проверяет, повторяются ли символы в строке.
function isRepeatedSymbolsExist(s: string): boolean;
var i, j, k: integer;
    c:char;
    a:array[''..'ࠀ'] of integer;
begin
  for c:='' to 'ࠀ' do
  begin
    a[c]:=0;
  end;
  for i:=1 to length(s) do a[s[i]]:=a[s[i]]+1;
    k:=0;
  for c:='' to 'ࠀ' do
    if a[c]>1 then inc(k);
  if (k <> 0)
    then Result := true
    else Result := false;
end;

/// Проверяет строку на соблюдение баланса скобочной последовательности. Также определяет, соблюдена ли скобочная последовательность. Если скобочная последовательность соблюдена - возвращает true, иначе - false.
function isBracketsBalanced(s: string): boolean;
var
  str: string;
  i,s1,s2: integer;
  fl:boolean;
begin
  s1:=0; 
  s2:=0;
  
  for i:=1 to length(s) do  {}
  begin
    if (s[i]='(') or (s[i]='{') or (s[i]='[') or (s[i]='<') then s1:=s1+1;
    if (s[i]=')') or (s[i]='}') or (s[i]=']') or (s[i]='>') then s2:=s2+1;
    if s2 > s1 then fl:=true;
  end;
  
  if (s1=s2) and (fl=false) 
    then Result := true
    else Result := false;
end;

// Module: Array Sorters
/// Сортирует все элементы массива по алфавиту, сравнивая только первый символ элемента.
procedure sortAlphabeticallyByFirstChar(unsortedArray: array of String);
var
  i, j, n: integer;
  s: string[20];
  arr: array of String;
begin
  for i:= 1 to unsortedArray.Length-1 do
  begin
    if (unsortedArray[i] <> '')
      then inc(n);
  end;
  for i:=1 to N-1 do
        for j:=1 to N-i do
            if unsortedArray[j][1] > unsortedArray[j+1][1]
            then begin
                s := unsortedArray[j];
                unsortedArray[j] := unsortedArray[j+1];
                unsortedArray[j+1] := s;
            end;
end;

/// Сортирует все элементы массива по алфавиту.
procedure sortAlphabetically(unsortedArray: array of String);
var
  i, j, n: integer;
  s: string;
begin
  for i:= 1 to unsortedArray.Length-1 do
  begin
    if (unsortedArray[i] <> '')
      then inc(n);
  end;
  for i:=n-1 downto 1 do
    for j:=1 to i-1 do
      if unsortedArray[j] > unsortedArray[j+1]
            then begin
                s := unsortedArray[j];
                unsortedArray[j] := unsortedArray[j+1];
                unsortedArray[j+1] := s;
            end;
end;

/// Сортирует все элементы в параметре типа String по алфавиту.
procedure sortAlphabeticallyInElement(var s: string);
var
  i,j,n:integer;
  c: char;
begin
  n := length(s);
  for i:=n downto 1 do
    for j:=1 to i-1 do
      if (s[j] > s[j+1])
           then begin
                c := s[j];
                s[j] := s[j+1];
                s[j+1] := c;
            end;
        write(s, ' ');
end;

// Module: Unused
// Этот модуль не рекомендуется к использованию.

/// @Deprecated
/// Сдвигает все гласные буквы в строке влево, а согласные - вправо.
procedure moveLetters(s: string);
var
  i,j,n:integer;
  c: char;
begin
  n := length(s);
  for i:=n downto 1 do
    for j:=1 to i-1 do
      if (pos(s[j], FastPascal.glasn_RU) = 0) and (pos(s[j+1], FastPascal.glasn_RU) > 0) or (pos(s[j], FastPascal.glasn_EN) = 0) and (pos(s[j+1], FastPascal.glasn_EN) > 0)
           then begin
                c := s[j];
                s[j] := s[j+1];
                s[j+1] := c;
            end;
        write(s, ' ');
end;

/// @Deprecated
/// Переворачивает строку задом наперёд.
procedure reverseLetters(s: string);
var
  i,j,n:integer;
  c: char;
begin
  n := length(s);
  for i:=n downto 1 do
    for j:=1 to i-1 do
            begin
                c := s[j];
                s[j] := s[j+1];
                s[j+1] := c;
            end;
        write(s, ' ');
end;

/// @Deprecated
/// Выводит строку, содержащую хотя бы 2 совпадающих буквы.
procedure writeWordWithTwoLetters(var s: string);
var
  i,j,n:integer;
  c: char;
  flag: boolean;
begin
  flag := false;
  n := length(s);
  for i:=1 to n do begin
    for j:=1 to i-1 do
      if (ord(s[i]) = ord(s[j])) and (flag = false)
           then 
             begin write(s, ' ');
                   flag:=true; end;
             end;
end;

// fix: Empty Body of a library unit to compile it easily.
begin
end.