program main;
uses    wincrt, crt, math, graph,frac;
const 
        unsel=LightGray;
        sel=Green;
        n=3;
var     menu:array[1..n] of string;
        point,x,y,i,gd,gm: integer;
        ch,winch: char; 






procedure Info; // ����� ���������� � ��������� (�����������)

begin
        clrscr;
        gotoxy(10,5);
        writeln('��������� ������ �������,������ �� ������� ������������ ������!');
        gotoxy(10,6);
        write('������� ������� <Enter> ��� ������ � ������� ���� ');
        readln;
end;


procedure IntGraph;

begin

       
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
        menu[1]:='���������� �������';
        menu[2]:='� ���������';
        menu[3]:='�����';
        
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
