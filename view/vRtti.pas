unit vRtti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, System.Generics.Collections, mPessoa, System.Rtti, Vcl.StdCtrls;

type
  TfRTTI = class(TForm)
    DBGrid: TDBGrid;
    ds: TDataSource;
    cds: TClientDataSet;
    cdsNome: TStringField;
    btnPopular: TButton;
    btnSomar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPopularClick(Sender: TObject);
    procedure btnSomarClick(Sender: TObject);
  private
    { Private declarations }
    FListaPessoas: TObjectList<TPessoa>;
    function AddPessoa(Dados: array of variant): TPessoa;
    procedure MockPessoa;
    procedure PopularDataSet;

    function Somar(a, b: Integer): string; overload;
    function Somar(a, b, c: Double): string; overload;
  public
    { Public declarations }
  end;

var
  fRTTI: TfRTTI;

implementation

{$R *.dfm}

function TfRTTI.AddPessoa(Dados: array of variant): TPessoa;
begin
  Result := TPessoa.Create;
  Result.Nome := Dados[0];
end;

procedure TfRTTI.btnPopularClick(Sender: TObject);
begin
  PopularDataSet;
end;

procedure TfRTTI.btnSomarClick(Sender: TObject);
begin
  ShowMessage(Somar(2.5, 3.1, 5));
end;

procedure TfRTTI.FormCreate(Sender: TObject);
begin
  MockPessoa;
end;

procedure TfRTTI.MockPessoa;
begin
  FListaPessoas := TObjectList<TPessoa>.Create;
  FListaPessoas.Add(AddPessoa(['Bruno Souza']));
  FListaPessoas.Add(AddPessoa(['Fernanda Moreira']));
end;

procedure TfRTTI.PopularDataSet;
var
  objPessoa: TPessoa;
  rttiContexto: TRttiContext;
  rttiTipo: TRttiType;
  rttiPropriedade: TRttiProperty;
begin
  rttiContexto := TRttiContext.Create;
  try
    rttiTipo := rttiContexto.GetType(TPessoa.ClassInfo);
    rttiPropriedade := rttiTipo.GetProperty('Nome');

    for objPessoa in FListaPessoas do
      cds.AppendRecord([rttiPropriedade.GetValue(objPessoa).AsString]);

    cds.First;
  finally
    rttiContexto.Free;
  end;
end;



function TfRTTI.Somar(a, b, c: Double): string;
begin
  Result := FloatToStr(a + b + c);
end;

function TfRTTI.Somar(a, b: Integer): string;
begin
  Result := IntToStr(a + b);
end;

end.
