unit testoman;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

function sostituisci(const input:string;inizio:integer;fine:integer;nuovo:string):string;
function posCaseInsensitive(daCercare:string;input:string):integer;
function posPartiDa(daCercare:string;const input:string;partiDa:integer):integer;
function posNoCasePartiDa(daCercare:string;input:string;partiDa:integer):integer;
function posRitrosoPartiDa(daCercare:string;input:string;partiDa:integer):integer;
function posNoCaseRitrosoPartiDa(daCercare:string;input:string;partiDa:integer):integer;
function estraiDa(input:string;da:string):string;
function double_to_total_digits(const d: extended; const digits,decimals: integer): string;

implementation

function int_range(x,min,max: integer): integer;
   {forces 'x' into the range of [min..max]}
begin
 if x < min then exit(min) else
    if x > max then exit(max) else exit(x);
end;

function digits_left(d: extended): integer;
   {returns the number of digits of 'd' which are left to the decimal dot}
var s: string;
begin
  str(abs(d):0:38, s);
  exit(pos('.',s));
end;

function double_to_total_digits(const d: extended; const digits,decimals: integer): string;
   {formats a extended to a string.
    I: digits: max. total number of digits (left and right of the decimal dot)
       decimals: max. number of digits right of the decimal dot}
var
  s: string;
  a:integer;
begin
 str(d:0:int_range(digits-digits_left(d), 0,decimals), s);
 a:=pos(decimalSeparator,s);
 while (a>0)and((s[length(s)]='0')or(s[length(s)]=decimalSeparator)) do begin s:=copy(s,1,length(s)-1);a:=pos(decimalSeparator,s);end;
 if s='-0' then s:='0';
 exit(s);
end;


function sostituisci(const input:string;inizio:integer;fine:integer;nuovo:string):string;
var
   a,b,c,d,e,f:string;
   aN,bN,cN,dN:Integer;
begin
     a:=copy(input,1,inizio-1);
     b:=copy(input,fine,length(input));
     result:=a+nuovo+b;
end;

function posCaseInsensitive(daCercare:string;input:string):integer;
var
   a,b:string;
begin
  a:=AnsiLowerCase(input);
  b:=AnsiLowerCase(daCercare);
  result:=pos(b,a);
end;

function posPartiDa(daCercare:string;const input:string;partiDa:integer):integer;
var
   a:string;
   b:integer;
begin
   a:=copy(input,partiDa,length(input)-partiDa+1);
   b:=pos(daCercare,a);
   if b=0 then result:=0;
   if b>0 then result:=b+partiDa-1;
end;

function posNoCasePartiDa(daCercare:string;input:string;partiDa:integer):integer;
var
   a,b:string;
begin
  a:=AnsiLowerCase(input);
  b:=AnsiLowerCase(daCercare);
  result:=posPartiDa(b,a,partiDa);
end;

function posRitrosoPartiDa(daCercare:string;input:string;partiDa:integer):integer;
var
   b,c,d:integer;
begin
   d:=0;
   result:=0;
   if partiDa<=length(input) then
   begin
     c:=length(daCercare);
     for b := partiDa downto 1 do
     begin
       if daCercare[c]=input[b] then
       begin
         inc(d);
         c:=c-1;
       end
       else
       begin
         c:=length(daCercare);
       end;
       if c=0 then
       begin
         result:=b;
         exit;
       end;
     end;
   end;
end;

function posNoCaseRitrosoPartiDa(daCercare:string;input:string;partiDa:integer):integer;
var
   a,b:string;
begin
  a:=AnsiLowerCase(input);
  b:=AnsiLowerCase(daCercare);
  result:=posRitrosoPartiDa(b,a,partiDa);
end;

function estraiDa(input:string;da:string):string;
var
   a,b:string;
   c:integer;
begin
   result:='';
   a:=AnsiLowerCase(input);
   b:=AnsiLowerCase(da);
   c:=pos(b,a);
   if c=0 then exit;
   result:=copy(input,c+length(da),length(input));
end;

end.

