
# Componente TStrHolder

Componente TStrHolder

Muchas veces es necesario embeber textos extensos en un formulario o un datamodulo, estos textos son muy grandes para almacenarlos en una constante.

En este caso es posible utilizar el componente TStrHolder, donde en tiempo de diseño se puede adicionar los textos con una llave que permite recuperarla.






## Usage/Examples

Usualmente en tiempo de diseño se adiciona el componente TStrHolder en el formulario o datamodulo, se utiliza la propiedad Items (que es una colección de objetos) para adicionar la llave y el texto asociado, lo que permite posteriormente recuperarlo.

Para recuperar un texto que se insertó  con la llave 'programador' puedes llamar la función GetString.

```pascal

procedure TFMainStrHolderDemo.Button1Click(Sender: TObject);
begin
  Memo1.Text := StrHolder1.GetString('programador');
  ListBox1.ItemIndex := ListBox1.Items.IndexOf('programador');
end;
```

En tiempo de ejecución también es posible modificar o eliminar textos, sin embargo solo es válido en tiempo de ejecución,  así que cuando se reinicie el formulario o datamodulo comenzará con la configuración que se creó en tiempo de diseño.

Para adicionar en tiempo de ejecución un par Llave/Texto se utiliza la función AddString

```pascal
procedure TFMainStrHolderDemo.Button5Click(Sender: TObject);
begin
  StrHolder1.AddString(EditIndice.Text, EditTexto.Text);
  UpdateLista;
end;
```

Para modificar en tiempo de ejecución un par Llave/Texto se utiliza la función AddString

```pascal
procedure TFMainStrHolderDemo.Button5Click(Sender: TObject);
begin
  StrHolder1.AddString(EditIndice.Text, EditTexto.Text);
  UpdateLista;
end;
```

Para eliminar en tiempo de ejecución un par Llave/Texto se utiliza la función DelString

```pascal
procedure TFMainStrHolderDemo.Button6Click(Sender: TObject);
begin
  StrHolder1.DelString(EditIndice.Text);
  UpdateLista;
end;
```




