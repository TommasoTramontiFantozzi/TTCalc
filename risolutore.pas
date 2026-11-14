unit risolutore;

{$mode ObjFPC}{$H+}

interface

uses
  math, SysUtils, strutils;

function risolvi(a:string):string;

implementation

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

function int_range(const x,min,max: integer): integer;
   {forces 'x' into the range of [min..max]}
begin
 if x < min then exit(min) else
    if x > max then exit(max) else exit(x);
end;

function digits_left(const d: extended): integer;
   {returns the number of digits of 'd' which are left to the decimal dot}
var s: string;
begin
  str(abs(d):0:38, s);
  exit(pos('.',s));
end;

function double_to_total_digits(const d: extended;const digits,decimals: integer): string;
   {formats a extended to a string.
    I: digits: max. total number of digits (left and right of the decimal dot)
       decimals: max. number of digits right of the decimal dot}
var
  s: string;
  a:integer;
begin
 str(d:0:int_range(digits-digits_left(d), 0,decimals), s);
 a:=pos(decimalSeparator,s);
 while (a>0)and((s[length(s)]='0')or(s[length(s)]=decimalSeparator)) do begin setLength(s,length(s)-1);a:=pos(decimalSeparator,s);end;
 if s='-0' then s:='0';
 exit(s);
end;

function IsNumber(const N : char) : Boolean;
var
I : Integer;
begin
  i:=ord(N);
  result:=(i<=57)and(i>=48);
end;

function IsLetter(const N : char) : Boolean;
var
I : Integer;
begin
  i:=ord(N);
  result:=((i<=90)and(i>=65))or((i<=122)and(i>=97));
end;

function retrieveCharacter(const a:string;pos:integer):char; inline;
begin
  result:=#0;
  if (pos>=1)and(pos<=length(a))and(length(a)>=1) then result:=a[pos];
end;

function isBinary(const a:string;aN:integer;var number:string;var Bound:integer;dir:boolean):boolean;
var
 binChars: array of string = ('0','1');
 bN:integer;
begin
  result:=true;
  bN:=aN;
  if dir=false then
  begin
    while (true) do
    begin
      if (retrieveCharacter(a,bN) in binChars) then
      begin
        dec(bN);
      end
      else
      begin
        if (retrieveCharacter(a,bN)='b')and(bN<aN) then
        begin
          Bound:=bN;
          number:=copy(a,Bound,aN-Bound+1);
          result:=true;
          exit;
        end
        else
        begin
          result:=false;
          exit;
        end;
      end;
    end;
  end;
  if dir=true then
  begin
    if (aN=bN)and(retrieveCharacter(a,aN)='b')and(retrieveCharacter(a,aN+1) in binChars) then
    begin
      inc(bN,2);
    end
    else
    begin
      result:=false;
      exit;
    end;
    while true do
    begin
      if (retrieveCharacter(a,bN) in binChars)then
      begin
        inc(bN);
      end
      else
      begin
        Bound:=bN-1;
        number:=copy(a,aN,Bound-aN+1);
        result:=true;
        exit;
      end;
    end;
  end;
end;

function isHex(const a:string;aN:integer;var number:string;var Bound:integer;dir:boolean):boolean;
var
 hexChars: array of string = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','a','b','c','d','e','f');
 bN:integer;
begin
  result:=true;
  bN:=aN;
  if dir=false then
  begin
    while (true) do
    begin
      if (retrieveCharacter(a,bN) in hexChars) then
      begin
        dec(bN);
      end
      else
      begin
        if (retrieveCharacter(a,bN)='x')and(retrieveCharacter(a,bN-1)='0')and(bN<aN) then
        begin
          dec(bN,1);
          Bound:=bN;
          number:=copy(a,Bound,aN-Bound+1);
          result:=true;
          exit;
        end
        else
        begin
          result:=false;
          exit;
        end;
      end;
    end;
  end;
  if dir=true then
  begin
    if (aN=bN)and(retrieveCharacter(a,aN)='0')and(retrieveCharacter(a,aN+1)='x')and(retrieveCharacter(a,aN+2) in hexChars) then
    begin
      inc(bN,2);
    end
    else
    begin
      result:=false;
      exit;
    end;
    while true do
    begin
      if (retrieveCharacter(a,bN) in hexChars)then
      begin
        inc(bN);
      end
      else
      begin
        Bound:=bN-1;
        number:=copy(a,aN,Bound-aN+1);
        result:=true;
        exit;
      end;
    end;
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

function isInf(const a:string;aN:integer;var number:string;var Bound:integer;dir:boolean):boolean;
var
 tt:integer=0;
begin
  result:=false;
  if dir=false then
  begin
    result:=(retrieveCharacter(a,aN)='f')and(retrieveCharacter(a,aN-1)='n')and(lowerCase(retrieveCharacter(a,aN-2))='i');
    if result and (isAlphanumeric(retrieveCharacter(a,aN-3))) then begin result:=false; exit;end;
    if result=false then result:=(retrieveCharacter(a,aN-1)='f')and(retrieveCharacter(a,aN-2)='n')and(lowerCase(retrieveCharacter(a,aN-3))='i');
    if (isAlphanumeric(retrieveCharacter(a,aN-4))) then begin result:=false; exit;end;
    Bound:=aN-2;
    if result then number:='Inf';
  end
  else
  begin
    if (retrieveCharacter(a,aN)='+')or(retrieveCharacter(a,aN)='-') then tt:=1;
    if (isAlphanumeric(retrieveCharacter(a,aN+3+tt))) then exit;
    result:=(retrieveCharacter(a,aN+2+tt)='f')and(retrieveCharacter(a,aN+1+tt)='n')and(lowerCase(retrieveCharacter(a,aN+tt))='i');
    Bound:=aN+2+tt;
    if result then
    begin
      number:='Inf';
      if tt=1 then number:=retrieveCharacter(a,aN)+number;
    end;
  end;
end;

function isNan(const a:string;aN:integer;var number:string;var Bound:integer;dir:boolean):boolean;
var
 tt:integer=0;
begin
  result:=false;
  if dir=false then
  begin
    result:=(retrieveCharacter(a,aN)='n')and(retrieveCharacter(a,aN-1)='a')and(lowerCase(retrieveCharacter(a,aN-2))='n');
    if result and (isAlphanumeric(retrieveCharacter(a,aN-3))) then begin result:=false; exit;end;
    if result=false then result:=(retrieveCharacter(a,aN-1)='n')and(retrieveCharacter(a,aN-2)='a')and(lowerCase(retrieveCharacter(a,aN-3))='n');
    if (isAlphanumeric(retrieveCharacter(a,aN-4))) then begin result:=false; exit;end;
    Bound:=aN-2;
    if result then number:='Nan';
  end
  else
  begin
    if (lowerCase(retrieveCharacter(a,aN))='+')or(lowerCase(retrieveCharacter(a,aN))='-') then tt:=1;
    if isAlphanumeric(retrieveCharacter(a,aN+3+tt)) then exit;
    result:=(retrieveCharacter(a,aN+2+tt)='n')and(retrieveCharacter(a,aN+1+tt)='a')and(lowerCase(retrieveCharacter(a,aN+tt))='n');
    Bound:=aN+2;
    if result then number:='Nan';
  end;
end;

function BinToDec(const AValue : AnsiString): int64;
var
  I: Integer;
begin
  Result := 0;
  for I := 1 to Length(AValue) do
    Result := Result * 2 + StrToInt(AValue[I]);
end;

procedure leftNumberWithoutSign(const a:string;const aN:integer;var number:string;var leftBound:integer);
var
  bN,cN,dN:integer;
  aaS:string;
  xx:extended;
begin
  number:='';

  if isHex(a,aN-1,number,leftBound,false) then
  begin
    number:=inttostr(hex2dec(copy(number,3,length(number))));
    exit;
  end;

  if isBinary(a,aN-1,number,leftBound,false) then
  begin
    number:=inttostr(BinToDec(copy(number,2,length(number))));
    exit;
  end;

  if aN>1 then
  begin
    bN:=aN-1;
    cN:=0;
    while bN>0 do
    begin
      if (a[bN]='.') then cN:=cN+1;
      if isNumber(a[bN])or((a[bN]='.')and(cN<=1))or(a[bN]='E') then
      begin
        bN:=bN-1;
      end
      else
      begin
        if cN>1 then exit;
        break;
      end;
    end;
    if bN<aN-1 then
    begin
      number:=copy(a,bN+1,aN-1-bN);
      leftBound:=bN+1;
    end;
  end;
  if number='' then exit;
  if not (trystrtofloat(number,xx)) then number:='';
end;

procedure leftNumberWithSign(const a:string;const aN:integer;var number:string;var leftBound:integer);
var
  bN,cN,dN:integer;
  aaS:string;
  xx:extended;
begin
  number:='';
  if isHex(a,aN-1,number,leftBound,false) then
  begin
    aaS:=retrieveCharacter(a,leftBound-1);
    if (aaS='+') or (aaS='-') then
    begin
      dec(leftBound);
    end;
    number:=inttostr(hex2dec(copy(number,3,length(number))));
    if (aaS='-') then number:='-'+number;
    exit;
  end;

  if isBinary(a,aN-1,number,leftBound,false) then
  begin
    aaS:=retrieveCharacter(a,leftBound-1);
    if (aaS='+') or (aaS='-') then
    begin
      dec(leftBound);
    end;
    number:=inttostr(BinToDec(copy(number,2,length(number))));
    if (aaS='-') then number:='-'+number;
    exit;
  end;
  if isInf(a,aN-1,number,leftBound,false) then
  begin
    aaS:=retrieveCharacter(a,leftBound-1);
    if (aaS='+') or (aaS='-') then
    begin
      dec(leftBound);
    end;
    if (aaS='-') then number:='-'+number;
    exit;
  end;
  if isNan(a,aN-1,number,leftBound,false) then
  begin
    aaS:=retrieveCharacter(a,leftBound-1);
    if (aaS='+') or (aaS='-') then
    begin
      dec(leftBound);
    end;
    if (aaS='-') then number:='-'+number;
    exit;
  end;
  if aN>1 then
  begin
    bN:=aN-1;
    cN:=0;
    while bN>0 do
    begin
      if (a[bN]='.') then cN:=cN+1;
      if isNumber(a[bN])or((a[bN]='.')and(cN<=1))or((a[bN]='-')and(bN<aN-1))or((a[bN]='+')and(bN<aN-1))or(a[bN]='E') then
      begin
        bN:=bN-1;
        if (a[bN+1]='-')or(a[bN+1]='+')then
        begin
          if bN=0 then break;
          if a[bN]<>'E' then break;
        end;
      end
      else
      begin
        if cN>1 then exit;
        break;
      end;
    end;
    if bN<aN-1 then
    begin
      number:=copy(a,bN+1,aN-1-bN);
      leftBound:=bN+1;
    end;
  end;
  if number='' then exit;
  if not (trystrtofloat(number,xx)) then number:='';
  if (retrieveCharacter(a,leftBound-1)='(')and(isAlphaNumeric((retrieveCharacter(a,leftBound-2)))) then number:='';
end;

procedure rightNumber(const a:string;const aN:integer;var number:string;var rightBound:integer);
var
  bN,cN,dN:integer;
  aaS:string;
  xx:extended;
begin
  number:='';
  if isHex(a,aN+1,number,rightBound,true) then
  begin
    inc(rightBound);
    number:=inttostr(hex2dec(copy(number,3,length(number))));
    exit;
  end;
  if isBinary(a,aN+1,number,rightBound,true) then
  begin
    inc(rightBound);
    number:=inttostr(binTodec(copy(number,2,length(number))));
    exit;
  end;
  if isInf(a,aN+1,number,rightBound,true) then
  begin
    inc(rightBound);
    exit;
  end;
  if isNan(a,aN+1,number,rightBound,true) then
  begin
    inc(rightBound);
    exit;
  end;
  if aN>1 then
  begin
    bN:=aN+1;
    cN:=0;
    while bN<=length(a) do
    begin
      if (a[bN]='.') then cN:=cN+1;
      if isNumber(a[bN])or((a[bN]='.')and(cN<=1))or((a[bN]='-')and(bN=aN+1))or((a[bN]='+')and(bN=aN+1))or(a[bN]='E')or((a[bN]='-')and(a[bN-1]='E')) then
      begin
        bN:=bN+1;
      end
      else
      begin
        if cN>1 then exit;
        break;
      end;
    end;
    if aN+1<bN then
    begin
      number:=copy(a,aN+1,bN-aN-1);
      rightBound:=bN;
    end;
  end;
  if number='' then exit;
  if not (trystrtofloat(number,xx)) then number:='';
end;


function posPartiDa(const daCercare:string;const input:string;partiDa:integer):integer;
var
   a:string;
   b:integer;
begin
   if partiDa=0 then inc(partiDa);
   a:=copy(input,partiDa,length(input)-partiDa+1);
   b:=pos(daCercare,a);
   if b=0 then result:=0;
   if b>0 then result:=b+partiDa-1;
end;

function estraiParametro(const s:string;delimitatoreCampi:char;numeroCampo:integer):string;
var
  a,b,c,d,e,f:string;
  aN,bN,cN,dN:integer;
  inStringa:boolean=false;
begin
  bN:=1;
  cN:=length(s);
  result:='';
  for aN:= 1 to cN do
  begin
    if (s[aN]=delimitatoreCampi)and(not inStringa) then
    begin
        inc(bN);
    end
    else
    begin
      if bN=numeroCampo then result:=result+s[aN];
    end;
    if bN>numeroCampo then break;
  end;
  if length(result)>1 then
  begin
    result:=stringReplace(result,'""','"',[rfReplaceAll]);
    cN:=length(result);
  end;
end;

function cosD(a:extended):extended;
begin
  result:=cos(a/(180/pi));
end;

function sinD(a:extended):extended;
begin
  result:=sin(a/(180/pi));
end;

function tanD(a:extended):extended;
begin
  a:=a mod 360;
  result:=sinD(a)/cosD(a);
end;

function fp32(aa,bb,cc,dd:byte):single;
var
  oo:array [0..3] of byte;
begin
    oo[3]:=aa;
    oo[2]:=bb;
    oo[1]:=cc;
    oo[0]:=dd;
    move(oo,result,4);
end;

function fp64(aa,bb,cc,dd,ee,ff,gg,hh:byte):double;
var
  oo:array [0..7] of byte;
begin
    oo[7]:=aa;
    oo[6]:=bb;
    oo[5]:=cc;
    oo[4]:=dd;
    oo[3]:=ee;
    oo[2]:=ff;
    oo[1]:=gg;
    oo[0]:=hh;
    move(oo,result,8);
end;

function min2(aa:array of extended):extended;
var
  aN:integer;
begin
  result:=nan;
  if length(aa)>0 then
  begin
   result:=aa[0];
   for aN := 0 to length(aa)-1 do
   begin
     result:=min(result,aa[aN]);
   end;
  end;
end;

function max2(aa:array of extended):extended;
var
  aN:integer;
begin
  result:=nan;
  if length(aa)>0 then
  begin
   result:=aa[0];
   for aN := 0 to length(aa)-1 do
   begin
     result:=max(result,aa[aN]);
   end;
  end;
end;

function sum2(aa:array of extended):extended;
var
  aN:integer;
begin
  result:=nan;
  if length(aa)>0 then
  begin
   result:=0;
   for aN := 0 to length(aa)-1 do
   begin
     result:=result+aa[aN];
   end;
  end;
end;

function Gamma( x : extended) : extended;   //From Rosetta Code  https://rosettacode.org/wiki/Gamma_function
const COF : array [0..14] of extended =
(  0.999999999999997092, // may as well include this in the array
  57.1562356658629235,
 -59.5979603554754912,
  14.1360979747417471,
 -0.491913816097620199,
  0.339946499848118887e-4,
  0.465236289270485756e-4,
 -0.983744753048795646e-4,
  0.158088703224912494e-3,
 -0.210264441724104883e-3,
  0.217439618115212643e-3,
 -0.164318106536763890e-3,
  0.844182239838527433e-4,
 -0.261908384015814087e-4,
  0.368991826595316234e-5);
const
  K = 2.5066282746310005;
  PI_OVER_K = PI / K;
var
  j : integer;
  tmp, w, ser : extended;
  reflect : boolean;
begin
  reflect := (x < 0.5);
  if reflect then w := 1.0 - x else w := x;
  tmp := w + 5.2421875;
  tmp := (w + 0.5)*Ln(tmp) - tmp;
  ser := COF[0];
  for j := 1 to 14 do ser := ser + COF[j]/(w + j);
  try
    if reflect then
      result := PI_OVER_K * w * Exp(-tmp) / (Sin(PI*x) * ser)
    else
      result := K * Exp(tmp) * ser / w;
  except
    raise SysUtils.Exception.CreateFmt(
        'Gamma(%g) is undefined or out of floating-point range', [x]);
  end;
end;


function prod(aa:array of extended):extended;
var
  aN:integer;
begin
  result:=1;
  if length(aa)>0 then
  begin
   for aN := 0 to length(aa)-1 do
   begin
     result:=result*aa[aN];
   end;
  end;
end;

function cmp(aa:extended;bb:extended):extended;
begin
 result:=0;
 if aa<bb then result:=-1;
 if aa>bb then result:=1;
end;

function RandomBetween(a, b: extended): extended;
begin
  Result := a + Random * (b - a);
end;

function trunc2(const Number: extended; const Places: longint): string;
var
  q:string;
  a:integer;
begin
   q:=floattostr(Number);
   result:=q;
   a:=pos(decimalSeparator,q);
   if (Places<0)or(Places>length(q)-a)then exit;
   if a>0 then
   begin
     result:=copy(q,1,a+Places);
     if places=0 then setLength(result,length(result)-1);
   end
   else result:=q;
end;

function risolvi(a:string):string;
var
  aN,bN,cN,dN,eN:integer;
  numParam:integer;
  param:array of extended;
  number1:string='';
  number2:string='';
  number1double:extended;
  number2double:extended;
  leftBound:integer=0;
  rightBound:integer=0;
  b,c,d,e,f:string;
  bb,cc:boolean;
  tmpDouble:extended;
  tmpString:string='';
  operators : array[0..4] of String = ('^','*','/','+','-');
  functions     : array of String = ('sinR','cosR','tanR','sinD','cosD','tanD','sqrt','int','abs','mod','pow','min','max','arcSinR','arcCosR','arcTanR','arcSinD','arcCosD','arcTanD','log','ln','logn','fp32','fp64','sum','prod','avg','pVariance','sVariance','pDevStd','sDevStd','count','cmp','random','round','ceil','floor','trunc','gamma');
  functionsParm : array of int8 = (1,1,1,1,1,1,1,1,1,2,2,-2,-2,1,1,1,1,1,1,1,1,2,4,8,-1,-1,-1,-2,-2,-2,-2,-1,2,2,1,1,1,2,1);
begin
  decimalSeparator:='.';
  a:=stringReplace(a,' ','',[rfReplaceAll]);
  bN:=0;
  cN:=0;
  for aN:=1 to length(a) do
  begin
    if a[aN]='(' then inc(bN);
    if a[aN]=')' then inc(cN);
    if (cN>bN) then
    begin
      result:='Error_pos>>'+inttostr(aN);
      exit;
    end;
  end;
  bN:=0;
  cN:=0;
  for aN:=0 to length(a)-1 do
  begin
    dN:=length(a)-aN;
    if a[dN]='(' then inc(bN);
    if a[dN]=')' then inc(cN);
    if (bN>cN) then
    begin
      result:='Error_pos>>'+inttostr(dN);
      exit;
    end;
  end;
  a:='('+a+')';
  a:=stringReplace(a,'++','+',[rfReplaceAll]);
  a:=stringReplace(a,'+-','-',[rfReplaceAll]);
  a:=stringReplace(a,'-+','-',[rfReplaceAll]);
  a:=stringReplace(a,'--','+',[rfReplaceAll]);
  f:='';
  while f<>a do
  begin
    f:=a;
    //Operazioni
    b:='';
    bN:=1;
    while (b<>a) do
    begin
      b:=a;
      aN:=posPartiDa('(',a,bN);
      bN:=posPartiDa(')',a,aN);
      cc:=true;
      while (aN>0) do
      begin
        cN:=posPartiDa('(',a,aN+1);
        if (bN-1>=aN+1)and((cN=0)or(cN>bN)) then
        begin
          c:=copy(a,aN+1,bN-aN-1);
          bb:=false;
          for dN:= 0 to length(operators)-1 do
          begin
            d:='';
            cN:=1;
            eN:=posPartiDa(operators[dN],c,1);
            if eN>1 then
            begin
              bb:=true;
              while (c[eN-1]='E') do
              begin
                inc(cN);
                eN:=posPartiDa(operators[dN],c,cN);
                if eN<=1 then break;
              end;
            end;
            while (eN>0)and(cN<length(c)) do
            begin
              if dN=0 then leftNumberWithoutSign(c,eN,number1,leftBound);
              if dN>0 then leftNumberWithSign(c,eN,number1,leftBound);
              rightNumber(c,eN,number2,rightBound);
              bb:=true;
              if (length(c)>rightBound)and(number2<>'') then
              begin
                if (c[rightBound]='^') then bb:=false; //Non esegue operazioni se subito dopo il secondo numero c'è un elevamento a potenza
                if ((c[rightBound]='*')or(c[rightBound]='/')) and (dN>=3) then bb:=false; //Non esegue somme o sottrazioni se subito dopo il secondo numero c'è una moltiplicazione/divisione
              end;
              if (leftBound>1)and(number1<>'') then
              begin
                if ((c[leftBound-1]='/')) and (dN=1) then bb:=false; //Non esegue moltiplicazioini se l'operazione precedente è una divisione (dunque con la stessa priorità)
                if ((c[leftBound-1]='/')or(c[leftBound-1]='*')) and (dN>2) then bb:=false; //Non esegue somme o sottrazioni se l'operazione precedente è una divisione o moltiplicazione
              end;
              d:=c;
              if (number1<>'')and(number2<>'')and(bb) then
              begin
                if trystrtofloat(number1,number1double) and trystrtofloat(number2,number2double) then
                begin
                  if dN=0 then tmpDouble:=power(number1double,number2double);
                  if dN=1 then tmpDouble:=(number1double*number2double);
                  if dN=2 then tmpDouble:=(number1double/number2double);
                  if dN=3 then tmpDouble:=(number1double+number2double);
                  if dN=4 then tmpDouble:=(number1double-number2double);
                  tmpString:=double_to_total_digits(tmpDouble,12,12);
                  if (tmpDouble>=0)then tmpString:='+'+tmpString;
                  c:=copy(c,1,leftBound-1)+tmpString+copy(c,rightBound,length(c));
                  c:=stringReplace(c,'++','+',[rfReplaceAll]);
                  c:=stringReplace(c,'+-','-',[rfReplaceAll]);
                  c:=stringReplace(c,'-+','-',[rfReplaceAll]);
                  c:=stringReplace(c,'--','+',[rfReplaceAll]);
                end;
              end;
              if d=c then inc(cN);
              eN:=posPartiDa(operators[dN],c,cN);
              if eN>1 then
              begin
                while (c[eN-1]='E') do
                begin
                  inc(cN);
                  eN:=posPartiDa(operators[dN],c,cN);
                  if eN<=1 then break;
                end;
              end;
            end;
          end;
          if bb = false then
          begin
            leftNumberWithSign(c,length(c)+1,number1,leftBound);
            if (leftBound=1)and(number1<>'') then c:=number1;
          end;
          if a[bN]='^' then a:=copy(a,1,aN)+'('+c+')'+copy(a,bN,length(a)) else a:=copy(a,1,aN)+c+copy(a,bN,length(a));
         //Funzioni
          if IsLetter(a[aN-1]) then cc:=false;
          bb:=true;
          numParam:=1;
          bN:=posPartiDa(')',a,aN);
          d:=copy(a,aN+1,bN-aN-1);
          e:=estraiParametro(d,',',numParam);
          while e<>'' do
          begin
            if (e[1]='+')or(e[1]='-') then dN:=1 else dN:=0;
            leftNumberWithSign(e,length(e)+1,number1,leftBound);
            if (number1='')or(leftBound<>1) then bb:=false;
            inc(numParam);
            e:=estraiParametro(d,',',numParam);
          end;
          dec(numParam);
          if bb=true then
          begin
            d:=copy(a,aN+1,bN-aN-1);
            for cN := 0 to length(functions)-1 do
            begin
              if aN>length(functions[cN])-1 then
              begin
                bb:=true;
                for dN:=1 to length(functions[cN]) do   //Cerca la funzione a ritroso, partendo dalla parentesi aperta
                begin
                  if a[aN-dN]<>functions[cN,length(functions[cN])-dN+1] then bb:=false;
                end;
                if bb then
                begin
                  if aN-length(functions[cN])-1>0 then
                  begin
                    if IsLetter(a[aN-length(functions[cN])-1]) then bb:=false; //Così non confonde sin con arcsin
                  end;
                end;
                if bb then
                begin
                  setLength(param,numParam);
                  for dN := 0 to numParam-1 do
                  begin
                    try
                      tmpString:=estraiParametro(d,',',dN+1);
                      leftNumberWithSign(tmpString,length(tmpString)+1,number1,leftBound);
                      param[dN]:=strtofloat(number1);
                    except
                    end;
                  end;
                  cc:=false;
                  aN:=aN-length(functions[cN]);
                  if (numParam=functionsParm[cN])or((numParam>=functionsParm[cN]*(-1))and(functionsParm[cN]<0)) then
                  begin
                    if numParam=1 then
                    begin
                      try
                        if cN=0 then tmpDouble:=(sin(param[0]));
                        if cN=1 then tmpDouble:=(cos(param[0]));
                        if cN=2 then tmpDouble:=(tan(param[0]));
                        if cN=3 then tmpDouble:=(sin(DegToRad(param[0])));
                        if cN=4 then tmpDouble:=(cos(DegToRad(param[0])));
                        if cN=5 then tmpDouble:=(tan(DegToRad(param[0])));
                        if cN=6 then tmpDouble:=(Power(param[0],0.5));
                        if cN=7 then tmpDouble:=(int(param[0]));
                        if cN=8 then tmpDouble:=(abs(param[0]));
                        if cN=13 then tmpDouble:=(arcSin(param[0]));
                        if cN=14 then tmpDouble:=(arcCos(param[0]));
                        if cN=15 then tmpDouble:=(arcTan(param[0]));
                        if cN=16 then tmpDouble:=(radToDeg(arcSin(param[0])));
                        if cN=17 then tmpDouble:=(radToDeg(arcCos(param[0])));
                        if cN=18 then tmpDouble:=(radToDeg(arcTan(param[0])));
                        if cN=19 then tmpDouble:=(log10(param[0]));
                        if cN=20 then tmpDouble:=(ln(param[0]));
                        if cN=34 then tmpDouble:=(round(param[0]));
                        if cN=35 then tmpDouble:=(ceil(param[0]));
                        if cN=36 then tmpDouble:=(floor(param[0]));
                        if cN=38 then tmpDouble:=(Gamma(param[0]));
                        d:=double_to_total_digits(tmpDouble,12,12);
                        cc:=true;
                      except
                      end;
                    end;
                    if numParam=2 then
                    begin
                      try
                        d:='';
                        if cN=9 then tmpDouble:=(param[0] mod param[1]);
                        if cN=10 then tmpDouble:=(power(param[0], param[1]));
                        if cN=21 then tmpDouble:=(logn(param[0],param[1]));
                        if cN=32 then tmpDouble:=(cmp(param[0],param[1]));
                        if cN=33 then tmpDouble:=(RandomBetween(param[0],param[1]));
                        if cN=37 then d:=(trunc2(param[0],trunc(param[1])));
                        if d='' then d:=double_to_total_digits(tmpDouble,12,12);
                        cc:=true;
                      except
                      end;
                    end;
                    if (numParam>=functionsParm[cN]*(-1))and(functionsParm[cN]<0) then
                    begin
                      if cN=11 then tmpDouble:=(min2(param));
                      if cN=12 then tmpDouble:=(max2(param));
                      if cN=24 then tmpDouble:=(sum2(param));
                      if cN=25 then tmpDouble:=(prod(param));
                      if cN=26 then tmpDouble:=(sum(param)/length(param));
                      if cN=27 then tmpDouble:=(PopnVariance(param));
                      if cN=28 then tmpDouble:=(variance(param));
                      if cN=29 then tmpDouble:=(PopnStdDev(param));
                      if cN=30 then tmpDouble:=(StdDev(param));
                      if cN=31 then tmpDouble:=(length(param));
                      d:=double_to_total_digits(tmpDouble,12,12);
                      cc:=true;
                    end;
                    if numParam=4 then
                    begin
                      try
                        if cN=22 then d:=floattostr(fp32(round(param[0]),round(param[1]),round(param[2]),round(param[3])));
                        cc:=true;
                      except
                      end;
                    end;
                    if numParam=8 then
                    begin
                      try
                        if cN=23 then d:=floattostr(fp64(round(param[0]),round(param[1]),round(param[2]),round(param[3]),round(param[4]),round(param[5]),round(param[6]),round(param[7])));
                        cc:=true;
                      except
                      end;
                    end;
                  end
                  else
                  begin
                     d:='err';
                     cc:=true;
                  end;
                  break;
                end;
              end;
            end;
            if cc then
            begin
              if (a[bN+1]='^')or(pos(',',d)>0) then a:=copy(a,1,aN-1)+'('+d+')'+copy(a,bN+1,length(a)) else a:=copy(a,1,aN-1)+d+copy(a,bN+1,length(a));   //Toglie le parentesi se risolve una funzione nota o all'interno c'è un numero
            end
            else
            begin
              a:=copy(a,1,aN)+d+copy(a,bN,length(a));  //Funzione non nota, lascia le parentesi
            end;
            a:=stringReplace(a,'++','+',[rfReplaceAll]);
            a:=stringReplace(a,'+-','-',[rfReplaceAll]);
            a:=stringReplace(a,'-+','-',[rfReplaceAll]);
            a:=stringReplace(a,'--','+',[rfReplaceAll]);
          end;
        end;
        a:=stringReplace(a,'(+','(',[rfReplaceAll]);  //Elevamento a potenza di valori tra parentesi
        for cN:=4 to length(a) do
        begin
          if a[cN]='^' then
          begin
            if a[cN-1]=')' then
            begin
              leftNumberWithSign(a,cN-1,number1,leftBound);
              if (number1<>'')and(leftBound>1) then
              begin
                if a[leftBound-1]='(' then
                begin
                  rightNumber(a,cN,number2,rightBound);
                  bb:=true;
                  if (number2<>'')and(length(a)>rightBound) then if (a[rightBound]='^') then bb:=false;
                  if bb and (number2<>'') then
                  begin
                    if trystrtofloat(number1,number1double) and trystrtofloat(number2,number2double) then
                    begin
                      tmpDouble:=power(number1double,number2double);
                      tmpString:=double_to_total_digits(tmpDouble,12,12);
                      a:=copy(a,1,leftBound-2)+tmpString+copy(a,rightBound,length(a));
                    end;
                  end;
                end;
              end;
            end
            else
            begin
              leftNumberWithoutSign(a,cN,number1,leftBound);
              rightNumber(a,cN,number2,rightBound);
              bb:=true;
              if (number2<>'')and(length(a)>rightBound) then if (a[rightBound]='^') then bb:=false;
              if bb and (number2<>'') then
              begin
                if trystrtofloat(number1,number1double) and trystrtofloat(number2,number2double) then
                begin
                  tmpDouble:=power(number1double,number2double);
                  tmpString:=double_to_total_digits(tmpDouble,12,12);
                  a:=copy(a,1,leftBound-1)+tmpString+copy(a,rightBound,length(a));
                end;
              end;
            end;
          end;
        end;
        aN:=posPartiDa('(',a,aN+1);
        bN:=posPartiDa(')',a,aN);
      end;
    end;
  end;
  if a<>'' then
  begin
    if (a[1]='(') and (a[length(a)]=')') then a:=copy(a,2,length(a)-2);
    if a<>'' then
    begin
      if (a[1]='+') then a:=copy(a,2,length(a)-1);
      a:=stringReplace(a,',+',',',[rfReplaceAll]);
    end;
  end;
  result:=a;
end;

end.

