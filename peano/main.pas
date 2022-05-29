uses    wincrt, crt, math, graph;
const 
        unsel=LightGray;
        sel=Green;
        n=4;
var     menu:array[1..n] of string;
        point,x,y,i,gd,gm,depth,scale: integer;
        ch,winch,tmpW: char; 
       
        flag,check,isGood: boolean;
       

procedure point1; 
var x,y : integer;
begin
                
                clrscr;
                x := 10;
                y := 5;
                depth := 0;
                scale := 0;
                gotoxy(x,y);
                write('Ввод данных: ');
                y := y + 1;
                gotoxy(x,y);
                while depth <= 0 do begin
                    write('Введите глубину прорисовки (depth > 0): ');
                    
                    read(depth);
                    y := y + 1;
                    gotoxy(x,y);
                    
                end;
                y := y + 1;
                gotoxy(x,y);
                while scale <= 0 do begin
                    write('Введите масштаб прорисовки (scale > 0): ');
                    
                    read(scale);
                    y := y + 1;
                    gotoxy(10,y);
                    
                end;
                flag:=true;
end;



procedure point3; // Вывод информации о программе (удивительно)

begin
        clrscr;
        gotoxy(10,5);
        writeln('Программа рисует фрактал,данный из задания лабораторной работы!');
        gotoxy(10,6);
        write('Нажмите клавишу <Enter> для выходв в главное меню ');
        readln;
end;



procedure IntGraph;

begin
       
        if flag=false then point1; 
       
        isGood := true;
        gd:=detect;gm:=0;InitGraph(gd, gm, '');
        // ---------------
       
       
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
        menu[1]:='Ввод данных';
        menu[2]:='Посмотреть фрактал';
        menu[3]:='О программе';
        menu[4]:='Выход';
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
                                1: point1;
                                2: IntGraph;
                                3: point3;
                                4: ch:=#27;
                            
                        end;
                printmenu;
        end;
        until ch=#27;
        clrscr;
end.
