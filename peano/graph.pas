uses wincrt, crt, math, graph;
procedure IntGraph;
var  gd,gm: integer;
begin
   gd:=detect;  
   gm:=0; 
   initgraph(gd,gm,'');
   line (0,0,getmaxx,getmaxy);
   readln; closegraph;
end;
procedure graph();
begin
end;
begin
Writeln('TEST');
IntGraph;
end.

