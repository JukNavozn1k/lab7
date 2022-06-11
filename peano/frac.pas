unit frac;

interface 
uses math;
type 
    ptr = ^peano_array;
    
    peano_array = record
        px,py : array [0..5] of integer ;
        Link : ptr;
        start_pos : ptr;
    end;
var 
    Depth,Scale,dirX,dirY,direction: integer;
    p : ptr;
    


procedure IntFrac;

implementation

procedure add;
var tmp : ptr;
begin
new(tmp);
tmp^.start_pos := p^.start_pos;
p^.Link := tmp;
p := tmp;
end;
procedure peano();
begin
    p^.px[1] := 0;
    p^.py[1] := 2*Scale*dirY;

    p^.px[2] := 1*Scale*dirX;
    p^.py[2] := 0;
  

    p^.px[3] := 0;
    p^.py[3] := -2*Scale*dirY;

    p^.px[4] := 1*Scale*dirX;
    p^.py[4] := 0;

    p^.px[5] := 0;
    p^.py[5] := 2*Scale*dirY;
    add;
    
end;

procedure calculate_curve(d,i: integer);
begin



 if (i > 3)  then begin

 p^.px[0] := 1*Scale*direction;
 p^.py[0] := 0;
 dirY := dirY * -1;
if i = 4 then direction := direction * -1;
 
 i := 1;
 end
 else if  (i <= 3)  then  begin
 p^.px[0] := 0;
 p^.py[0] := 1*Scale*direction;
dirX := dirX * -1;
 end;
 

peano;

//
 if d > 1 then calculate_curve(d-1,i+1);
end;

procedure IntFrac;
begin
    new(p); // создание нового объекта, который находится по адрессу p 
    p^.start_pos := p;
    Scale := 25; Depth := 1; direction := 1; 
    dirX := -1;
    dirY := 1;
    calculate_curve(1,1);
  
end;


end.