unit Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, System.ImageList, FMX.ImgList, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl, FMX.Layouts, FMX.Ani,
  System.Actions;

type
  TfrmPrincipal = class(TForm)
    rectRodape: TRectangle;
    rectToolBar: TRectangle;
    lblTitulo: TLabel;
    imgBluetooth: TImage;
    imgConfig: TImage;
    imgMoves: TImage;
    imgGestures: TImage;
    lytMoves: TLayout;
    lblMoves: TLabel;
    lytGestures: TLayout;
    lblGestures: TLabel;
    lytSounds: TLayout;
    lblSounds: TLabel;
    imgSounds: TImage;
    lytSequence: TLayout;
    lblSequence: TLabel;
    imgSequence: TImage;
    Layout2: TLayout;
    imgCornerControl: TImage;
    lytTopo: TLayout;
    lyTabControl: TLayout;
    lytCorpo: TLayout;
    TabControl: TTabControl;
    tabMoves: TTabItem;
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
    tabGestures: TTabItem;
    Layout5: TLayout;
    g01: TRectangle;
    Image25: TImage;
    Label21: TLabel;
    g02: TRectangle;
    Image26: TImage;
    Label22: TLabel;
    g03: TRectangle;
    Image27: TImage;
    Label23: TLabel;
    g04: TRectangle;
    Image28: TImage;
    Label24: TLabel;
    g05: TRectangle;
    Image29: TImage;
    Label25: TLabel;
    g06: TRectangle;
    Image30: TImage;
    Label26: TLabel;
    g07: TRectangle;
    Image31: TImage;
    Label27: TLabel;
    g08: TRectangle;
    Image32: TImage;
    Label28: TLabel;
    g09: TRectangle;
    Image33: TImage;
    Label29: TLabel;
    g10: TRectangle;
    Image34: TImage;
    Label30: TLabel;
    g11: TRectangle;
    Image35: TImage;
    Label31: TLabel;
    g12: TRectangle;
    Image36: TImage;
    Label32: TLabel;
    tabSounds: TTabItem;
    tabSequence: TTabItem;
    Layout7: TLayout;
    q01: TRectangle;
    imgq01: TImage;
    Label45: TLabel;
    q02: TRectangle;
    imgq02: TImage;
    Label46: TLabel;
    q03: TRectangle;
    imgq03: TImage;
    Label47: TLabel;
    q04: TRectangle;
    imgq04: TImage;
    Label48: TLabel;
    q05: TRectangle;
    imgq05: TImage;
    Label49: TLabel;
    q06: TRectangle;
    imgq06: TImage;
    Label50: TLabel;
    q07: TRectangle;
    imgq07: TImage;
    Label51: TLabel;
    q08: TRectangle;
    imgq08: TImage;
    Label52: TLabel;
    q09: TRectangle;
    imgq09: TImage;
    Label53: TLabel;
    q10: TRectangle;
    imgq10: TImage;
    Label54: TLabel;
    q11: TRectangle;
    imgq11: TImage;
    Label55: TLabel;
    q12: TRectangle;
    imgq12: TImage;
    Label56: TLabel;
    Layout4: TLayout;
    s01: TRectangle;
    Image1: TImage;
    Label17: TLabel;
    s02: TRectangle;
    Image2: TImage;
    Label18: TLabel;
    s03: TRectangle;
    Image3: TImage;
    Label19: TLabel;
    s04: TRectangle;
    Image4: TImage;
    Label20: TLabel;
    s05: TRectangle;
    Image21: TImage;
    Label33: TLabel;
    s06: TRectangle;
    Image22: TImage;
    Label34: TLabel;
    s07: TRectangle;
    Image23: TImage;
    Label35: TLabel;
    s08: TRectangle;
    Image24: TImage;
    Label36: TLabel;
    s09: TRectangle;
    Image37: TImage;
    Label37: TLabel;
    s10: TRectangle;
    Image38: TImage;
    Label38: TLabel;
    s11: TRectangle;
    Image39: TImage;
    Label39: TLabel;
    s12: TRectangle;
    Image40: TImage;
    Label40: TLabel;
    s13: TRectangle;
    Image41: TImage;
    Label41: TLabel;
    s14: TRectangle;
    Image42: TImage;
    Label42: TLabel;
    s15: TRectangle;
    Image43: TImage;
    Label43: TLabel;
    s16: TRectangle;
    Image44: TImage;
    Label44: TLabel;
    Layout6: TLayout;
    Layout8: TLayout;
    Image45: TImage;
    Image46: TImage;
    imgSpeed: TImage;
    imgAbout: TImage;
    a03: TImage;
    Layout9: TLayout;
    a04: TImage;
    Layout10: TLayout;
    a01: TImage;
    a02: TImage;
    imlSpeed: TImageList;
    lblStatusBluetooth: TLabel;
    q13: TRectangle;
    q14: TRectangle;
    Image47: TImage;
    Image61: TImage;
    procedure MudarAba(lyt: TLayout);
    procedure lytRodapeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgSpeedClick(Sender: TObject);
    procedure BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure BotaoPressionadoClick(Sender: TObject);
    procedure imgAboutClick(Sender: TObject);
    procedure imgConfigClick(Sender: TObject);
    procedure selectMovie(Sender: TObject);
  private

  public
    TempoMovimento : string;
    Componente : TObject;
    tipoMovimento : array [0..12] of string;
    procedure AnimateOpacity(Component: TComponent);
    procedure AnimateStatusBluetooth(Component: TComponent);
    procedure EnviarDados(Acao: string);
  end;

var
  frmPrincipal: TfrmPrincipal;
  ImageIndex: Integer = 0; // Índice da imagem atual

implementation

{$R *.fmx}

uses About, Setup, AddMoves;

//=====================================================FUNÇÕES PERSONALIZADAS======================================================


procedure TfrmPrincipal.AnimateOpacity(Component: TComponent);
var
  Animation: TFloatAnimation;
begin
  Animation := TFloatAnimation.Create(TComponent(Component));  // Direção da animação
  Animation.AnimationType := TAnimationType.In;
  Animation.Interpolation := TInterpolationType.Linear;
  Animation.Parent := TButton(Component);  // Define o botão como alvo da animação
  Animation.PropertyName := 'Opacity';     // A propriedade Opacity será animada
  Animation.StartValue := 1.0;             // Início da opacidade (totalmente visível)
  Animation.StopValue := 0.3;              // Fim da opacidade (30% transparente)
  Animation.Duration := 0.1;               // Duração da animação (em segundos)
  Animation.Loop := False;                 // A animação não será repetida
  Animation.AutoReverse := True;           // A animação reverte ao final (vai e volta)
  Animation.Enabled := False;              // Desabilite a animação inicialmente
  Animation.Start;
end;

procedure TfrmPrincipal.AnimateStatusBluetooth(Component: TComponent);
var
  Animation: TFloatAnimation;
begin
  Animation := TFloatAnimation.Create(TComponent(Component));  // Direção da animação
  Animation.AnimationType := TAnimationType.In;
  Animation.Interpolation := TInterpolationType.Linear;
  Animation.Parent := TButton(Component);  // Define o botão como alvo da animação
  Animation.PropertyName := 'Opacity';     // A propriedade Opacity será animada
  Animation.StartValue := 1.0;             // Início da opacidade (totalmente visível)
  Animation.StopValue := 0.3;              // Fim da opacidade (30% transparente)
  Animation.Duration := 2.0;               // Duração da animação (em segundos)
  Animation.Loop := True;                  // A animação não será repetida
  Animation.AutoReverse := True;           // A animação reverte ao final (vai e volta)
  Animation.Enabled := False;              // Desabilite a animação inicialmente
  Animation.Start;
end;

procedure TfrmPrincipal.BotaoPressionadoClick(Sender: TObject);
begin
  if frmSetup.DispHabilitado then
    // envia nome do componente rectangle (gupo, direção, nome) _ velocidade movimentos _ passos
    EnviarDados(TComponent(Sender).Name + '_' + TempoMovimento + '_' + TComponent(Sender).Tag.ToString);

    ShowMessage(TComponent(Sender).Name + '_' + TempoMovimento + '_' + TComponent(Sender).Tag.ToString);
end;

procedure TfrmPrincipal.BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  AnimateOpacity(TRectangle(Sender));
end;

procedure TFrmPrincipal.MudarAba(lyt: TLayout);
begin
  lytMoves.Opacity := 0.3;
  lytGestures.Opacity := 0.3;
  lytSounds.Opacity := 0.3;
  lytSequence.Opacity := 0.3;
  lyt.Opacity := 1;
  TabControl.GotoVisibleTab(lyt.Tag);
end;

procedure TfrmPrincipal.selectMovie(Sender: TObject);
begin
  Componente := Sender;
  frmAddMoves.Show;
end;

procedure TfrmPrincipal.EnviarDados(Acao: string);
begin
  frmSetup.BTMethod.SendData(frmSetup.NumAlvoPareado, Acao);
end;
//=================================================================================================================================

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  MudarAba(TLayout(lytMoves));
  ImageIndex := 0;
  TempoMovimento := '0800';
  imgSpeed.Bitmap := imlSpeed.Source[ImageIndex].MultiResBitmap[0].Bitmap;
end;

procedure TfrmPrincipal.imgAboutClick(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmPrincipal.imgConfigClick(Sender: TObject);
begin
  frmSetup.Show;
end;

procedure TfrmPrincipal.imgSpeedClick(Sender: TObject);
begin
  Inc(ImageIndex);

  if (ImageIndex >= imlSpeed.Count) then
    ImageIndex := 0;
  imgSpeed.Bitmap := (imlSpeed.Source[ImageIndex].MultiResBitmap[0].Bitmap);

  case ImageIndex of
    0 : TempoMovimento := '1200';
    1 : TempoMovimento := '0800';
    2 : TempoMovimento := '0400';
  end;
end;

procedure TfrmPrincipal.lytRodapeClick(Sender: TObject);
begin
  MudarAba(TLayout(Sender));
end;


end.
