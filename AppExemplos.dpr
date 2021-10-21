program AppExemplos;

uses
  Vcl.Forms,
  vRtti in 'view\vRtti.pas' {fRTTI},
  mPessoa in 'model\mPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfRTTI, fRTTI);
  Application.Run;
end.
