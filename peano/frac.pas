unit frac;

interface 
uses math;
type 
    ptr = ^Dot;
    Dot = record
        CoordX,CoordY : integer;
        Link : ptr;
    end;
var 
    Scale,CoordX,CoordY,n: integer; // Координаты какой-то начальной точки
    Depth : byte; // Глубина отрисовки

// Добавляет следующую точку и ставит на неё указатель
procedure addNew(var current: ptr);
procedure getPtr; // получить следующую точку,нужную для отрисовки
// Процедура инициализации фрактала, в данных точках CoordX,CoordY
procedure IntFrac;
procedure calcDot;
implementation
var x,y : integer;
    p,sp,tmp : ptr; // указатель и стартовая позиция, откуда начинает рисоваться фрактал
    positions : array [0..7] of ptr; // массив, состоящий из стандартных позиций 1-ого порядка
procedure addNew(var current : ptr);
var next: ptr;
begin
    new(next);
    next^.CoordX := x;
    next^.CoordY := y;
    current^.Link := next;
    current := next;
end;
// Процедура, заполняющая позиции 1-ого порядка
procedure FillPositions;
var i : integer;
begin
for i := 0 to 7 do new(positions[i]);
// 1-ая позиция
positions[0]^.CoordX := 0;
positions[0]^.CoordY := -50*Scale;
addNew(positions[0]);

end;
procedure IntFrac;
begin
    new(p); // создание нового объекта, который находится по адрессу p
    sp := p; // копирование стартовой позиции для извлечения значений
    tmp := sp;
    x := CoordX;
    y := CoordY;
    p^.CoordX := x;
    p^.CoordY := y;
    n := 0; Scale := 2;
    
end;

// Рекурсивная функция, выщитывающая точки
procedure calcDot;
begin

case n of 
0: begin 
x := 0 ;
y :=  -50*Scale ;
end;
1: begin 
x :=  25*Scale  ;
y := 0 ; 
end;
2: begin 
x := 0 ;
y :=  50*Scale;
end;
3: begin 
x :=  25*Scale;
y := 0;
end;
4: begin 
x := 0;
y := -50*Scale;
end;
end;
n := n + 1;
if n > 4 then n := 0;  

addNew(p);

end;
procedure getPtr;
var i : integer;
begin
    CoordX := tmp^.CoordX; CoordY := tmp^.CoordY;
    tmp := tmp^.Link;
  
end;
end.