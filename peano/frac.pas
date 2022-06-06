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
    tmp := sp;
    x := CoordX;
    y := CoordY;
    p^.CoordX := x;
    p^.CoordY := y;
    n := 0; Scale := 1;
    
end;

// Рекурсивная функция, выщитывающая точки
procedure calcDot;
begin
// Спасибо паша - помог
case n of 
0: begin 
x := x ;
y := y - 50*Scale ;
end;
1: begin 
x := x + 25*Scale  ;
y := y ; 
end;
2: begin 
x := x ;
y := y + 50*Scale;
end;
3: begin 
x := x + 25*Scale;
y := y;
end;
4: begin 
x := x;
y := y - 50*Scale;
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