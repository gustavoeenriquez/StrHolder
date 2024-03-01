unit uMainStrHolderDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, uStrHolder, FMX.Memo.Types, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.ListBox, FMX.Edit;

type
  TFMainStrHolderDemo = class(TForm)
    StrHolder1: TStrHolder;
    Layout1: TLayout;
    Layout2: TLayout;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    Layout3: TLayout;
    EditIndice: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditTexto: TMemo;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    procedure OnListBoxItem1Click(Sender: TObject);
  public
    Procedure UpdateLista;
  end;

var
  FMainStrHolderDemo: TFMainStrHolderDemo;

implementation

{$R *.fmx}

procedure TFMainStrHolderDemo.Button1Click(Sender: TObject);
begin
  Memo1.Text := StrHolder1.GetString('programador');
  ListBox1.ItemIndex := ListBox1.Items.IndexOf('programador');
end;

procedure TFMainStrHolderDemo.Button2Click(Sender: TObject);
begin
  Memo1.Text := StrHolder1.GetString('html');
  ListBox1.ItemIndex := ListBox1.Items.IndexOf('html');
end;

procedure TFMainStrHolderDemo.Button3Click(Sender: TObject);
begin
  Memo1.Text := StrHolder1.GetString('pdf');
  ListBox1.ItemIndex := ListBox1.Items.IndexOf('pdf');
end;

procedure TFMainStrHolderDemo.Button5Click(Sender: TObject);
begin
  StrHolder1.AddString(EditIndice.Text, EditTexto.Text);
  UpdateLista;
end;

procedure TFMainStrHolderDemo.Button6Click(Sender: TObject);
begin
  StrHolder1.DelString(EditIndice.Text);
  UpdateLista;
end;

procedure TFMainStrHolderDemo.FormCreate(Sender: TObject);
begin
  UpdateLista;
end;

procedure TFMainStrHolderDemo.OnListBoxItem1Click(Sender: TObject);
Var
  LBItem: TListBoxItem;
begin
  If Assigned(Sender) and (Sender is TListBoxItem) then
  Begin
    LBItem := TListBoxItem(Sender);
    Memo1.Text := StrHolder1.GetString(LBItem.Text);
  End;
end;

procedure TFMainStrHolderDemo.UpdateLista;
Var
  I: Integer;
  StrItem: TStrItem;
  ListBoxItem: TListBoxItem;
begin
  ListBox1.Items.Clear;

  For I := 0 to StrHolder1.Items.Count - 1 do
  Begin
    StrItem := TStrItem(StrHolder1.Items.Items[I]);
    ListBoxItem := TListBoxItem.Create(Self);
    ListBoxItem.Text := StrItem.Nombre;
    ListBoxItem.OnClick := OnListBoxItem1Click;
    ListBox1.AddObject(ListBoxItem);
  End;
end;

end.
