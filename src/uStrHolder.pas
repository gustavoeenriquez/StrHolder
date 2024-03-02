unit uStrHolder;

interface

uses
  SysUtils, Classes;

type
  TStrItem = Class(TCollectionItem)
  Private
    fNombre: String;
    FString: TStrings;
  Protected
    Procedure SetStrings(aValue: TStrings);
    function GetDisplayName: string; Override;
  Public
    constructor Create(Collection: TCollection); Override;
  Published
    Property Nombre: String read fNombre Write fNombre;
    Property Strings: TStrings Read FString Write SetStrings; // stored;
  End;

  TStrHolder = class(TComponent)
  private
    FItems: TCollection;
  protected
  public
    Constructor Create(aOwner: TComponent); Override;
    Function IndexOf(Nombre: String): Integer;
    Function GetString(Nombre: String): String;
    Function AddString(Nombre, Data: String): TStrItem;
    Function DelString(Nombre: String): Boolean;
  published
    Property Items: TCollection Read FItems Write FItems;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CimaMaker', [TStrHolder]);
end;

// *************************************************************
// *************************************************************

constructor TStrItem.Create(Collection: TCollection);
Begin
  Inherited Create(Collection);
  FString := TStringList.Create;
End;

Procedure TStrItem.SetStrings(aValue: TStrings);
Begin
  FString.Assign(aValue);
End;

function TStrItem.GetDisplayName: string;
Begin
  Result := fNombre;
End;



// *************************************************************
// *************************************************************

Constructor TStrHolder.Create(aOwner: TComponent);
Begin
  Inherited Create(aOwner);
  FItems := TCollection.Create(TStrItem);
End;

function TStrHolder.DelString(Nombre: String): Boolean;
Var
  I: Integer;
  Item: TStrItem;
Begin
  Nombre := Nombre.Trim;

  I := IndexOf(Nombre);
  If I >= 0 then
  Begin
    Items.Delete(I);
    Result := True;
  End;
end;

Function TStrHolder.IndexOf(Nombre: String): Integer;
Var
  I: Integer;
  Item: TStrItem;
Begin
  Result := -1;
  Nombre := Nombre.Trim;
  For I := 0 to FItems.Count - 1 do
  Begin
    Item := TStrItem(FItems.Items[I]);
    If (Item <> Nil) and (AnsiUpperCase(Nombre) = AnsiUpperCase(Item.Nombre)) then
    Begin
      Result := I;
      Break;
    End;
  End;
End;

Function TStrHolder.GetString(Nombre: String): String;
Var
  I: Integer;
  Item: TStrItem;
Begin
  Result := '';
  Nombre := Nombre.Trim;
  I := IndexOf(Nombre);
  If I >= 0 then
  Begin
    Item := TStrItem(FItems.Items[I]);
    Result := Item.Strings.Text;
  End;
End;

Function TStrHolder.AddString(Nombre, Data: String): TStrItem;
Var
  I: Integer;
  Item: TStrItem;
Begin
  Nombre := Nombre.Trim;

  I := IndexOf(Nombre);
  If I >= 0 then
  Begin
    Item := TStrItem(FItems.Items[I]);
    Item.FString.Text := Data;
  End
  Else
  Begin
    Item := TStrItem(FItems.Add);
    Item.Nombre := Nombre;
    Item.Strings.Text := Data;
  End;
  Result := Item;
End;

end.