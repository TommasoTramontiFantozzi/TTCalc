unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Menus, risolutore, strutils, Types,LCLIntf,testoMan,math,Unit2,Unit3,DateUtils,about;

type

  { TForm1 }

  TctrlZ=record
    text:string;
    ctrlZpos:integer;
    ctrlZcrono:integer;
    lastCrono:TDateTime;
    next:pointer;
    prev:pointer;
    fine:boolean;
  end;
  PctrlZ=^TctrlZ;

  TstringRecord=record
    value:string;
    next:pointer;
    prev:pointer;
  end;

  TstringArray=array of string;

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button22: TButton;
    Button23: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormDestroy(Sender: TObject);
    procedure MenuItem53Click(Sender: TObject);
    procedure MenuItem55Click(Sender: TObject);
    procedure MenuItem56Click(Sender: TObject);
    procedure MenuItem57Click(Sender: TObject);
    procedure MenuItem58Click(Sender: TObject);
    procedure MenuItem59Click(Sender: TObject);
    procedure started;
    procedure stopped;
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button221MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button221MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button23Click(Sender: TObject);
    procedure calcola;
    procedure Button10Click(Sender: TObject);
    procedure Button11lick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Memo1KeyPress(Sender: TObject; var Key: char);
    procedure Memo1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure InsertStringAtcaret(MyString: string);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem36Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem40Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem44Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem48Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
     oldX,oldY:integer;
     inibito:boolean;
     backSpaceTimer:integer;
     backSpaceclicked:boolean;
     ctrlZ:^TctrlZ;
     iniziale:^TctrlZ;
     halted,working:boolean;
  public

  end;

  function elabora(a:string):string;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure Xcopy(var a:string;b,c:integer);
var
    d,e:integer;
begin
  e:=min(b+c-1,length(a));
  for d:=b to e do
  begin
    a[d-b+1]:=a[d];
  end;
  setLength(a,e-b+1);
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

function retrieveCharacter(a:string;pos:integer):char; inline;
begin
  if (pos>=1)and(pos<=length(a))and(length(a)>=1) then result:=a[pos] else result:=#0;
end;

function IsLetter(N : char) : Boolean;
var
I : Integer;
begin
  i:=ord(N);
  result:=((i<=90)and(i>=65))or((i<=122)and(i>=97));
end;

function split(ss:string):TstringArray;
var
  a,b,c,d,e,f:integer;
  aa,bb:string;
  aaa:array of string;
begin
  b:=0;
  c:=0;
  aa:='';
  for a := 1 to length(ss) do
  begin
    if ss[a]='(' then inc(b);
    if ss[a]=')' then dec(b);
    aa:=aa+ss[a];
    if (b=0)and((c<>0)or(ss[a]=',')) then
    begin
      if ss[a]=',' then setLength(aa,length(aa)-1);
      if (aa<>'') then
      begin
        setLength(aaa,length(aaa)+1);
        aaa[length(aaa)-1]:=aa;
      end;
      aa:='';
    end;
    c:=b;
  end;
end;

function isAlphanumeric(a:string):boolean;
var
 aN:integer;
begin
  result:=false;
  if length(a)>0 then
  begin
    result:=true;
    for aN:=1 to length(a) do
    begin
      if not((a[aN] in [#48..#57])or(a[aN] in [#65..#90])or(a[aN] in [#97..#122])) then
      begin
        result:=false;
        break;
      end;
    end;
  end;
end;

function sostituisci(dove,daSost,a:string):string;
var
 b:string='';
 c:string='';
 bN,cN:integer;
 virgolette:boolean;
begin
  if pos(dove,a)=0 then
  begin
    result:=a;
    exit;
  end;
  cN:=1;
  virgolette:=false;
  bN:=pos('=',a);
  if bN>0 then
  begin
    c:=copy(a,bN,length(a));
    setLength(a,bN-1);
  end;
  while (a<>b) do
  begin
    b:=a;
    for bN:=cN to length(a) do
    begin
      if (a[bN]='"') then virgolette:=not virgolette;
      if (a[bN]='=') and (virgolette=false) then break;   //Dopo l'uguale non sostituisce più niente
      if bN>1 then
      begin
        if a[bN-1]='@' then continue;
      end;
      if copy(a,bN,length(dove))=dove then
      begin
        if (virgolette=false)and(retrieveCharacter(a,bN+length(dove))<>'(')and(isAlphanumeric(retrieveCharacter(a,bN-1))=false) and (isAlphanumeric(retrieveCharacter(a,bN+length(dove)))=false)and(daSost<>'') then
        begin
          if (a[bN-1]='{')and(a[bN+length(dove)]='}') then continue;
          if (a[bN-1]='(')and(a[bN+length(dove)]=')') then
          begin
            a:=copy(a,1,bN-1)+daSost+copy(a,bN+length(dove),length(a));
            cN:=bN+length(daSost);
          end
          else
          begin
            if (bN=1)and(bN+length(dove)>length(a)) then
            begin
              a:=copy(a,1,bN-1)+daSost+copy(a,bN+length(dove),length(a));
              cN:=bN+length(daSost);
            end
            else
            begin
              a:=copy(a,1,bN-1)+'('+daSost+')'+copy(a,bN+length(dove),length(a));
              cN:=bN+length('('+daSost+')');
            end;
          end;
          break;
        end;
      end;
    end;
  end;
  result:=a+c;
end;


function dec2Bin(a:int64):String;
var
  d:Integer;
Begin
  result:='';
  if a=0 then result:='0';
  while a>0 do begin
    d:=a mod 2;
    result:=IntToStr(d)+result;// concat(IntToStr(d),result);
    a:=a div 2;
  end;
End;

function dec2fp32(aa:single):string;
var
   p:pbyte;
begin
  p:=@aa;
  result:='fp32(0x'+inttohex((p+3)^,2)+',0x'+inttohex((p+2)^,2)+',0x'+inttohex((p+1)^,2)+',0x'+inttohex((p+0)^,2)+')';
end;

function dec2fp64(aa:double):string;
var
   p:pbyte;
begin
  p:=@aa;
  result:='fp64(0x'+inttohex((p+7)^,2)+',0x'+inttohex((p+6)^,2)+',0x'+inttohex((p+5)^,2)+',0x'+inttohex((p+4)^,2)+',0x'+inttohex((p+3)^,2)+',0x'+inttohex((p+2)^,2)+',0x'+inttohex((p+1)^,2)+',0x'+inttohex((p+0)^,2)+')';
end;


function estraiParametro(s:string;delimitatoreCampi:char;numeroCampo:integer):string;
var
   aN,bN,cN,dN:integer;
   bracket:integer=0;
   campo:integer=1;
begin
  result:='';
  for aN := 1 to length(s)do
  begin
    if (s[aN]='(') then inc(bracket);
    if (s[aN]=')')and(bracket>0) then dec(bracket);
    if (bracket=0)and(s[aN]=delimitatoreCampi) then begin inc(campo);continue;end;
    if campo=numeroCampo then
    begin
      result:=result+s[aN];
    end;
  end;
end;

function posPrentesiChiusa(s:string;partiDa:integer;parentesi:string):integer;
var
   bracket:integer=0;
   aN:integer;
   a:char=#0;
begin
  if parentesi='(' then begin a:=')';end;
  if parentesi='[' then begin a:=']';end;
  if parentesi='{' then begin a:='}';end;
  result:=0;
  if a=#0 then exit;
  if retrieveCharacter(s,partiDa)=parentesi then
  begin
    bracket:=1;
    for aN := partiDa+1 to length(s) do
    begin
      if (s[aN]=parentesi) then inc(bracket);
      if (s[aN]=a) then dec(bracket);
      if bracket=0 then
      begin
        result:=aN;
        break;
      end;
    end;
  end;
end;

function posPrentesiChiusaRitroso(s:string;partiDa:integer):integer; inline;
var
   bracket:integer=0;
   aN:integer;
   a:char;
   parentesi:string='';
begin
  a:=retrieveCharacter(s,partiDa);
  if a=')' then begin parentesi:='(';end;
  if a=']' then begin parentesi:='[';end;
  if a='}' then begin parentesi:='{';end;
  result:=0;
  if parentesi='' then exit;
  bracket:=1;
  aN:=partiDa-1;
  while aN>=1 do
  begin
    if (s[aN]=a) then inc(bracket);
    if (s[aN]=parentesi) then dec(bracket);
    if bracket=0 then
    begin
      result:=aN;
      break;
    end;
    dec(aN);
  end;
end;

function listElementiNum(a:string):integer;
var
  numparam:integer;
  b,c,d,e:string;
  xx:extended;
begin
  result:=0;
  numparam:=1;
  if (retrieveCharacter(a,1)='(')and(retrieveCharacter(a,length(a))=')') then a:=copy(a,2,length(a)-2);
  b:=estraiParametro(a,',',numparam);
  while b<>'' do
  begin
    if trystrtofloat(b,xx) then
    begin
      inc(result);
      inc(numparam);
      b:=estraiParametro(a,',',numparam);
    end
    else
    begin
      result:=0;
      exit;
    end;
  end;
end;

function listElementi(a:string):integer;
var
  numparam:integer;
  b,c,d,e:string;
begin
  result:=0;
  numparam:=1;
  if (retrieveCharacter(a,1)='(')and(retrieveCharacter(a,length(a))=')') then a:=copy(a,2,length(a)-2);
  b:=estraiParametro(a,',',numparam);
  while b<>'' do
  begin
      inc(result);
      inc(numparam);
      b:=estraiParametro(a,',',numparam);
  end;
end;

function addProdList(params:array of string;sumProd:boolean):string;
var
  aN,bN,cN,dN:integer;
  tmpFloat:double;
  a:string;
  sums:array of double;
begin
  result:='';
  if length(params)>0 then
  begin
    bN:=listElementiNum(params[0]);
    for aN:=1 to length(params)-1 do
    begin
      bN:=max(bN,listElementiNum(params[aN]));
    end;
    setLength(sums,bN);
    for aN:=0 to length(sums)-1 do
    begin
      if sumProd=false then sums[aN]:=0;
      if sumProd=true  then sums[aN]:=1;
    end;
    for aN:=0 to length(params)-1 do
    begin
      bN:=listElementiNum(params[aN]);
      if (retrieveCharacter(params[aN],1)='(')and(retrieveCharacter(params[aN],length(params[aN]))=')') then a:=copy(params[aN],2,length(params[aN])-2) else a:=params[aN];
      cN:=1;
      dN:=0;
      while dN<length(sums) do
      begin
        try
          tmpFloat:=strtofloat(estraiParametro(a,',',cN));
          if sumProd=false then sums[dN]:=sums[dN]+tmpFloat;
          if sumProd=true  then sums[dN]:=sums[dN]*tmpFloat;
        except
          result:='err';
          exit;
        end;
        inc(dN);
        inc(cN);
        if cN>bN then cN:=1;
      end;
    end;
    for aN:=0 to length(sums)-1 do
    begin
      result:=result+floattostr(sums[aN]);
      if aN<length(sums)-1 then result:=result+',';
    end;
  end;
end;

function sumMultList(params:array of string;opzione:integer):string;
var
  aN,bN,cN:integer;
  tmpFloat:extended;
  a:string;
  sums:array of extended;
begin
  //opzione=0 : somma, 1: prodotto, 2:media
  result:='';
  if length(params)>0 then
  begin
    bN:=listElementiNum(params[0]);
    for aN:=1 to length(params)-1 do
    begin
      bN:=max(bN,listElementiNum(params[aN]));
    end;
    setLength(sums,bN);
    for aN:=0 to length(sums)-1 do
    begin
      if (opzione=0)or(opzione=2) then sums[aN]:=0;
      if opzione=1  then sums[aN]:=1;
    end;
    for aN:=0 to length(params)-1 do
    begin
      bN:=listElementiNum(params[aN]);
      if (retrieveCharacter(params[aN],1)='(')and(retrieveCharacter(params[aN],length(params[aN]))=')') then a:=copy(params[aN],2,length(params[aN])-2) else a:=params[aN];
      for cN:= 1 to length(sums) do
      begin
        try
          if cN<=bN then
          begin
            tmpFloat:=strtofloat(estraiParametro(a,',',cN));
          end
          else
          begin
            tmpFloat:=0;
          end;
          if (opzione=0)or(opzione=2)  then sums[cN-1]:=sums[cN-1]+tmpFloat;
          if (opzione=1) then sums[cN-1]:=sums[cN-1]*tmpFloat;
        except
          result:='err';
          exit;
        end;
      end;
    end;
    for aN:=0 to length(sums)-1 do
    begin
      if (opzione=2) then sums[aN]:=sums[aN]/length(params);
      result:=result+floattostr(sums[aN]);
      if aN<length(sums)-1 then result:=result+',';
    end;
  end;
end;

function joinList(params:array of string):string;
var
  aN,bN,cN:integer;
  tmpFloat:double;
  a,b:string;
  sums:array of double;
begin
  result:='';
  if length(params)>0 then
  begin
    for aN:=0 to length(params)-1 do
    begin
      bN:=1;
      if (retrieveCharacter(params[aN],1)='(')and(retrieveCharacter(params[aN],length(params[aN]))=')') then a:=copy(params[aN],2,length(params[aN])-2) else a:=params[aN];
      b:=estraiParametro(a,',',bN);
      while b<>'' do
      begin
        if result<>'' then result:=result+',';
        result:=result+b;
        inc(bN);
        b:=estraiParametro(a,',',bN);
      end;
    end;
  end;
end;

procedure Sort(pp:pointer);
var
 aa,bb,cc:^TstringRecord;
 aStr,bStr:string;
 aExt,bExt:extended;
 a,b:boolean;
 xx:string;
begin
  aa:=pp;
  while aa<>nil do
  begin
    bb:=aa^.next;
    if bb<>nil then
    begin
      try
        aExt:=strtofloat(aa^.value);
        bExt:=aExt;
        a:=true;
      except
        a:=false;
      end;
      try
        bExt:=strtofloat(bb^.value);
        b:=true;
      except
        b:=false;
      end;
      if (bExt<aExt)or((a=false)and(b=true)) then
      begin
        xx:=bb^.value;
        bb^.value:=aa^.value;
        aa^.value:=xx;
        aa:=pp;
      end
      else aa:=bb;
    end
    else aa:=bb;
  end;
end;

function orderList(params:array of string):string;
var
   aa:^TstringRecord;
   bb:^TstringRecord;
   primo:pointer;
   a:integer;
begin
  a:=0;
  aa:=nil;
  while a<length(params) do
  begin
    bb:=aa;
    new(aa);
    if bb<>nil then bb^.next:=aa else primo:=aa;
    aa^.prev:=bb;
    aa^.value:=params[a];
    inc(a);
  end;
  aa:=primo;
  Sort(aa);
  result:='';
  while aa<>nil do
  begin
    if result<>'' then result:=result+',';
    result:=result+aa^.value;
    bb:=aa;
    aa:=aa^.next;
    dispose(bb);
  end;
end;

function median(params:array of string):string;
var
   aa:^TstringRecord;
   bb:^TstringRecord;
   primo:pointer;
   a:integer;
   b:boolean;
   c:extended;
begin
  a:=0;
  aa:=nil;
  while a<length(params) do
  begin
    bb:=aa;
    new(aa);
    if bb<>nil then bb^.next:=aa else primo:=aa;
    aa^.prev:=bb;
    aa^.value:=params[a];
    inc(a);
  end;
  aa:=primo;
  Sort(aa);
  result:='';
  a:=0;
  b:=length(params) mod 2 = 0;
  while aa<>nil do
  begin
    inc(a);
    if (b=false) and (a=trunc(length(params)/2+1)) then result:=aa^.value;
    if (b=true) and (a=trunc(length(params)/2)) then c:=strtofloat(aa^.value);
    if (b=true) and (a=trunc(length(params)/2)+1) then result:=double_to_total_digits((c+strtofloat(aa^.value))/2,12,12);
    bb:=aa;
    aa:=aa^.next;
    dispose(bb);
  end;
end;

function loadList(params:array of string):string;
var
  aN,bN,cN:integer;
  tmpFloat:double;
  a,b:string;
  List: TStringList;
  filename:string;
begin
  result:='';
  if length(params)>0 then
  begin
    filename:=trim(params[0]);
    if fileExists(filename) then
    begin
      List := TStringList.Create;
      try
        List.Loadfromfile(filename);
        if List.Text<>'' then result := List.Strings[0];
      except
        showMessage('Error loading '+filename);
      end;
      List.Free;
    end;
  end;
end;

function createSumProdList(params:array of string;opzione:byte):string;
var
  aN,bN,cN,dN,eN,fN:integer;
  numVar,numMins,numMaxs:integer;
  varArray:array of string;
  minArray:array of string;
  maxArray:array of string;
  a,b,c,d:string;
  results:array of string;
  tmpDouble:double;
  indici:array of integer;
begin
  result:='';
  if opzione>2 then exit;
  if length(params)<>4 then begin result:='err';exit;end;
  setLength(varArray,0);
  setLength(minArray,0);
  setLength(maxArray,0);
  numVar:=1;
  if (retrieveCharacter(params[1],1)='(')and(retrieveCharacter(params[1],length(params[1]))=')') then a:=copy(params[1],2,length(params[1])-2) else a:=params[1];
  b:=estraiParametro(a,',',numVar);
  while (b<>'') do
  begin
    if (retrieveCharacter(b,1)<>'{')and(isLetter(retrieveCharacter(b,2)))and(retrieveCharacter(b,length(b))<>'}') then begin result:='err';exit;end;
    setLength(varArray,length(varArray)+1);
    varArray[length(varArray)-1]:=b;
    inc(numVar);
    b:=estraiParametro(a,',',numVar);
  end;
  dec(numVar);
  numMins:=1;
  if (retrieveCharacter(params[2],1)='(')and(retrieveCharacter(params[2],length(params[2]))=')') then a:=copy(params[2],2,length(params[2])-2) else a:=params[2];
  b:=estraiParametro(a,',',numMins);
  while (b<>'') do
  begin
    if (retrieveCharacter(b,1)<>'{')and(isLetter(retrieveCharacter(b,2)))and(retrieveCharacter(b,length(b))<>'}') then begin result:='err';exit;end;
    try
      strtoint(b);
    except
      result:='err';
      exit;
    end;
    setLength(minArray,length(minArray)+1);
    minArray[length(minArray)-1]:=b;
    inc(numMins);
    b:=estraiParametro(a,',',numMins);
  end;
  dec(numMins);
  numMaxs:=1;
  if (retrieveCharacter(params[3],1)='(')and(retrieveCharacter(params[3],length(params[3]))=')') then a:=copy(params[3],2,length(params[3])-2) else a:=params[3];
  b:=estraiParametro(a,',',numMaxs);
  while (b<>'') do
  begin
    if (retrieveCharacter(b,1)<>'{')and(isLetter(retrieveCharacter(b,2)))and(retrieveCharacter(b,length(b))<>'}') then begin result:='err';exit;end;
    try
      strtoint(b);
    except
      result:='err';
      exit;
    end;
    setLength(maxArray,length(maxArray)+1);
    maxArray[length(maxArray)-1]:=b;
    inc(numMaxs);
    b:=estraiParametro(a,',',numMaxs);
  end;
  dec(numMaxs);
  if (numVar<>numMins)or(numVar<>numMaxs) then begin result:='err';exit;end;
  dN:=0;
  eN:=0;
  setLength(results,0);
  setLength(indici,numVar);
  while dN<numVar do
  begin
    aN:=strtoint(minArray[dN]);
    bN:=strtoint(maxArray[dN]);
    if bN>=aN then
    begin
      if length(results)=0 then setLength(results,(bN-aN+1)) else setLength(results,length(results)*(bN-aN+1));
      indici[dN]:=length(results);
    end
    else
    begin
      result:='err';
      exit;
    end;
    inc(dN);
  end;
  for aN:= 0 to length(results)-1 do
  begin
   results[aN]:=params[0];
  end;
  dN:=0;
  while dN<numVar do
  begin
    aN:=strtoint(minArray[dN]);
    bN:=strtoint(maxArray[dN]);
    fN:=aN;
    eN:=0;
    while(eN<length(results)) do
    begin
      for cN:=1 to (indici[dN] div ((bN-aN)+1))do
      begin
         results[eN]:=elabora(stringReplace(results[eN],varArray[dN],inttostr(fN),[rfReplaceAll]));
         inc(eN);
      end;
      if fN=bN then fN:=aN else inc(fN);
    end;
    inc(dN);
  end;
  result:='';
  if opzione=0 then
  begin
    for aN:=0 to length(results)-1 do
    begin
      if result<>'' then result:=result+',';
      result:=result+results[aN];
    end;
  end;
  if opzione>0 then
  begin
    if opzione=1 then tmpDouble:=0 else tmpDouble:=1;
    for aN:=0 to length(results)-1 do
    begin
      try
        if opzione=1 then tmpDouble:=tmpDouble+strtofloat(results[aN]);
        if opzione=2 then tmpDouble:=tmpDouble*strtofloat(results[aN]);
      except
        result:='err';
      end;
      result:=floattostr(tmpDouble);
    end;
  end;
end;

function cropList(params:array of string;opzione:byte):string;
var
  aN,bN,cN:integer;
  a:string;
begin
  result:='';
  if length(params)<>3 then begin result:='err';exit;end;
  try
    aN:=strtoint(elabora(params[1]));
    bN:=strtoint(elabora(params[2]));
  except
    result:='err';
    exit;
  end;
  if (retrieveCharacter(params[0],1)='(')and(retrieveCharacter(params[0],length(params[0]))=')') then a:=copy(params[0],2,length(params[0])-2) else a:=params[0];
  for cN:=aN to bN do
  begin
    if result<>'' then result:=result+',';
    result:=result+estraiParametro(a,',',cN);
  end;
end;

function functionList(params:array of string;funzione:integer):string;
var
  functions     : array of String = ('sinR','cosR','tanR','sinD','cosD','tanD','sqrt','int','abs','mod','pow','min','max','arcSinR','arcCosR','arcTanR','arcSinD','arcCosD','arcTanD','log','ln','logn','fp32','fp64','sum','prod','avg','pVariance','sVariance','pDevStd','sDevStd','count','cmp','random','round','ceil','floor','trunc');
  functionsParm : array of int8 = (1,1,1,1,1,1,1,1,1,2,2,-2,-2,1,1,1,1,1,1,1,1,2,4,8,-1,-1,-1,-2,-2,-2,-2,-1,2,2,1,1,1,2);
  aN,bN,cN:integer;
  a,b:string;
  bb:boolean;
begin
  result:='';
  if (length(params)=1)and(functionsParm[funzione]=1) then
  begin
    bN:=listElementiNum(params[0]);
    if (retrieveCharacter(params[0],1)='(')and(retrieveCharacter(params[0],length(params[0]))=')') then a:=copy(params[0],2,length(params[0])-2) else a:=params[0];
    for aN := 1 to bN do
    begin
      result:=result+risolvi(functions[funzione]+'('+estraiParametro(a,',',aN)+')');
      if aN<bN then result:=result+',';
    end;
  end;
  if (length(params)=2)and(funzione=37) then
  begin
    bN:=listElementiNum(params[0]);
    if (retrieveCharacter(params[0],1)='(')and(retrieveCharacter(params[0],length(params[0]))=')') then a:=copy(params[0],2,length(params[0])-2) else a:=params[0];
    for aN := 1 to bN do
    begin
      result:=result+risolvi(functions[funzione]+'('+estraiParametro(a,',',aN)+','+params[1]+')');
      if aN<bN then result:=result+',';
    end;
  end;
  if (length(params)>1)and((funzione=33)or(funzione=32)) then
  begin
    bb:=true;
    for aN:=0 to length(params)-1 do
    begin
      cN:=listElementiNum(params[aN]);
      if cN<>2 then
      begin
        bb:=false;
        break;
      end;
    end;
    if bb then
    begin
      bN:=length(params)-1;
      for aN:=0 to bN do
      begin
        if (retrieveCharacter(params[aN],1)='(')and(retrieveCharacter(params[aN],length(params[aN]))=')') then a:=copy(params[aN],2,length(params[aN])-2) else a:=params[aN];
        result:=result+risolvi(functions[funzione]+'('+estraiParametro(a,',',1)+','+estraiParametro(a,',',2)+')');
        if aN<bN then result:=result+',';
      end;
    end;
  end;
end;

function elabora(a:string):string;
type
  TarrayVars=array of array of string;
var
   functions     : array of String = ('sinR','cosR','tanR','sinD','cosD','tanD','sqrt','int','abs','mod','pow','min','max','arcSinR','arcCosR','arcTanR','arcSinD','arcCosD','arcTanD','log','ln','logn','fp32','fp64','sum','prod','avg','pVariance','sVariance','pDevStd','sDevStd','count','cmp','random','round','ceil','floor','trunc');
   functionsParm : array of int8 = (1,1,1,1,1,1,1,1,1,2,2,-2,-2,1,1,1,1,1,1,1,1,2,4,8,-1,-1,-1,-2,-2,-2,-2,-1,2,2,1,1,1,2);
   functionsList : array of String = ('sumList','prodList','joinList','createList','sigmaSum','piProd','cropList','loadList','sortList','median');
   b,c,d,e:string;
   aB,bB:boolean;
   aN,bN,cN,dN,eN,fN:integer;
   numparam:integer;
   params:array of string;
   tmpArray:array of string;
begin
  b:='';
  result:=b;
  fN:=pos(')',a);
  while (b<>a)or(fN<>0) do
  begin
    b:=a;
    a:=risolvi(a);
    for eN:=1 to 2 do
    begin
      if eN=1 then tmpArray:=functions;
      if eN=2 then tmpArray:=functionsList;
      for aN:=0 to length(tmpArray)-1 do
      begin
        setLength(params,0);
        bN:=posRitrosoPartiDa(tmpArray[aN],a,posPrentesiChiusaRitroso(a,fN));
        if bN>0 then
        begin
          if isLetter(retrieveCharacter(a,bN-1))=false then
          begin
            if (retrieveCharacter(a,bN+length(tmpArray[aN]))='(') then
            begin
              dN:=bN+length(tmpArray[aN]);
              cN:=posPrentesiChiusa(a,dN,'(');
              d:=copy(a,dN+1,cN-dN-1);
              numparam:=1;
              e:=estraiParametro(d,',',numparam);
              aB:=true;
              while e<>'' do
              begin
                if listElementiNum(e)=0 then begin aB:=false;break;end;
                setLength(params,length(params)+1);
                params[length(params)-1]:=e;
                inc(numparam);
                e:=risolvi(estraiParametro(d,',',numparam));
              end;
              dec(numparam);
              if (aB) and (numparam>0) then
              begin
                if (aN<24)and (eN=1)  then a:=copy(a,1,bN-1)+functionList(params,aN)+copy(a,cN+1,length(a));
                if (aN>=34) and (aN<=36)and (eN=1) then a:=copy(a,1,bN-1)+functionList(params,aN)+copy(a,cN+1,length(a));
                if (aN=24) and (eN=1) then a:=copy(a,1,bN-1)+sumMultList(params,0)+copy(a,cN+1,length(a));
                if (aN=25) and (eN=1) then a:=copy(a,1,bN-1)+sumMultList(params,1 )+copy(a,cN+1,length(a));
                if (aN=26) and (eN=1) then a:=copy(a,1,bN-1)+sumMultList(params,2 )+copy(a,cN+1,length(a));
                if (aN=32) and (eN=1)  then a:=copy(a,1,bN-1)+functionList(params,aN)+copy(a,cN+1,length(a));
                if (aN=33) and (eN=1)  then a:=copy(a,1,bN-1)+functionList(params,aN)+copy(a,cN+1,length(a));
                if (aN=37) and (eN=1)  then a:=copy(a,1,bN-1)+functionList(params,aN)+copy(a,cN+1,length(a));
                if (aN=0)  and (eN=2) then  a:=copy(a,1,bN-1)+addProdList(params,false)+copy(a,cN+1,length(a));
                if (aN=1)  and (eN=2) then  a:=copy(a,1,bN-1)+addProdList(params,true)+copy(a,cN+1,length(a));
                if (aN=2)  and (eN=2) then  a:=copy(a,1,bN-1)+joinList(params)+copy(a,cN+1,length(a));
              end;
              setLength(params,0);
              numparam:=1;
              e:=estraiParametro(d,',',numparam);
              aB:=true;
              while e<>'' do
              begin
                if listElementi(e)=0 then begin aB:=false;break;end;
                setLength(params,length(params)+1);
                params[length(params)-1]:=e;
                inc(numparam);
                e:=risolvi(estraiParametro(d,',',numparam));
              end;
              dec(numparam);
              if (aB) and (numparam>0) then
              begin
                if (aN=3)and(eN=2) then  a:=copy(a,1,bN-1)+createSumProdList(params,0)+copy(a,cN+1,length(a));
                if (aN=4)and(eN=2) then  a:=copy(a,1,bN-1)+createSumProdList(params,1)+copy(a,cN+1,length(a));
                if (aN=5)and(eN=2) then  a:=copy(a,1,bN-1)+createSumProdList(params,2)+copy(a,cN+1,length(a));
                if (aN=6)and(eN=2) then  a:=copy(a,1,bN-1)+cropList(params,2)+copy(a,cN+1,length(a));
                if (aN=7)and(eN=2) then  a:=copy(a,1,bN-1)+loadList(params)+copy(a,cN+1,length(a));
                if (aN=8)and(eN=2) then  a:=copy(a,1,bN-1)+orderList(params)+copy(a,cN+1,length(a));
                if (aN=9)and(eN=2) then  a:=copy(a,1,bN-1)+median(params)+copy(a,cN+1,length(a));
              end;
            end;
          end;
        end;
      end;
    end;
    aN:=pos(']',a);
    if aN>0 then
    begin
      bN:=posPrentesiChiusaRitroso(a,aN);
      if bN>0 then
      begin
        c:=copy(a,bN+1,aN-bN-1);
        c:=risolvi(c);
        try
          cN:=strtoint(c);
          if (retrieveCharacter(a,bN-1)=')') then
          begin
            dN:=posPrentesiChiusaRitroso(a,bN-1);
            e:=copy(a,dN,bN-dN);
            if (cN<=listElementi(e))and(cN>0) then
            begin
              e:=copy(e,2,length(e)-2);
              a:=copy(a,1,dN-1)+estraiParametro(e,',',cN)+copy(a,aN+1,length(a));
            end
            else
            begin
              a:=copy(a,1,dN-1)+'(outOfBound)'+copy(a,aN+1,length(a));
            end;
          end;
        except
        end;
      end;
    end;
    fN:=posPartiDa(')',a,fN+1);
  end;
  result:=a;
end;

function DateTimeToStrUs(dt: TDatetime): string;
var
    us: string;
begin
    //extract the number of microseconds
    dt := Frac(dt); //fractional part of day
    dt := dt * 24*60*60; //number of seconds in that day
    us := IntToStr(Round(Frac(dt)*1000000));
    Result := us;
end;

function XstrToFloat(a:string):extended; inline;
var
    intPart:string;
    decPart:string;
    b,c,d:integer;
    e:extended;
begin
  result:=0;
  b:=pos('.',a);
  if b>0 then
  begin
    intPart:=copy(a,1,b-1);
    decPart:=copy(a,b+1,length(a));
  end
  else intPart:=a;
  c:=length(intPart);
  e:=1;
  for b:=0 to length(intPart)-1 do
  begin
    d:=ord(intPart[c-b]);
    if (d>=48)and(d<=57) then
    begin
      result:=result+(d-48)*e;
    end;
    e:=e*10;
  end;
  e:=0.1;
  for b:=1 to length(decPart) do
  begin
    d:=ord(decPart[b]);
    if (d>=48)and(d<=57) then
    begin
      result:=result+(d-48)*e;
    end;
    e:=e/10;
  end;
  //result:=result;
end;

function newList(a:string;index:integer;daInserire:string):string;
var
    c,d,e,f:integer;
    dd:string;
begin
  result:='';
  c:=pos(a,'[');
  d:=pos(a,']');
  c:=1;
  dd:=estraiParametro(a,',',c);
  while (dd<>'') do
  begin
    if c=index then result:=result+daInserire else result:=result+dd;
    inc(c);
    dd:=estraiParametro(a,',',c);
    if dd<>'' then result:=result+',';
  end;
end;

procedure TForm1.started;
var
    a:boolean=false;
begin
  memo1.OnChange:=nil;
  working:=true;
  button23.Width:=62;
  button23.Caption:='Stop';
  memo1.ReadOnly:=true;
  button1.Enabled:=a;
  button2.Enabled:=a;
  button3.Enabled:=a;
  button4.Enabled:=a;
  button5.Enabled:=a;
  button6.Enabled:=a;
  button7.Enabled:=a;
  button8.Enabled:=a;
  button9.Enabled:=a;
  button10.Enabled:=a;
  button11.Enabled:=a;
  button12.Enabled:=a;
  button13.Enabled:=a;
  button14.Enabled:=a;
  button15.Enabled:=a;
  button16.Enabled:=a;
  button17.Enabled:=a;
  button18.Enabled:=a;
  button19.Enabled:=a;
  button20.Enabled:=a;
  button22.Enabled:=a;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  p,pp:PctrlZ;
begin
  p:=iniziale;
  while p<>nil do
  begin
    pp:=p;
    p:=p^.next;
    dispose(pp);
  end;
end;

procedure TForm1.MenuItem53Click(Sender: TObject);
begin
   InsertStringAtcaret('gamma(');
end;

procedure TForm1.MenuItem55Click(Sender: TObject);
begin
   InsertStringAtcaret('round(');
end;

procedure TForm1.MenuItem56Click(Sender: TObject);
begin
   InsertStringAtcaret('trunc(');
end;

procedure TForm1.MenuItem57Click(Sender: TObject);
begin
   InsertStringAtcaret('ceil(');
end;

procedure TForm1.MenuItem58Click(Sender: TObject);
begin
    InsertStringAtcaret('floor(');
end;

procedure TForm1.MenuItem59Click(Sender: TObject);
begin
   InsertStringAtcaret('random(');
end;

procedure TForm1.stopped;
var
    a:boolean=true;
begin
  memo1.OnChange:=@Memo1Change;
  working:=false;
  button23.Width:=41;
  button23.Caption:='C';
  memo1.ReadOnly:=false;
  button1.Enabled:=a;
  button2.Enabled:=a;
  button3.Enabled:=a;
  button4.Enabled:=a;
  button5.Enabled:=a;
  button6.Enabled:=a;
  button7.Enabled:=a;
  button8.Enabled:=a;
  button9.Enabled:=a;
  button10.Enabled:=a;
  button11.Enabled:=a;
  button12.Enabled:=a;
  button13.Enabled:=a;
  button14.Enabled:=a;
  button15.Enabled:=a;
  button16.Enabled:=a;
  button17.Enabled:=a;
  button18.Enabled:=a;
  button19.Enabled:=a;
  button20.Enabled:=a;
  button22.Enabled:=a;
end;

procedure swapVars(a,b:string;Pvars:pointer);
type
  TVars=array of array of string;
var
 vars:array of array of string;
 c,d,e,f,g:string;
 aN,bN,cN,dN:integer;
 posA,posB:extended;
 aa,bb:boolean;
 val1,val2,tmpVal1,tmpVal2:string;
 var1,var2:string;
 posAA,posBB:integer;
begin
   aa:=false;
   bb:=false;
   val1:='';
   val2:='';
   var1:='';
   var2:='';
   vars:=TVars(PVars^);
   aN:=pos('[',a);
   if aN>2 then
   begin
     var1:=copy(a,2,aN-2);
     bN:=posPartiDa(']',a,aN+1);
     if bN>0 then
     begin
       c:=copy(a,aN+1,bN-aN-1);
       if trystrtofloat(c,posA) then aa:=true else raise Exception.CreateFmt('noPOS',[aN]);
     end;
   end
   else var1:=copy(a,2,length(a));
   aN:=pos('[',b);
   if aN>2 then
   begin
     var2:=copy(b,2,aN-2);
     bN:=posPartiDa(']',b,aN+1);
     if bN>0 then
     begin
       d:=copy(b,aN+1,bN-aN-1);
       if trystrtofloat(d,posB) then bb:=true else raise Exception.CreateFmt('noPOS',[aN]);
     end;
   end
   else var2:=copy(b,2,length(b));
   if (var1<>'')and(var2<>'') then
   begin
     for aN:=0 to length(vars)-1 do
     begin
       if vars[aN,0]=var1 then begin val1:=vars[aN,1];posAA:=aN;end;
       if vars[aN,0]=var2 then begin val2:=vars[aN,1];posBB:=aN;end;
     end;
   end;
   if (val1<>'')and(val2<>'') then
   begin
     tmpVal1:=val1;
     tmpVal2:=val2;
     if (aa=false)and(bb=false) then
     begin
       vars[posAA,1]:=val2;
       vars[posBB,1]:=tmpVal1;
     end;
     if posA>0 then
     begin
       aN:=round(posA);
       if (aN<=listElementi(tmpVal1))and(aN>0) then
       begin
         tmpVal1:=estraiParametro(tmpVal1,',',aN);
       end
       else
       begin
         raise Exception.CreateFmt('outOfBound',[aN]);
       end;
     end;
     if posB>0 then
     begin
       aN:=round(posB);
       if (aN<=listElementi(tmpVal2))and(aN>0) then
       begin
         tmpVal2:=estraiParametro(tmpVal2,',',aN);
       end
       else
       begin
         raise Exception.CreateFmt('outOfBound',[aN]);
       end;
     end;
     if posB>0 then
     begin
        vars[posBB,1]:=newList(val2,round(posB),tmpVal1);
       if var1=var2 then val1:=vars[posBB,1];
     end
     else vars[posBB,1]:=tmpVal1;
     if posA>0 then
     begin
        vars[posAA,1]:=newList(val1,round(posA),tmpVal2);
     end
     else vars[posAA,1]:=tmpVal2;
   end;
end;

procedure TForm1.calcola;
var
   aTime,bTime,cTime,rTime:qword;
  aN,bN,cN,dN:integer;
  valExtended:extended;
  a,b,c,d,e,f,g:string;
  righe:integer;
  ans:string='';
  vars:array of array of string;
  history:array of string;
  tmpDouble:double;
  jj,hh:boolean;
  err:string;
  posVar:integer;
  stack:array of integer;
  functions     : array of String = ('sinR','cosR','tanR','sinD','cosD','tanD','sqrt','int','abs','mod','pow','min','max','arcSinR','arcCosR','arcTanR','arcSinD','arcCosD','arcTanD','log','ln','logn','fp32','fp64','sum','prod','avg','pVariance','sVariance','pDevStd','sDevStd','count');
  constantsNome : array of String = ('pi','nepero','avogadro');
  constantsVal  : array of String = ('3.14159265358979323846','2.71828182845904523','6.022E23');
begin
  randseed:=GetTickCount*randseed;
  halted:=false;
  memo1.ReadOnly:=true;
  inibito:=true;
  timer3.Enabled:=true;
  aTime:=0;
  bTime:=0;
  cTime:=0;
  rTime:=gettickcount64();
  aN:=0;
  righe:=memo1.Lines.Count;
  while (aN<righe) do
  begin
    a:=memo1.Lines[aN];
    bN:=pos('=',a);
    cN:=posPartiDa('=0x',a,bN); dN:=4;
    if cN=0 then begin cN:=posPartiDa('=b',a,bN); dN:=3; end;
    if cN=0 then begin cN:=posPartiDa('=fp32',a,bN); dN:=6; end;
    if cN=0 then begin cN:=posPartiDa('=fp64',a,bN); dN:=6; end;
    if (cN=bN)and(bN>0) then bN:=bN+dN;
    if bN>0 then
    begin
      b:=copy(a,1,bN-1);
      cN:=posPartiDa(' ',a,bN);
      if cN>0 then
      begin
        b:=b+' '+copy(a,cN,length(a));
      end;
      memo1.Lines[aN]:=b;
    end;
    inc(aN);
  end;
  application.ProcessMessages;
  setLength(vars,0);
  setLength(history,0);
  setLength(stack,0);
  aN:=0;
  while (aN<righe) do
  begin
    err:='';
    a:=memo1.Lines[aN];
    inc(aN);
    if (length(a)>=1) then
    begin
      if (a[1]='#') then
      begin
        continue;
      end;
    end;
    bN:=pos('=',a);
    cN:=pos(' ',a);
    if (bN=0)and(cN=0) then a:=a+'=';
    if (bN=0)or((bN>cN)and(cN>0)) then
    begin
      if cN>0 then a:=copy(a,1,cN-1)+'='+copy(a,cN,length(a));
      if cN=0 then a:=a+'=';
    end;
    b:='';
    d:=a;
    jj:=false;
    dN:=1;
    bN:=pos(':',a);
    if bN>0 then
    begin
      e:=copy(a,1,bN-1);
      if (isletter(retrieveCharacter(e,1))) and (e<>'ans') and (e<>'undef') and not (e in functions) and not (e in constantsNome) then
      begin
        hh:=false;
        c:=copy(a,1,bN-1);
        dN:=pos('[',c);
        if dN>0 then c:=copy(c,1,dN-1);
        for cN:=0 to length(vars)-1 do
        begin
          if vars[cN,0]=c then
          begin
            hh:=true;
            jj:=true;
            posVar:=cN;
            break;
          end;
        end;
        if hh=false then
        begin
          setLength(vars,length(vars)+1);
          setLength(vars[length(vars)-1],2);
          vars[length(vars)-1,0]:=c;
          vars[length(vars)-1,1]:='undef';
          posVar:=length(vars)-1;
          jj:=true;
        end;
        if dN=0 then a:=copy(a,bN+1,length(a));
      end
      else
      begin
        err:='VarError';
      end;
    end;
    if trystrtofloat(a,tmpDouble)=false then
    begin
      for bN:=0 to length(vars)-1 do
      begin
        if trystrtofloat(vars[bN,1],tmpDouble)=false then
        begin
          for cN:=0 to bN-1 do
          begin
            vars[bN,1]:=sostituisci(vars[cN,0],vars[cN,1],vars[bN,1]);
          end;
        end;
        a:=sostituisci(vars[bN,0],vars[bN,1],a);
      end;
      for bN:=0 to length(constantsNome)-1 do
      begin
        a:=sostituisci(constantsNome[bN],constantsVal[bN],a);
      end;
    end;
    if trystrtofloat(a,tmpDouble)=false then
    begin
      if pos('all',a)>0 then
      begin
        f:='';
        for bN:=0 to length(history)-1 do
        begin
          f:=f+history[bN];
          if bN<length(history)-1 then f:=f+',';
        end;
        a:=sostituisci('all',f,a);
      end;
      a:=sostituisci('ans',ans,a);
    end;
    bN:=pos('=',a);
    aTime:=bTime;
    if bN>0 then
    begin
      b:=copy(a,1,bN-1);
      if err='' then
      begin
        cN:=pos(']:',b);
        if cN>0 then
        begin
          c:=elabora(copy(b,cN+2,length(b)));
          dN:=pos(')[',b);
          if cN>0 then
          begin
            try
              f:=copy(b,dN+2,cN-dN-2);
              cN:=round(strtofloat(elabora(f)));
              c:=newList(copy(b,2,dN-2),cN,c);
            except
            end;
          end;
        end
        else
        begin
                    aTime:=gettickcount64();
          c:=elabora(b);
                    bTime:=gettickcount64();
        end;
        if length(c)>0 then
        begin
          if (ord(c[1])<=57)and(ord(c[1])>=48) then
          begin
            try
              setLength(history,length(history)+1);
              history[length(history)-1]:=c;
            except
            end;
          end;
        end;
        if ((retrieveCharacter(a,bN+1)='0')and(retrieveCharacter(a,bN+2)='x'))or(((retrieveCharacter(a,bN+1)='-')and(retrieveCharacter(a,bN+2)='0'))and(retrieveCharacter(a,bN+3)='x')) then
        begin
          try
            if strtofloat(c)>=0 then c:='0x'+inttohex(round(strtofloat(c)),2) else c:='-0x'+inttohex(round(abs(strtofloat(c))),2);
          except
          end;
        end;
        if (retrieveCharacter(a,bN+1)='b')or((retrieveCharacter(a,bN+1)='-')and(retrieveCharacter(a,bN+2)='b')) then
        begin
          try
            if strtofloat(c)>=0 then c:='b'+dec2Bin(round(abs(strtofloat(c)))) else c:='-b'+dec2Bin(round(abs(strtofloat(c))));
          except
          end;
        end;
        if (retrieveCharacter(a,bN+1)='f')and(retrieveCharacter(a,bN+2)='p')and(retrieveCharacter(a,bN+3)='3')and(retrieveCharacter(a,bN+4)='2') then
        begin
          try
            c:=dec2fp32(strtofloat(c));
          except
          end;
        end;
        if (retrieveCharacter(a,bN+1)='f')and(retrieveCharacter(a,bN+2)='p')and(retrieveCharacter(a,bN+3)='6')and(retrieveCharacter(a,bN+4)='4') then
        begin
          try
            c:=dec2fp64(strtofloat(c));
          except
          end;
        end;
      end
      else c:=err;
      if (gettickcount64()-rTime>1000) then
      begin
        application.ProcessMessages;
        rTime:=gettickcount64();
        if halted then
        begin
          stopped;
          exit;
        end;
      end;
      hh:=false;
      if trystrtofloat(c,tmpDouble)=false then
      begin
        if pos('goto(',c)=1 then
        begin
          hh:=true;
          e:=copy(c,6,posRitrosoPartiDa(')',c,length(c))-6);
          f:=estraiParametro(e,',',1);
          if f='1' then
          begin
            f:=estraiParametro(e,',',2);
            if trystrtoint(f,bN) then
            begin
              if (aN+bN-1<=righe-1)and(aN+bN-1>=0) then aN:=aN+bN-1;
            end
            else
            begin
              for bN:=0 to memo1.Lines.Count-1 do
              begin
                if memo1.Lines[bN]=f then
                begin
                  aN:=bN;
                  break;
                end;
              end;
            end;
          end;
        end;
        if pos('swap(',c)=1 then
        begin
          //hh:=true;
          e:=copy(c,6,posRitrosoPartiDa(')',c,length(c))-6);
          f:=estraiParametro(e,',',1);
          g:=estraiParametro(e,',',2);
          if (length(f)>1)and(length(g)>1) then
          begin
            if (f[1]='@') and (g[1]='@') then
            begin
              try
                swapVars(f,g,@vars);
                c:='ok';
              except
                c:='err';
              end;
            end;
          end;
        end;
        if pos('gosub(',c)=1 then
        begin
          hh:=true;
          e:=copy(c,7,posRitrosoPartiDa(')',c,length(c))-7);
          f:=estraiParametro(e,',',1);
          if f='1' then
          begin
            f:=estraiParametro(e,',',2);
            for bN:=0 to memo1.Lines.Count-1 do
            begin
              if memo1.Lines[bN]=f then
              begin
                setLength(stack,length(stack)+1);
                stack[length(stack)-1]:=aN;
                aN:=bN;
              end;
            end;
          end;
        end;
        if c='return' then
        begin
          hh:=true;
          bN:=length(stack);
          if bN>0 then
          begin
            aN:=stack[bN-1];
            setLength(stack,bN-1);
          end;
        end;
        if c='exit' then
        begin
          hh:=true;
          stopped;
          exit;
        end;
      end;

      if hh=false then
      begin
        if jj then vars[posVar,1]:=c;
        dN:=posPartiDa(' ',d,pos('=',d));
        f:=copy(d,pos(':',d)+1,pos('=',d)-pos(':',d)-1);
        hh:=pos(']:',d)=0;
        hh:=(hh) and (copy(d,pos(':',d)+1,pos('=',d)-pos(':',d)-1)<>c);
        if hh then
        begin
          if length(c)<100 then a:=copy(d,1,pos('=',d))+c else a:=copy(d,1,pos('=',d))+copy(c,1,50)+'{...}'+copy(c,length(c)-50,length(c));
        end
        else
        begin
          a:=copy(d,1,pos('=',d)-1);
        end;
        if dN>0 then a:=a+copy(d,dN,length(d));
        if c<>'' then ans:=c;
        memo1.Lines[aN-1]:=a;
      end;
    end;
    ans:=sostituisci('ans','error',ans); //Se c'è ancora scritto ans vuol dire che è indefinita
    cTime:=cTime+bTime-aTime;
  end;
  inibito:=false;
  timer3.Enabled:=false;
  stopped;
  //form1.Caption:=inttostr(cTime);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  InsertStringAtcaret('+');
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  InsertStringAtcaret('^');
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  InsertStringAtcaret('*');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  InsertStringAtcaret('/');
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  InsertStringAtcaret('-');
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  InsertStringAtcaret(',');
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  InsertStringAtcaret('.');
end;

procedure TForm1.Button221MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  timer2.Interval:=400;
  backSpaceclicked:=true;
  timer2.Enabled:=true;
  backSpaceTimer:=0;
  Timer2Timer(nil);
end;

procedure TForm1.Button221MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  backSpaceclicked:=false;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
    if working then
    begin
      halted:=true;
      memo1.SetFocus;
    end
    else
    begin
      memo1.Text:='';
      memo1.SetFocus;
    end;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var
  p:PctrlZ;
begin
  if ssCtrl in Shift then
  begin
    if (Key=90)and not(ssShift in Shift) then
    begin
      if (ctrlZ^.prev<>nil) then
      begin
        if ctrlZ^.fine=false then
        begin
          memo1.OnChange:=nil;
          ctrlZ:=ctrlZ^.prev;
          memo1.Text:=ctrlZ^.text;
          memo1.SelStart:=ctrlZ^.ctrlZpos;
          memo1.OnChange:=@Memo1Change;
        end;
      end;
    end;
    if (Key=90)and(ssShift in Shift) then
    begin
      p:=ctrlZ^.next;
      if p<>nil then
      begin
        if p^.fine=false then
        begin
          memo1.OnChange:=nil;
          ctrlZ:=p;
          memo1.Text:=ctrlZ^.text;
          memo1.SelStart:=ctrlZ^.ctrlZpos;
          memo1.OnChange:=@Memo1Change;
        end;
      end;
    end;
  end;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: char);
var
  a:string;
  b,c,d:integer;
  e:boolean=false;
  bb: array of string = ('*','/','^','+','-','=');
begin
  for b:=0 to length(bb)-1 do
  begin
    if (bb[b]=key)and(Memo1.CaretPos.Y>0) then
    begin
      InsertStringAtcaret(key);
      key:=#0;
      break;
    end;
  end;
  if (key<>#10)and(key<>#13) then exit;
  b:=Memo1.CaretPos.Y;
  c:=Memo1.CaretPos.X;
  memo1.Lines[b]:=trim(memo1.Lines[b]);
  a:=memo1.Lines[b];
  if (c>=length(a))and(pos(' ',a)=0)and(pos('=',a)=0)and(length(a)>=1) then
  begin
    if (a[1]<>'#')and((pos('goto(',trim(a))=1)=false) then
    begin
      //memo1.Lines[b]:=memo1.Lines[b]+'=';
    end;
  end;
  if c=0 then
  begin
    memo1.Lines.Insert(b,'');
  end;
  if (c=length(memo1.Lines[b]))and(c>0) then
  begin
    memo1.Lines.Insert(b+1,'');
    e:=true;
  end;
  if (c>0)and(pos('=',memo1.Lines[b])=0)and(c<length(memo1.Lines[b])) then
  begin
    memo1.Lines.Insert(b+1,'');
    a:=memo1.Lines[b];
    memo1.Lines[b]:=copy(a,1,c);
    memo1.Lines[b+1]:=copy(a,c+1,length(a));
  end;
  calcola;
  Memo1.CaretPos := TPoint.Create(0, b+1);
  if (memo1.Lines[memo1.Lines.count-1]='')and(e) then memo1.Lines.Delete(memo1.Lines.count-1);
  key:=#0;
end;

procedure TForm1.Button11lick(Sender: TObject);
var
  key:char=#13;
  a,b,c,d:integer;
  nn: array of string = ('b','0x','fp32','fp64','');
begin
  a:=Memo1.CaretPos.Y;
  c:=pos(' ',memo1.Lines[a]);
  for d := 0 to length(nn)-1 do
  begin
    b:=pos('='+nn[d],memo1.Lines[a]);
    if (b>0)and(b<c) then break;
  end;
  if (b>0)and((b<c)or(c=0)) then begin memo1.Lines[a]:=copy(memo1.Lines[a],1,b-1)+'='+copy(memo1.Lines[a],b+length(nn[d]),length(memo1.Lines[a])); end;
  //if (b=0)or((b>c)and(c>0)) then InsertStringAtcaret('=');
  Memo1KeyPress(memo1,key);
  memo1.Lines.Delete(a+1);
  memo1.SetFocus;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
    InsertStringAtcaret('(');
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
    InsertStringAtcaret(')');
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  InsertStringAtcaret('0');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  InsertStringAtcaret('1');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  InsertStringAtcaret('6');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  InsertStringAtcaret('2');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  InsertStringAtcaret('7');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  InsertStringAtcaret('3');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  InsertStringAtcaret('8');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  InsertStringAtcaret('4');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  InsertStringAtcaret('9');
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  InsertStringAtcaret('5');
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  p:PctrlZ;
begin
  randseed:=GetTickCount;
  oldX:=0;
  oldY:=0;
  backSpaceTimer:=0;
  new(p);
  ctrlZ:=p;
  ctrlZ^.next:=nil;
  ctrlZ^.text:='';
  ctrlZ^.lastCrono:=0;
  ctrlZ^.ctrlZcrono:=0;
  ctrlZ^.prev:=nil;
  iniziale:=ctrlZ;
  working:=false;
end;

procedure TForm1.Memo1Change(Sender: TObject);
var
  a:int64;
  p:PctrlZ;
  ctrlZcrono:integer;
begin
  a:=milliSecondsBetween(now,ctrlZ^.lastCrono);
  ctrlZcrono:=ctrlZ^.ctrlZcrono;
  if ((a>1000)) then
  begin
    if (ctrlZ^.next=nil) then
    begin
      new(p);
      ctrlZ^.next:=p;
      p^.prev:=ctrlZ;
      ctrlZ:=p;
      ctrlZ^.next:=nil;
      inc(ctrlZcrono);
      ctrlZ^.ctrlZcrono:=ctrlZcrono;
      ctrlZ^.fine:=false;
      if ctrlZcrono=100 then
      begin
        ctrlZ^.next:=iniziale;
        iniziale^.prev:=ctrlZ;
      end;
    end
    else
    begin
      ctrlZ:=ctrlZ^.next;
      p:=ctrlZ^.next;
      if p<>nil then p^.fine:=true;
    end;
  end;
  ctrlZ^.fine:=false;
  ctrlZcrono:=ctrlZ^.ctrlZcrono;
  ctrlZ^.text:=memo1.text;
  ctrlZ^.ctrlZpos:=memo1.SelStart;
  ctrlZ^.lastCrono:=Now;
end;

procedure TForm1.InsertStringAtcaret(MyString: string);
var
  a:integer;
  bb: array of string = ('*','/','^','+','-','=','=b','=0x','=fp32','=fp64');
begin
  if inibito then exit;
  a:=memo1.SelStart;
  if (Memo1.CaretPos.X=0)and(MyString in bb)and(Memo1.CaretPos.Y>0) then MyString:='ans'+MyString;
  memo1.Text := Copy(memo1.Text, 1, memo1.SelStart) +  MyString + Copy(memo1.Text, memo1.SelStart + memo1.SelLength + 1, length(memo1.Text));
  memo1.SelStart := a+length(MyString);
  memo1.SetFocus;
  timer1.OnTimer(nil);
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  InsertStringAtcaret('arcTanD(');
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  InsertStringAtcaret('arcCosR(');
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
    InsertStringAtcaret('arcSinR(');
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  InsertStringAtcaret('arcTanR(');
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  InsertStringAtcaret('abs(');
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
begin
  InsertStringAtcaret('sqrt(');
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
  InsertStringAtcaret('mod(');
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
begin
  InsertStringAtcaret('pow(');
end;

procedure TForm1.MenuItem19Click(Sender: TObject);
begin
  InsertStringAtcaret('pDevStd(');
end;

procedure TForm1.MenuItem20Click(Sender: TObject);
begin
  InsertStringAtcaret('sDevStd(');
end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  InsertStringAtcaret('ans');
  inibito:=true;      //Workaround per evitare il doppio click (bug di lazarus?)
  timer1.Enabled:=false;
  timer1.Enabled:=true;
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  InsertStringAtcaret('log(');
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  InsertStringAtcaret('ln(');
end;

procedure TForm1.MenuItem25Click(Sender: TObject);
begin
  InsertStringAtcaret('b');
end;

procedure TForm1.MenuItem26Click(Sender: TObject);
begin
  InsertStringAtcaret('0x');
end;

procedure TForm1.MenuItem27Click(Sender: TObject);
var
  key:char=#13;
  a,b,c:integer;
begin
  a:=Memo1.CaretPos.Y;
  b:=pos('=',memo1.Lines[a]);
  c:=pos(' ',memo1.Lines[a]);
  if (b>0)and((b<c)or(c=0)) then begin memo1.Lines[a]:=copy(memo1.Lines[a],1,b-1)+'=b'+copy(memo1.Lines[a],b+1,length(memo1.Lines[a])); end;
  if (b=0)or((b>c)and(c>0)) then InsertStringAtcaret('=b');
  Memo1KeyPress(memo1,key);
  memo1.Lines.Delete(a+1);
  memo1.SetFocus;
end;

procedure TForm1.MenuItem28Click(Sender: TObject);
var
  key:char=#13;
  a,b,c:integer;
begin
  a:=Memo1.CaretPos.Y;
  b:=pos('=',memo1.Lines[a]);
  c:=pos(' ',memo1.Lines[a]);
  if (b>0)and((b<c)or(c=0)) then begin memo1.Lines[a]:=copy(memo1.Lines[a],1,b-1)+'=0x'+copy(memo1.Lines[a],b+1,length(memo1.Lines[a])); end;
  if (b=0)or((b>c)and(c>0)) then InsertStringAtcaret('=0x');
  Memo1KeyPress(memo1,key);
  memo1.Lines.Delete(a+1);
  memo1.SetFocus;
end;

procedure TForm1.MenuItem29Click(Sender: TObject);
begin
  InsertStringAtcaret('fp32(');
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
   InsertStringAtcaret('cosD(');
end;

procedure TForm1.MenuItem30Click(Sender: TObject);
var
  key:char=#13;
  a,b,c:integer;
begin
  a:=Memo1.CaretPos.Y;
  b:=pos('=',memo1.Lines[a]);
  c:=pos(' ',memo1.Lines[a]);
  if (b>0)and((b<c)or(c=0)) then begin memo1.Lines[a]:=copy(memo1.Lines[a],1,b-1)+'=fp32'+copy(memo1.Lines[a],b+1,length(memo1.Lines[a])); end;
  if (b=0)or((b>c)and(c>0)) then InsertStringAtcaret('=fp32');
  Memo1KeyPress(memo1,key);
  memo1.Lines.Delete(a+1);
  memo1.SetFocus;
end;

procedure TForm1.MenuItem31Click(Sender: TObject);
begin
  InsertStringAtcaret('fp64(');
end;

procedure TForm1.MenuItem32Click(Sender: TObject);
var
  key:char=#13;
  a,b,c:integer;
begin
  a:=Memo1.CaretPos.Y;
  b:=pos('=',memo1.Lines[a]);
  c:=pos(' ',memo1.Lines[a]);
  if (b>0)and((b<c)or(c=0)) then begin memo1.Lines[a]:=copy(memo1.Lines[a],1,b-1)+'=fp64'+copy(memo1.Lines[a],b+1,length(memo1.Lines[a])); end;
  if (b=0)or((b>c)and(c>0)) then InsertStringAtcaret('=fp64');
  Memo1KeyPress(memo1,key);
  memo1.Lines.Delete(a+1);
  memo1.SetFocus;
end;

procedure TForm1.MenuItem34Click(Sender: TObject);
begin
  InsertStringAtcaret('min(');
end;

procedure TForm1.MenuItem35Click(Sender: TObject);
begin
  InsertStringAtcaret('max(');
end;

procedure TForm1.MenuItem36Click(Sender: TObject);
begin
  InsertStringAtcaret('sum(');
end;

procedure TForm1.MenuItem37Click(Sender: TObject);
begin
  InsertStringAtcaret('pVariance(');
end;

procedure TForm1.MenuItem38Click(Sender: TObject);
begin
  InsertStringAtcaret('sVariance(');
end;

procedure TForm1.MenuItem39Click(Sender: TObject);
begin
  InsertStringAtcaret('avg(');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  InsertStringAtcaret('sinD(');
end;

procedure TForm1.MenuItem40Click(Sender: TObject);
begin
  InsertStringAtcaret('count(');
end;

procedure TForm1.MenuItem41Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem42Click(Sender: TObject);
begin
  Form2.Left:=trunc(form1.Left+form1.Width/2-Form2.Width/2);
  Form2.top:=trunc(form1.top+form1.height/2-Form2.height/2);
  Form2.ShowInTaskBar:=stNever;
  Form2.Show;
end;

procedure TForm1.MenuItem43Click(Sender: TObject);
begin
  form4.Left:=trunc(form1.Left+form1.Width/2-form4.Width/2);
  form4.top:=trunc(form1.top+form1.height/2-form4.height/2);
  form4.ShowInTaskBar:=stNever;
  Form4.Show;
end;

procedure TForm1.MenuItem44Click(Sender: TObject);
begin
  form3.Left:=trunc(form1.Left+form1.Width/2-form3.Width/2);
  form3.top:=trunc(form1.top+form1.height/2-form3.height/2);
  form3.ShowInTaskBar:=stNever;
  form3.show;
end;

procedure TForm1.MenuItem45Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem46Click(Sender: TObject);
begin
  InsertStringAtcaret('avogadro');
end;

procedure TForm1.MenuItem47Click(Sender: TObject);
begin
  InsertStringAtcaret('nepero');
end;

procedure TForm1.MenuItem48Click(Sender: TObject);
begin
  InsertStringAtcaret('pi');
end;

procedure TForm1.MenuItem49Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  InsertStringAtcaret('tanD(');
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
     InsertStringAtcaret('cosR(');
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
     InsertStringAtcaret('sinR(');
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  InsertStringAtcaret('tanR(');
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  InsertStringAtcaret('arcCosD(');
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  InsertStringAtcaret('arcSinD(');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  a,b:integer;
begin
    inibito:=false;
    a:=Memo1.CaretPos.X;
    b:=Memo1.CaretPos.Y;
    if (a=oldX)and(b=oldY)then exit;
    oldX:=a;
    oldY:=b;
    if memo1.Lines.Count>b then
    begin
      if length(memo1.Lines[b])>=1 then
      begin
        if (memo1.Lines[1]=#13) and (a=1) then a:=a-1;
      end;
    end;
    statusBar1.Panels[0].Text:='X='+inttostr(a)+'  Y='+inttostr(b+1);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  inc(backSpaceTimer);
  if backSpaceclicked=false then timer2.Enabled:=false;
  memo1.SetFocus;
  if backSpaceTimer=2 then exit;
  if (memo1.SelStart=0)and(memo1.SelLength=0) then exit;
  if memo1.SelLength=0 then
  begin
    memo1.SelStart:=memo1.SelStart-1;
    memo1.SelLength:=1;
  end;
  memo1.SelText:='';
  memo1.SetFocus;
  if backSpaceTimer>4 then timer2.Interval:=150;
  if backSpaceTimer>8 then timer2.Interval:=50;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
  timer3.Enabled:=false;
  started;
end;


procedure TForm1.Memo1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if Shift<>[ssCtrl] then exit;
  if (WheelDelta>0) and (memo1.Font.Size<60) then memo1.Font.Size:=memo1.Font.Size+1;
  if (WheelDelta<0) and (memo1.Font.Size>10) then memo1.Font.Size:=memo1.Font.Size-1;
  handled:=true;
end;

end.

