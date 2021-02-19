program PoslMatr;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows;

const
  k=3;
  n=2;
  m=3;

type
  TMatr=array[1..n,1..m] of integer;
  TPosl=array[1..k] of TMatr;
  TTemp=array[1..k, 1..2] of integer;

var
  Posl: TPosl;
  Temp: TTemp;
  i,j: integer;

procedure ReadMatr(var Matr: TMatr);
  var
    i,j: integer;
  begin
    for i:=1 to n do
      begin
        for j:=1 to m do
          read(Matr[i,j]);
        readln;
      end;
  end;

function FindSum(var Matr: TMatr): integer;
  var
    s,i,j: integer;
  begin
    s:=0;
    for i:=1 to n do
      for j:=1 to m do
        s:=s+Matr[i,j];
    FindSum:=s;
  end;

procedure Swap (var x,y: integer);
  var
    t: integer;
  begin
    t:=x;
    x:=y;
    y:=t;
  end;

procedure WriteMatr(var Matr: TMatr);
  var
    i,j: integer;
  begin
    for i:=1 to n do
      begin
        for j:=1 to m do
          write(Matr[i,j],' ');
        writeln;
      end;
  end;
  
begin {main}
  SetConsoleOutputCP(1251);
  SetConsoleCP(1251);

  for i:=1 to k do
    begin
      writeln('Введите матрицу №',i);
      ReadMatr(Posl[i]);
    end;

  for i:=1 to k do
    begin
      Temp[i,1]:=i;
      Temp[i,2]:=FindSum(Posl[i]);
    end;
  for i:=1 to k-1 do
    for j:=1 to k-i do
      if Temp[j,2]>Temp[j+1,2]
        then
          begin
            Swap(Temp[j,2],Temp[j+1,2]);
            Swap(Temp[j,1],Temp[j+1,1]);
          end;
          
  writeln;
  writeln('Ответ:');
  for i:=1 to k do
    begin
      writeln('Матрица №',i,':');
      WriteMatr(Posl[Temp[i,1]]);
    end;
  readln;
end.
 