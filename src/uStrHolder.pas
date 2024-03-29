//  IT License
//
//  Copyright (c) <year> <copyright holders>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  o use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  HE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//Nombre: Gustavo Enr�quez
//  Redes Sociales:
//- Email: gustavoeenriquez@gmail.com
//  - Telegram: +57 3128441700
//  - LinkedIn: https://www.linkedin.com/in/gustavo-enriquez-3937654a/
//  - Youtube: https://www.youtube.com/@cimamaker3945
//  - GitHub: https://github.com/gustavoeenriquez/
//
// puedes ver el video del funcionamiento de este demo en https://www.youtube.com/@cimamaker3945

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