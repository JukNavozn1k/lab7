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


// Процедура инициализации фрактала, в данных точках CoordX,CoordY
procedure IntFrac;

implementation
var x,y : integer;
    p,sp : ptr; // указатель и стартовая позиция, откуда начинает рисоваться фрактал
procedure addNew(var current : ptr);
var next: ptr;
begin
    new(next);
    next^.CoordX := x;
    next^.CoordY := y;
    current^.Link := next;
    current := next;
end;
procedure IntFrac;
begin
    new(p); // создание нового объекта, который находится по адрессу p
    sp := p; // копирование стартовой позиции для извлечения значений
    x := CoordX;
    y := CoordY;
    p^.CoordX := x;
    p^.CoordY := y;
    
end;

// Рекурсивная функция, выщитывающая точки
procedure calcDot(var x,y:integer);
begin
case n of 
0: begin 
x := x;
y := y - Scale;
end;
1: begin 
x := x + Scale;
y := y;
end;
2: begin 
x := x;
y := y + Scale;
end;
3: begin 
x := x + Scale;
y := y;
end;
4: begin 
x := x;
y := y - Scale;
end;
end;
n := n + 1;
addNew(p);
if n > 4 then n := 0;
end;
end.