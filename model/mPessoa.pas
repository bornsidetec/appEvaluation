unit mPessoa;

interface

type
  TPessoa = class
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    property Nome: string read FNome write SetNome;
  end;

implementation

{ TPessoa }

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
