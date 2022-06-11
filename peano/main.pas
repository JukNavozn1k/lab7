program main;
uses    wincrt, crt, math, graph,frac;
const 
        unsel=LightGray;
        sel=Green;
        n=3;
var     menu:array[1..n] of string;
        point,x,y,i,gd,gm: integer;
        ch,winch: char; 
        isGood : boolean;




procedure Info; // Вывод информации о программе (удивительно)

begin
        clrscr;
        gotoxy(10,5);
        writeln('Программа рисует фрактал,данный из задания лабораторной работы!');
        gotoxy(10,6);
        write('Нажмите клавишу <Enter> для выходв в главное меню ');
        readln;
end;
procedure print_curve;
var i : ptr;
    j : integer;
begin
if p <> nil then begin
i := p^.start_pos;
while i^.Link  <> nil do begin
for j := 0 to 5 do begin
        LineRel(i^.px[j],i^.py[j]);
end;
i := i^.Link;
end;
end;
end;
procedure graph;
        var DS,SS : string;
begin
        winch:=' ';
        MoveTo(GetMaxX,GetMaxY);
        while isGood do
        begin
                // CLEAR 
               str(Depth,DS);
               str(Scale,SS); 
               ClearDevice;
                // OutInfo
                OutTextXY(100,100,'1 -> Depth + 1');
                OutTextXY(100,120,'2 -> Scale + 1');
                OutTextXY(100,140,'ESC -> Back to menu');
                OutTextXY(100,180,'Depth: ' + DS);
                OutTextXY(100,200,'Scale: ' + SS);
                SetColor(15);
                // print_curve
                MoveTo(GetMaxX div 2,GetMaxY div 2);
                if p <> nil then print_curve;
                // HOT-KEYS
                winch:=wincrt.readkey;
                case winch of
                #27: isGood := false;
                '1' : Depth := Depth + 1;
                '2' : Scale := Scale + 1;
                end;
               
               
        end;
        
        CloseGraph;
        
        
end;

procedure IntGraph;

begin

        isGood := true;
        gd:=detect;gm:=0;
        InitGraph(gd, gm, '');
       
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
