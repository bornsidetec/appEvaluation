object fRTTI: TfRTTI
  Left = 0
  Top = 0
  Caption = 'RTTI'
  ClientHeight = 303
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 514
    Height = 120
    Align = alTop
    DataSource = ds
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnPopular: TButton
    Left = 8
    Top = 126
    Width = 105
    Height = 25
    Caption = 'Popular RTTI'
    TabOrder = 1
    OnClick = btnPopularClick
  end
  object btnSomar: TButton
    Left = 8
    Top = 157
    Width = 105
    Height = 25
    Caption = 'Somar Overloading'
    TabOrder = 2
    OnClick = btnSomarClick
  end
  object ds: TDataSource
    DataSet = cds
    Left = 416
    Top = 8
  end
  object cds: TClientDataSet
    PersistDataPacket.Data = {
      330000009619E0BD0100000018000000010000000000030000003300044E6F6D
      6501004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 8
    object cdsNome: TStringField
      FieldName = 'Nome'
    end
  end
end
