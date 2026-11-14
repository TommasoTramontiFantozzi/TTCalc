unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, strUtils, richmemo;

type

  { TForm2 }

  TForm2 = class(TForm)
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
  private
    tt:string;
    richmemo1:TRichMemo;
  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
var
  resStream: TResourceStream;
  rtfData: String;
  n:TColor;
  aa:integer;
begin
  resStream:= TResourceStream.Create(HInstance, 'HELP', RT_RCDATA);
  richmemo1:=TRichMemo.Create(Form2);
  richmemo1.Parent:=Form2;
  richmemo1.Align:=alClient;
  richmemo1.ReadOnly:=true;
  richmemo1.ScrollBars:=ssAutoBoth;
  Try
   SetLength(rtfData, resStream.Size);
   resStream.Read(rtfData[1], resStream.Size);
  Finally
   resStream.Free;
  End;
  n:=richmemo1.GetRGBColorResolvingParent;
  rtfData:=stringReplace(rtfData,'\red255\green255\blue255;','\red'+inttostr(255-red(n))+'\green'+inttostr(255-green(n))+'\blue'+inttostr(255-blue(n))+';',[rfReplaceAll]);
  rtfData:=stringReplace(rtfData,'\red0\green0\blue0;','\red'+inttostr(255-red(n))+'\green'+inttostr(255-green(n))+'\blue'+inttostr(255-blue(n))+';',[rfReplaceAll]);
  richmemo1.Rtf:=rtfData;
  tt:='';
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  richmemo1.Free;
end;

function min(a,b:int64):int64;
begin
  if a<=b then result:=a else result:=b;
end;
function max(a,b:int64):int64;
begin
  if a>=b then result:=a else result:=b;
end;

procedure TForm2.TreeView1Click(Sender: TObject);
var
  testo:integer;
  testoLen:integer;
  FontParams:TFontParams;
  paraMetric:TparaMetric;
  nn:single;
  a:integer;
  b:integer;
  c,d:integer;
begin
  tt:=richmemo1.Text;
  if treeview1.Selected=nil then exit;
  richmemo1.SetFocus;
  if richmemo1.Search('-'+treeview1.Selected.Text,0,length(richmemo1.Text),[soMatchCase,soWholeWord],testo,testoLen) then
  begin
      richmemo1.SelStart := testo;
      richmemo1.SelLength := testoLen;
      richmemo1.GetTextAttributes(testo,FontParams);
      richmemo1.GetParaMetric(testo,paraMetric);
      b:=0;
      for a:=min(richmemo1.CharAtPos(0,richmemo1.Height),richmemo1.SelStart) to max(richmemo1.CharAtPos(0,richmemo1.Height),richmemo1.SelStart) do
      begin
        if tt[a]=chr(10) then inc(b);
      end;
      if b<3 then richmemo1.ScrollBy(0,-trunc(richmemo1.Height/2));
  end
  else
  begin
    if richmemo1.Search('-'+leftStr(treeview1.Selected.Text,pos('(',treeview1.Selected.Text)-1),0,length(richmemo1.Text),[soMatchCase,soWholeWord],testo,testoLen) then
    begin
        richmemo1.SelStart := testo;
        richmemo1.SelLength := testoLen;
        richmemo1.GetTextAttributes(testo,FontParams);
        richmemo1.GetParaMetric(testo,paraMetric);
        b:=0;
        for a:=min(richmemo1.CharAtPos(0,richmemo1.Height),richmemo1.SelStart) to max(richmemo1.CharAtPos(0,richmemo1.Height),richmemo1.SelStart) do
        begin
          if tt[a]=chr(10) then inc(b);
        end;
        if b<3 then richmemo1.ScrollBy(0,-trunc(richmemo1.Height/2));     end
  end;
end;

end.

