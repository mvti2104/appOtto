unit AddMoves;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmAddMoves = class(TForm)
    rectToolBar: TRectangle;
    lblTitulo: TLabel;
    imgBack: TImage;
    lytBotoes: TLayout;
    m02: TRectangle;
    Image5: TImage;
    Label1: TLabel;
    m03: TRectangle;
    Image13: TImage;
    Label9: TLabel;
    m04: TRectangle;
    Image14: TImage;
    Label10: TLabel;
    m05: TRectangle;
    Image15: TImage;
    Label11: TLabel;
    m06: TRectangle;
    Image16: TImage;
    Label12: TLabel;
    m07: TRectangle;
    Image17: TImage;
    Label13: TLabel;
    m08: TRectangle;
    Image18: TImage;
    Label14: TLabel;
    m09: TRectangle;
    Image19: TImage;
    Label15: TLabel;
    m10: TRectangle;
    Image20: TImage;
    Label16: TLabel;
    m11: TRectangle;
    Image6: TImage;
    Label2: TLabel;
    m12: TRectangle;
    Image7: TImage;
    Label3: TLabel;
    m13: TRectangle;
    Image8: TImage;
    Label4: TLabel;
    m14: TRectangle;
    Image9: TImage;
    Label5: TLabel;
    m15: TRectangle;
    Image10: TImage;
    Label6: TLabel;
    m16: TRectangle;
    Image11: TImage;
    Label7: TLabel;
    m01: TRectangle;
    Image12: TImage;
    Label8: TLabel;
    g05: TRectangle;
    Image29: TImage;
    Label25: TLabel;
    g09: TRectangle;
    Image33: TImage;
    Label29: TLabel;
    g10: TRectangle;
    Image34: TImage;
    Label30: TLabel;
    g07: TRectangle;
    Image31: TImage;
    Label27: TLabel;
    g01: TRectangle;
    Image25: TImage;
    Label21: TLabel;
    g08: TRectangle;
    Image32: TImage;
    Label28: TLabel;
    g12: TRectangle;
    Image36: TImage;
    Label32: TLabel;
    g03: TRectangle;
    Image27: TImage;
    Label23: TLabel;
    g06: TRectangle;
    Image30: TImage;
    Label26: TLabel;
    g02: TRectangle;
    Image26: TImage;
    Label22: TLabel;
    g04: TRectangle;
    Image28: TImage;
    Label24: TLabel;
    g11: TRectangle;
    Image35: TImage;
    Label31: TLabel;
    procedure imgBackClick(Sender: TObject);
    procedure BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormShow(Sender: TObject);
    procedure addMovieClick(Sender: TObject);
  private
    botao, imagem : TObject;
    procedure addMovies(imagem: TBitmap; movimento: string; Sender: TObject);
  public

  end;

var
  frmAddMoves: TfrmAddMoves;

implementation

{$R *.fmx}

uses Principal;

procedure TfrmAddMoves.addMovies(imagem: TBitmap; movimento: string; Sender : TObject);
begin
  TImage(imagem).Bitmap;
end;

procedure TfrmAddMoves.FormShow(Sender: TObject);
begin
  Caption := TFmxObject(frmPrincipal.Componente).Name;

  Caption := Caption +  ' - ' + TFmxObject(frmPrincipal.Componente).Children[0].Name;
end;

procedure TfrmAddMoves.imgBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAddMoves.addMovieClick(Sender: TObject);
var
  i : integer;
begin
  for i:= 0 to TRectangle(frmPrincipal.Componente).ControlsCount -1 do
    if TRectangle(frmPrincipal.Componente).Controls[i] is TImage then
      begin
        TImage(TRectangle(frmPrincipal.Componente).Controls[i]).Bitmap := TImage(TFmxObject(Sender).Children[0]).Bitmap;
        frmPrincipal.tipoMovimento[i] := TFmxObject(Sender).Name;
      end;
  Close;
end;

procedure TfrmAddMoves.BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  frmPrincipal.AnimateOpacity(TRectangle(Sender));
end;

end.
