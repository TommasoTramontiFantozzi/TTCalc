unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Grids,
  ComCtrls, StdCtrls, math;

type

  { TForm3 }

  TForm3 = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    ListView1: TListView;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.FormCreate(Sender: TObject);
begin
  listView1.Items.Add.Caption:=('Basic Expression Example1');
  listView1.Items.Add.Caption:=('Basic Expression Example2');
  listView1.Items.Add.Caption:=('sigmaSum Example1');
  listView1.Items.Add.Caption:=('sigmaSum Example2');
  listView1.Items.Add.Caption:=('sigmaSum Example3');
  listView1.Items.Add.Caption:=('piProd Example1');
  listView1.Items.Add.Caption:=('Standard Deviaton Example1');
  listView1.Items.Add.Caption:=('Variables and Lists Example1');
  listView1.Items.Add.Caption:=('Create and Manage Lists Example1');
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  ListView1.Selected := ListView1.Items[0];
end;

procedure TForm3.ListView1Click(Sender: TObject);
begin

end;

procedure TForm3.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if imageList1.Count>listview1.Selected.Index then image1.ImageIndex:=listview1.Selected.Index;
  if listview1.Selected.Caption='sigmaSum Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('sigmaSum({i}*2+3,{i},1,10)    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:{i}*2+3    -->Press Enter');
    memo1.Lines.Add('sigmaSum(a,{i},1,10)    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:{i}*2    -->Press Enter');
    memo1.Lines.Add('b:3    -->Press Enter');
    memo1.Lines.Add('sigmaSum(a+b,{i},1,10)    -->Press Enter');
  end;
  if listview1.Selected.Caption='sigmaSum Example2' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('sigmaSum({i}*2+3-{j},({i},{j}),(1,-1),(10,2))    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:{i}*2+3-{j}    -->Press Enter');
    memo1.Lines.Add('sigmaSum(a,({i},{j}),(1,-1),(10,2))    -->Press Enter');
  end;
  if listview1.Selected.Caption='sigmaSum Example3' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('x:4,10,2,-4,3,7,8,3,1,1    -->Press Enter');
    memo1.Lines.Add('sigmaSum(x[{i}]+x[{j}],({i},{j}),(1,1),(10,2))    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('x:4,10,2,-4,3,7,8,3,1,1    -->Press Enter');
    memo1.Lines.Add('a:x[{i}]+x[{j}]    -->Press Enter');
    memo1.Lines.Add('b:2    -->Press Enter');
    memo1.Lines.Add('sigmaSum(x[{i}]+x[{j}],({i},{j}),(1,1),(10,b))    -->Press Enter');
  end;
  if listview1.Selected.Caption='piProd Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('x:1,2.5,7.3,6,2,-6.7    -->Press Enter');
    memo1.Lines.Add('piProd(x[{j}],{j},1,4)    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:-6.7    -->Press Enter');
    memo1.Lines.Add('b:2+2    -->Press Enter');
    memo1.Lines.Add('x:1,2.5,7.3,6,2,a    -->Press Enter');
    memo1.Lines.Add('piProd(x[{j}],{j},1,b)    -->Press Enter');
  end;
  if listview1.Selected.Caption='Standard Deviaton Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('sDevStd(4,10,2,-4,3,7,8,3,1,1)    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('x:4,10,2,-4,3,7,8,3,1,1    -->Press Enter');
    memo1.Lines.Add('sDevStd(x)    -->Press Enter');
  end;
  if listview1.Selected.Caption='Variables and Lists Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('a:4    -->Press Enter');
    memo1.Lines.Add('b:3,4,7,6,5,2    -->Press Enter');
    memo1.Lines.Add('b[3]*a    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:4    -->Press Enter');
    memo1.Lines.Add('c:3    -->Press Enter');
    memo1.Lines.Add('b:3,4,7,6,5,2    -->Press Enter');
    memo1.Lines.Add('b[c]*a    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:4    -->Press Enter');
    memo1.Lines.Add('c:4    -->Press Enter');
    memo1.Lines.Add('b:3,4,7,6,5,2    -->Press Enter');
    memo1.Lines.Add('b[c-1]*a    -->Press Enter');
  end;
  if listview1.Selected.Caption='Create and Manage Lists Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('x:createList({a}*2,{a},1,100)    -->Press Enter');
    memo1.Lines.Add('sum(x)    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('sigmaSum({a}*2,{a},1,100)    -->Press Enter');
  end;
  if listview1.Selected.Caption='Basic Expression Example1' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('3*(6-3*(8-3))+1+3    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('a:8-3    -->Press Enter');
    memo1.Lines.Add('b:6-3*a    -->Press Enter');
    memo1.Lines.Add('3*b+1+3    -->Press Enter');
  end;
  if listview1.Selected.Caption='Basic Expression Example2' then
  begin
    memo1.Clear;
    memo1.Lines.Add('');
    memo1.Lines.Add('sqrt(8^2+15^2)-8    -->Press Enter');
    memo1.Lines.Add('');
    memo1.Lines.Add('OR');
    memo1.Lines.Add('');
    memo1.Lines.Add('sqrt(pow(8,2)+pow(15,2))-8    -->Press Enter');
  end;
  memo1.SelStart:=0;
end;

end.

