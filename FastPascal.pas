unit FastPascal;

// FastPascal Unit Library.
// Licensed under MIT License.
// @author Denis Kalashnikov (DenisMasterHerobrine)
// https://github.com/DenisMasterHerobrine/FastPascal

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

type LongTinyArray = array [1..tinyArrSize] of BigInteger;
type LongSmallArray = array [1..smallArrSize] of BigInteger;
type LongMediumArray = array [1..mediumArrSize] of BigInteger;
type LongHugeArray = array [1..hugeArrSize] of BigInteger;
type LongExtremeArray = array [1..extremeArrSize] of BigInteger;
type LongUltimateArray = array of BigInteger;

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
function changeNotation(defaultNumber:integer; divider:integer): string;
var
  ConvertedToCCValue: string; 
  defaultNumberStorage: integer;
begin
defaultNumberStorage := defaultNumber;
ConvertedToCCValue := '';
while defaultNumberStorage > 0 do
 begin
      ConvertedToCCValue := CC[defaultNumberStorage mod divider+1] + ConvertedToCCValue;
      defaultNumberStorage := defaultNumberStorage div divider;
 end;
 Result := ConvertedToCCValue;
end;

// Module: Arrays
/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647], где count - количество чисел в массиве.
procedure fillArray(var arr: IntUltimateArray; count: integer);
begin
  SetLength(arr, count);
  for var i:=1 to count-1 do
    arr[i] := Random(-maxint+1, maxint-1);
end;

/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647], где count - количество чисел в массиве, min - минимальное значение сгенерированного числа, max - максимальное значение сгенерированного числа.
procedure fillArray(var arr: IntUltimateArray; count, min, max: integer);
begin
  SetLength(arr, count);
  if (min > -maxint+1) and (min < maxint) and (max < maxint-1) and (max > -maxint+1)
  then for var i:=1 to count-1 do
    arr[i] := Random(min, max);
end;

/// Заполняет массив случайными числами в Integer диапазоне. [-2,147,483,647 ~ 2,147,483,647], где count - количество чисел в массиве, min - минимальное значение сгенерированного числа, max - максимальное значение сгенерированного числа.
procedure fillArray(var arr: array of real; count: integer; min, max: real);
begin
  SetLength(arr, count);
  if (min > -maxint+1) and (min < maxint) and (max < maxint-1) and (max > -maxint+1)
  then for var i:=1 to count-1 do
    arr[i] := Random(min, max);
end;

/// Выводит массив до элемента с номером index.
procedure writeArray(var arr: IntUltimateArray; index: integer);
begin
  SetLength(arr, index);
  for var i:=1 to index-1 do
    write(arr[i], Delimiter);
  writeln;
end;

/// Выводит массив до элемента с номером index.
procedure writeArray(var arr: array of real; index: integer);
begin
  SetLength(arr, index);
  for var i:=1 to index-1 do
    write(arr[i], Delimiter);
  writeln;
end;

/// Выводит массив до элемента с номером index с округлением до rounding чисел после запятой.
procedure writeArray(var arr: array of real; index, rounding: integer);
begin
  SetLength(arr, index);
  for var i:=1 to index-1 do
    write(arr[i]:0:rounding, Delimiter);
  writeln;
end;

/// Возвращает минимальный элемент в массиве.
function findMinInArray(var arr: IntUltimateArray): integer;
begin
  SetLength(arr, length(arr));
  Result := arr[1];
  for var i:=1 to length(arr)-1 do
    if Result > arr[i] then 
      Result := arr[i];
end;

/// Возвращает максимальный элемент в массива.
function findMaxInArray(var arr: IntUltimateArray): integer;
begin
  SetLength(arr, length(arr));
  Result := arr[1];
  for var i:=1 to length(arr)-1 do
    if Result < arr[i] then 
      Result := arr[i];
end;

/// Находит сумму всех чисел в массиве типа BigInteger.
function sumInt(var arr: IntUltimateArray): integer;
var altarr: integer;
begin
  for var i:=1 to length(arr)-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Находит сумму count чисел в массиве типа BigInteger.
function sumInt(var arr: IntUltimateArray; count: integer): integer;
var altarr: integer;
begin
  for var i:=1 to count-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Находит сумму всех чисел в массиве типа BigInteger.
function sum(var arr: IntUltimateArray): BigInteger;
var altarr: BigInteger;
begin
  for var i:=1 to length(arr)-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Находит сумму count чисел в массиве типа BigInteger.
function sum(var arr: IntUltimateArray; count: integer): BigInteger;
var altarr: BigInteger;
begin
  for var i:=1 to count-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Находит сумму всех чисел в массиве типа BigInteger.
function sumRealInt(var arr: array of real): real;
var altarr: real;
begin
  for var i:=1 to length(arr)-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Находит сумму count чисел в массиве типа BigInteger.
function sumRealInt(var arr: array of real; count: integer): real;
var altarr: real;
begin
  for var i:=1 to count-1 do
    altarr := altarr + arr[i];
  Result := altarr;
end;

/// Выводит арифметическую прогрессию из count чисел, с шагом step и первым членом прогрессии firstElement.
procedure printArithmeticProgression(count: integer; firstElement, step: real);
var i:integer;
    arr:array of real;
begin
  SetLength(arr, count);
  arr[0] := firstElement;
  for i:=1 to count-1 do
    arr[i] := arr[i-1] + step;
  for i:=0 to count-1 do
    write(arr[i],' ');
end;

/// Создаёт арифметическую прогрессию из n чисел, с шагом d и первым членом прогрессии a1 и выдаёт в виде массива чисел типа integer.
function generateArithmeticProgression(count: integer; firstElement, step: integer): array of integer;
var i:integer;
    arr:array of integer;
begin
  SetLength(arr, count);
  arr[0] := firstElement;
  for i:=1 to count-1 do
    arr[i] := arr[i-1] + step;
  Result := arr;
end;

/// Создаёт арифметическую прогрессию из n чисел, с шагом d и первым членом прогрессии a1 и выдаёт в виде массива чисел типа real.
function generateArithmeticProgression(count: integer; firstElement, step: real): array of real;
var i:integer;
    arr:array of real;
begin
  SetLength(arr, count);
  arr[0] := firstElement;
  for i:=1 to count-1 do
    arr[i] := arr[i-1] + step;
  Result := arr;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(arr: array of integer; intValue: integer): boolean;
var len: integer;
begin
  len := length(arr);
  Result := False;
  for var i:=0 to len do
    if (arr[i] = intValue) 
    then begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(arr: array of real; intValue: integer): boolean;
var len: integer;
begin
  len := length(arr);
  Result := False;
  for var i:=0 to len do
    if (arr[i] = intValue)
    then begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(arr: array of real; realValue: real): boolean;
var len: integer;
begin
  len := length(arr);
  Result := False;
  for var i:=0 to len-1 do
    if (arr[i] = realValue) 
    then begin
      Result := True;
      break
    end;
end;

/// Определяет, существует ли данное число в массиве.
function isExistInArray(arr: array of string; stringValue: string): boolean;
var len: integer;
begin
  len := length(arr);
  Result := False;
  for var i:=0 to len-1 do
    if arr[i] = stringValue then 
    begin
      Result := True;
      break
    end;
end;

/// Вставляет в массив элемент n, который будет стоять на index месте.
procedure duplicate(var arr: array of integer; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := arr[index-1];
end;

/// Вставляет в массив элемент, который стоит на index месте.
procedure duplicate(var arr: array of real; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := arr[index-1];
end;

/// Вставляет в массив элемент, который стоит на index месте.
procedure duplicate(var arr: array of string; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := arr[index-1];
end;

/// Вставляет в массив элемент element, который будет стоять на index месте.
procedure insertIntoArray(var arr: array of integer; element: integer; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := element;
end;

/// Вставляет в массив элемент element, который будет стоять на index месте.
procedure insertIntoArray(var arr: array of real; element: real; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := element;
end;

/// Вставляет в массив строку stringElement, которая будет стоять на index месте.
procedure insertIntoArray(var arr: array of string; stringElement: string; index: integer);
var i, l: integer;
begin
    SetLength(arr, length(arr)+1);
    for i := length(arr)-2 downto index do
        arr[i+1] := arr[i];
    arr[index] := stringElement;
end;

/// Уничтожает повторяющиеся элементы массива.
procedure removeRepeatedElementsInArray(var arr: array of integer);
var arrCleared: array of integer;
    flag: boolean;
    i, j, clearedIterator, len, count: integer;
begin
    len := length(arr);
    SetLength(arrCleared, len);
    arrCleared[1] := arr[1];
    clearedIterator := 1;
    for i:=2 to len-1 do begin
        flag := true;
        for j:=1 to clearedIterator do
            if arr[i] = arrCleared[j] then 
                flag := false;
        if flag = true then begin
            clearedIterator := clearedIterator + 1;
            arrCleared[clearedIterator] := arr[i];
        end;
    end;
    arr:=arrCleared;
    for i:=1 to length(arr)-1 do
    begin
      if (arr[i] = 0)
        then inc(count);
    end;
    setLength(arr, len-count);
end;

/// Уничтожает повторяющиеся элементы массива.
procedure removeRepeatedElementsInArray(var arr: array of real);
var arrCleared: array of real;
    flag: boolean;
    i, j, clearedIterator, len, count: integer;
begin
    len := length(arr);
    SetLength(arrCleared, len);
    arrCleared[1] := arr[1];
    clearedIterator := 1;
    for i:=2 to len-1 do begin
        flag := true;
        for j:=1 to clearedIterator do
            if arr[i] = arrCleared[j] then 
                flag := false;
        if flag = true then begin
            clearedIterator := clearedIterator + 1;
            arrCleared[clearedIterator] := arr[i];
        end;
    end;
    arr:=arrCleared;
    for i:=1 to length(arr)-1 do
    begin
      if (arr[i] = 0)
        then inc(count);
    end;
    setLength(arr, len-count);
end;

/// Уничтожает повторяющиеся элементы массива.
procedure removeRepeatedElementsInArray(var arr: array of string);
var arrCleared: array of string;
    flag: boolean;
    i, j, clearedIterator, len, count: integer;
begin
    len := length(arr);
    SetLength(arrCleared, len);
    arrCleared[1] := arr[0];
    clearedIterator := 1;
    for i:=2 to len-1 do begin
        flag := true;
        for j:=1 to clearedIterator do
            if arr[i] = arrCleared[j] then 
                flag := false;
        if flag = true then begin
            clearedIterator := clearedIterator + 1;
            arrCleared[clearedIterator] := arr[i];
        end;
    end;
    arr:=arrCleared;
    for i:=1 to length(arr)-1 do
    begin
      if (arr[i] = '')
        then inc(count);
    end;
    setLength(arr, len-count);
    for i:=1 to length(arr)-1 do
    begin
      arr[i-1]:=arr[i]
    end;
    setLength(arr, len-count-1);
end;

// Module: Math
/// Возвращает факториал числа типа BigInteger.
function factorial(count: Integer): BigInteger;
var
  i: integer;
  factorialResult: BigInteger;

begin
  for i := 0 to count do
    begin
      if (i=0) or (i=1) 
        then factorialResult := 1
        else factorialResult := factorialResult * i;
    end;
  Result := factorialResult;
end;

/// @Deprecated
/// Возвращает факториал числа типа Integer. Невозможно определить факториал числа, большего чем 16 этим методом.
function factorialInt(count: Integer): integer;
var
  i, factorialResult: integer;

begin
for i := 0 to count do
  begin
    if (i=0) or (i=1) 
      then factorialResult := 1
      else factorialResult := factorialResult * i;
     end;
  Result := factorialResult;
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

/// Находит корни квадратного уравнения и возвращает в виде параметров firstRoot и secondRoot, если корни существует, то вернёт true параметром areRootsExist, иначе вернёт false, если корни не удалось найти.
procedure findSquaredRoots(a,b,c:real; var firstRoot, secondRoot:real; areRootsExist:boolean);
var discriminant:real;
begin
  areRootsExist:=true;
  discriminant:=b*b-4*a*c;
  if (discriminant < 0) then areRootsExist:=false;
  if (discriminant = 0)
    then begin
    secondRoot:=-b/2*a;
    firstRoot:=-b/2*a;
  end
end;

/// Находит НОД двух чисел firstInt и secondInt.
function findGreatestCommonDivider(firstInt, secondInt:integer):integer;
  begin
  while firstInt*secondInt<>0 do
    if firstInt>secondInt 
        then firstInt:=firstInt mod secondInt
        else secondInt:=secondInt mod firstInt;
    if secondInt=0 then Result := firstInt
        else Result := secondInt;
  end;

/// Определяет, является ли число простым. Выводит true, если число простое. Если число не является простым - выводит false.
function isSimple(intValue:integer):boolean;
var i:integer;
begin
  Result := true;
  for i:=2 to intValue div 2 do
    if intValue mod i = 0 then Result := false;
end;

/// Определяет, является ли данное число палиндромом.
function isPalindrome(intValue: integer):boolean;
var reverserWorker1, reverserWorker2:integer;
  begin
  reverserWorker1:=intValue;
  reverserWorker2:=0;
    while reverserWorker1>0 do
      begin
        reverserWorker2 := reverserWorker2 * 10 + (reverserWorker1 mod 10);
        reverserWorker1 := reverserWorker1 div 10;
    end;
  if (reverserWorker2 = intValue) then Result:=true;
end;

/// Определяет, является ли число n числом Фибоначчи. 
function isFibonacciNumber(intValue: integer):boolean;
var
  fibonacciWorker1, fibonacciWorker2, fibonacciWorker3, i: integer;

begin
  fibonacciWorker2 := 1;
  fibonacciWorker3 := fibonacciWorker2;
  for i := 1 to trunc(power(intValue, 2)) do
  begin
    fibonacciWorker1 := fibonacciWorker3;
    fibonacciWorker3 := fibonacciWorker2;
    fibonacciWorker2 := fibonacciWorker1 + fibonacciWorker2;
    if (intValue = fibonacciWorker1) then
    begin
      Result := true;
      fibonacciWorker1 := -1;
      break;
    end;
    if (fibonacciWorker1 > intValue) then
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

/// Считывает файл с диска в кодировке encoding до конца файла. Выводит содержимое файла типа text с возможностью считывать построчно.
function readText(filePath: string): text;
var
  txt: Text;
begin
  assignFile(txt, filePath);
  reset(txt);
  Result:=txt;
end;

/// Считывает файл с диска в кодировке encoding до конца файла. Выводит содержимое файла типа text с возможностью считывать построчно.
function readText(filePath: string; encoding: System.Text.Encoding): text;
var
  txt: Text;
begin
  assignFile(txt, filePath);
  reset(txt, encoding);
  Result:=txt;
end;

/// Удаляет один или несколько типов символов из строки uncleanedString, находящиеся в параметре remove типа String. Возвращает массив, состоящий из комбинаций строк, состоящих из символов, которые были не удалены и разделены пробелом в unclearedString. 
function clean(uncleanedString, remove: string): CleanedArrayOutput;
var
  cleaned: StrUltimateArray;
  i, n: integer;
begin
  uncleanedString:=uncleanedString+' ';
  setLength(cleaned, length(uncleanedString));
  
  for i:=1 to length(uncleanedString) do
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
  n:=-1;
  while (uncleanedString <> '') do
  begin
    n:=n+1;
    cleaned[n]:=copy(uncleanedString, 1, pos(' ', uncleanedString)-1);
    delete(uncleanedString, 1, pos(' ', uncleanedString));
  end;
  Result.CleanedArray := cleaned;
  Result.Length := n;
end;

/// Превращает строку, содержащую одно или несколько слов или сочетание символов, разделённых через пробел в массив с этими словами или сочетаниями символов.
function stringToArray(uncleanedString: string): array of string;
var
  cleaned: array of string;
  i, n: integer;
begin
  uncleanedString:=uncleanedString+' ';
  setLength(cleaned, mediumArrSize);
  
  for i:= 1 to length(uncleanedString) do
  begin
    if (pos(uncleanedString[i], '') > 0)
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
  Result := cleaned;
end;

// Module: String
/// Проверяет, повторяются ли символы в строке.
function isRepeatedSymbolsExist(stringValue: string): boolean;
var i, j, counter: integer;
    currentChar:char;
    arr:array[''..'ࠀ'] of integer;
begin
  for currentChar := '' to 'ࠀ' do
  begin
    arr[currentChar]:=0;
  end;
  for i:=1 to length(stringValue) do arr[stringValue[i]]:=arr[stringValue[i]]+1;
    counter:=0;
  for currentChar:='' to 'ࠀ' do
    if (arr[currentChar] > 1) then inc(counter);
  if (counter <> 0)
    then Result := true
    else Result := false;
end;

/// Проверяет строку на соблюдение баланса скобочной последовательности. Также определяет, соблюдена ли скобочная последовательность. Если скобочная последовательность соблюдена - возвращает true, иначе - false.
function isBracketsBalanced(stringValue: string): boolean;
var
  i, bracketBalanceWorker1, bracketBalanceWorker2: integer;
  isBalanced:boolean;
begin
  bracketBalanceWorker1 := 0; 
  bracketBalanceWorker2 := 0;
  
  for i := 1 to length(stringValue) do 
  begin
    if (stringValue[i]='(') or (stringValue[i]='{') or (stringValue[i]='[') or (stringValue[i]='<') then inc(bracketBalanceWorker1);
    if (stringValue[i]=')') or (stringValue[i]='}') or (stringValue[i]=']') or (stringValue[i]='>') then inc(bracketBalanceWorker2);
    if (bracketBalanceWorker2 > bracketBalanceWorker1) then isBalanced := true;
  end;
  
  if (bracketBalanceWorker1 = bracketBalanceWorker1) and (isBalanced = false) 
    then Result := true
    else Result := false;
end;

// Module: Array Sorters
/// Сортирует все элементы массива по алфавиту, сравнивая только первый символ элемента.
procedure sortAlphabeticallyByFirstChar(var unsortedArray: array of String);
var
  i, j, lengthChecker: integer;
  s: string[20];
  arr: array of String;
begin
  for i := 1 to unsortedArray.Length-1 do
  begin
    if (unsortedArray[i] <> '')
      then inc(lengthChecker);
  end;
  for i:=1 to lengthChecker-1 do
        for j:=1 to lengthChecker-i do
            if unsortedArray[j][1] > unsortedArray[j+1][1]
            then begin
                { 
                // TODO: Recheck the swap condition in case swap breaks when sorting an array.
                s := unsortedArray[j];
                unsortedArray[j] := unsortedArray[j+1];
                unsortedArray[j+1] := s;
                }
                swap(unsortedArray[j], unsortedArray[j+1]);
            end;
end;

/// Сортирует все элементы массива по алфавиту.
procedure sortAlphabetically(var unsortedArray: array of String);
var
  i, j, lengthChecker: integer;
  s: string;
begin
  for i:= 1 to unsortedArray.Length-1 do
  begin
    if (unsortedArray[i] <> '')
      then inc(lengthChecker);
  end;
  for i:=lengthChecker-1 downto 1 do
    for j:=1 to i-1 do
      if unsortedArray[j] > unsortedArray[j+1]
            then begin
                {
                s := unsortedArray[j];
                unsortedArray[j] := unsortedArray[j+1];
                unsortedArray[j+1] := s;
                }
                swap(unsortedArray[j], unsortedArray[j+1]);
            end;
end;

/// Сортирует все элементы в параметре типа String по алфавиту.
procedure sortAlphabeticallyInElement(var stringValue: string);
var
  i, j, len:integer;
  currentChar: char;
begin
  len := length(stringValue);
  for i:=len downto 1 do
    for j:=1 to i-1 do
      if (stringValue[j] > stringValue[j+1])
           then begin
                currentChar := stringValue[j];
                stringValue[j] := stringValue[j+1];
                stringValue[j+1] := currentChar;
            end;
        write(stringValue, ' ');
end;

// Module: Unused
// Этот модуль не рекомендуется к использованию. Используется в основном только для написания программ из школьного курса по языку Pascal. По умолчанию все методы и функции имеют тег @Deprecated.

/// @Deprecated
/// Сдвигает все гласные буквы в строке влево, а согласные - вправо.
procedure moveLetters(stringValue: string);
var
  i, j, len:integer;
  currentChar: char;
begin
  len := length(stringValue);
  for i:=len downto 1 do
    for j:=1 to i-1 do
      if (pos(stringValue[j], FastPascal.glasn_RU) = 0) and (pos(stringValue[j+1], FastPascal.glasn_RU) > 0) or 
         (pos(stringValue[j], FastPascal.glasn_EN) = 0) and (pos(stringValue[j+1], FastPascal.glasn_EN) > 0)
           then begin
                currentChar := stringValue[j];
                stringValue[j] := stringValue[j+1];
                stringValue[j+1] := currentChar;
            end;
        write(stringValue, ' ');
end;

/// @Deprecated
/// Переворачивает строку задом наперёд.
procedure reverseLetters(stringValue: string);
var
  i, j, len:integer;
  currentChar: char;
begin
  len := length(stringValue);
  for i:=len downto 1 do
    for j:=1 to i-1 do
            begin
                currentChar := stringValue[j];
                stringValue[j] := stringValue[j+1];
                stringValue[j+1] := currentChar;
            end;
        write(stringValue, ' ');
end;

/// @Deprecated
/// Выводит строку, содержащую хотя бы 2 совпадающих буквы.
procedure writeWordWithTwoLetters(var stringValue: string);
var
  i, j, len:integer;
  flag: boolean;
begin
  flag := false;
  len := length(stringValue);
  for i:=1 to len do begin
    for j:=1 to i-1 do
      if (ord(stringValue[i]) = ord(stringValue[j])) and (flag = false)
           then 
             begin write(stringValue, ' ');
                   flag:=true; end;
             end;
end;

// fix: Empty Body of a library unit to compile it easily.
begin
end.