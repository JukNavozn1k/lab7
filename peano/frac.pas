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
    CoordX,CoordY: integer;
    Depth : byte;
// Добавляет следующую точку и ставит на неё указатель
procedure addNew(var p: ptr);
procedure calcDot();


implementation
var x,y : integer;
procedure addNew(var p : ptr);
var y: ptr;
begin
    new(y);
    // Сделать ввод координат через отдельную функцию,вычисляющую точки фрактала
    y^.CoordX := 0;
    y^.CoordY := 0;
    p^.Link := y;
    p := y;
end;
procedure calcDot();
begin
end;
end.