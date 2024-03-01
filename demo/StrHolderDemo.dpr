program StrHolderDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainStrHolderDemo in 'uMainStrHolderDemo.pas' {FMainStrHolderDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMainStrHolderDemo, FMainStrHolderDemo);
  Application.Run;
end.
