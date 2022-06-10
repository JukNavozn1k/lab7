program main;
uses    wincrt, crt, math, graph,frac;
const 
        unsel=LightGray;
        sel=Green;
        n=3;
var     menu:array[1..n] of string;
        point,x,y,i,gd,gm: integer;
        ch,winch: char; 




procedure Info; // Вывод информации о программе (удивительно)

begin
        clrscr;
        gotoxy(10,5);
        writeln('Программа рисует фрактал,данный из задания лабораторной работы!');
        gotoxy(10,6);
        write('Нажмите клавишу <Enter> для выходв в главное меню ');
        readln;
end;

procedure graph;
var i : integer;
begin
MoveTo(CoordX,CoordY); // перемещает курсор в центр экрана, очень полезная вещь
{LineRel(0,250); // Движет линию на какой-то вектор, относительно предыдущей позиции
LineRel(-250,0); }
for i := 1 to 100 do  calcDot;
getPtr; 
// ===============================
getPtr;
LineRel(CoordX,CoordY);
getPtr;
LineRel(CoordX,CoordY);
getPtr;
LineRel(CoordX,CoordY);
getPtr;
LineRel(CoordX,CoordY);
getPtr;
LineRel(CoordX,CoordY);




end;
procedure IntGraph;

begin

        
        gd:=detect;gm:=0;
        InitGraph(gd, gm, '');
        CoordX := GetMaxX div 2;
        CoordY := GetMaxY div 2;
        IntFrac;
        graph;
        
       
       
end;

procedure printmenu;

var i:integer;

begin
        clrscr;
       
        for i:=1 to n do
        begin
                gotoxy(x,y+i-1);
                write(menu[i]);
        end;
        textattr:=sel;
        gotoxy(x,y+point-1);
        write(menu[point]);
        textattr:=unsel;
end;

begin
        
        menu[1]:='Посмотреть фрактал';
        menu[2]:='О программе';
        menu[3]:='Выход';
        
        point:=1;
        x:=10;
        y:=5;
        textattr:=unsel;
        printmenu;
        repeat
                ch:=readkey;
                if ch=#0 then
                begin
                        ch:=readkey;
                        case ch of
                        #80:
                                if point < n then
                                begin
                                        gotoxy(x,y+point-1);
                                        write(menu[point]);
                                        point:=point+1;
                                        textattr:=sel;
                                        gotoxy(x,y+point-1);
                                        write(menu[point]);
                                        textattr:=unsel;
                                end;
                        #72:
                                if point > 1 then
                                begin
                                        gotoxy(x,y+point-1);
                                        write(menu[point]);
                                        point:=point-1;
                                        textattr:=sel;
                                        gotoxy(x,y+point-1);
                                        write(menu[point]);
                                        textattr:=unsel;
                                end;
                        end;
                end
                else
                        if ch=#13 then
                        begin
                                case point of
                                1: IntGraph;
                                2: info;
                                3: ch:=#27;
                               
                            
                        end;
                printmenu;
        end;
        until ch=#27;
        clrscr;
end.
