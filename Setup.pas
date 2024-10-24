unit Setup;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Ani, FMX.Layouts, uCombobox, BTConfig, uLoading, System.ImageList, FMX.ImgList;

type
  TfrmSetup = class(TForm)
    rectToolBar: TRectangle;
    lblTitulo: TLabel;
    imgBack: TImage;
    c13: TImage;
    recBluetooth: TRectangle;
    Label1: TLabel;
    rectBaterry: TRectangle;
    Label2: TLabel;
    imgBattery: TImage;
    lblLvelBattery: TLabel;
    ckbAutoCheck: TCheckBox;
    rectUltrasonic: TRectangle;
    Label3: TLabel;
    Image1: TImage;
    rectcbxDistance: TRectangle;
    rectCalibration: TRectangle;
    Label4: TLabel;
    c02: TRectangle;
    Image5: TImage;
    Layout1: TLayout;
    c01: TRectangle;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Layout2: TLayout;
    c10: TRectangle;
    Image3: TImage;
    c09: TRectangle;
    image4: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Layout3: TLayout;
    c08: TRectangle;
    Image6: TImage;
    c07: TRectangle;
    Image7: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Layout4: TLayout;
    c06: TRectangle;
    Image8: TImage;
    c05: TRectangle;
    Image9: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Layout5: TLayout;
    c04: TRectangle;
    Image10: TImage;
    c03: TRectangle;
    Image11: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Layout6: TLayout;
    c12: TRectangle;
    Image12: TImage;
    c11: TRectangle;
    Image13: TImage;
    Label15: TLabel;
    Label16: TLabel;
    lblBluetooth: TLabel;
    Image14: TImage;
    lblDistancia: TLabel;
    Image15: TImage;
    Rectangle13: TRectangle;
    imgConect: TImage;
    imlConect: TImageList;
    procedure imgBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure recBluetoothClick(Sender: TObject);
    procedure rectcbxDistanceClick(Sender: TObject);
    procedure BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure c01Click(Sender: TObject);
  private
    cbxPareados, cbxDistancia : TCustomComboBox;
    ServicosDisponiveis: DserviceListType; //BTconfig.pas

    procedure SetupComboboxPareados;
    procedure SetupComboboxDistancia;
    procedure AddListaDeServiços;


    {$IFDEF MSWINDOWS}
    procedure PareadosDataClick(Sender: TObject);
    procedure DistanciaDataClick(Sender: TObject);
    {$ELSE}
    procedure PareadosDataClick(Sender: TObject; const PointF: TPointF);
    procedure DistanciaDataClick(Sender: TObject; const PointF: TPointF);
    {$ENDIF}

  public
    BTMethod: TBTMethod;
    NumAlvoPareado: Integer; //ID do modulo conectado
    DispHabilitado : boolean;
  end;

var
  frmSetup: TfrmSetup;

implementation

{$R *.fmx}

uses Principal;

procedure TfrmSetup.FormCreate(Sender: TObject);
begin
  BTMethod := TBTMethod.Create;
  SetupComboboxPareados;
  SetupComboboxDistancia;
end;

procedure TfrmSetup.FormDestroy(Sender: TObject);
begin
  cbxPareados.Free;
  cbxDistancia.Free;
end;

procedure TfrmSetup.imgBackClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetup.recBluetoothClick(Sender: TObject);
begin
  cbxPareados.ShowMenu;
end;

procedure TfrmSetup.BotaoPressionadoMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  frmPrincipal.AnimateOpacity(TRectangle(Sender));
end;

//==========================================================COMBOBOXs=================================================================
procedure TfrmSetup.rectcbxDistanceClick(Sender: TObject);
begin
  cbxDistancia.ShowMenu;
end;

procedure TfrmSetup.c01Click(Sender: TObject);
begin
  frmPrincipal.EnviarDados(TComponent(Sender).Name);
end;

procedure TfrmSetup.SetupComboboxDistancia;
begin
  cbxDistancia := TCustomCombobox.Create(frmSetup);
  cbxDistancia.TitleMenuText := 'Ultrasonic range';
  cbxDistancia.SubTitleMenuText := 'Choose one of the options below:';

  cbxDistancia.BackgroundColor := $FF3A3A3A;
  cbxDistancia.TitleFontColor := $FFFFFFFF;
  cbxDistancia.TitleFontSize := 22;
  cbxDistancia.ItemBackgroundColor := $FF155B00;
  cbxDistancia.ItemFontColor := $FFFFFFFF;

  cbxDistancia.OnClick := DistanciaDataClick;

  cbxDistancia.AddItem('10', '10 cm');
  cbxDistancia.AddItem('15', '15 cm');
  cbxDistancia.AddItem('20', '20 cm');
  cbxDistancia.AddItem('30', '30 cm');
  cbxDistancia.AddItem('40', '40 cm');
end;

procedure TfrmSetup.SetupComboboxPareados;
var
  i: Integer;
  ListaDispositivos : TStringList;
begin
  cbxPareados := TCustomCombobox.Create(frmSetup);
  cbxPareados.TitleMenuText := 'Paired device';
  cbxPareados.SubTitleMenuText := 'Choose one of the options below:';

  cbxPareados.BackgroundColor := $FF3A3A3A;
  cbxPareados.TitleFontColor := $FFFFFFFF;
  cbxPareados.TitleFontSize := 22;
  cbxPareados.ItemBackgroundColor := $FF155B00;
  cbxPareados.ItemFontColor := $FFFFFFFF;

  cbxPareados.OnClick := PareadosDataClick;

  ListaDispositivos:= BTMethod.PairedDevices;

  for I := 0 to ListaDispositivos.Count -1 do
    begin
      cbxPareados.AddItem(I.ToString, ListaDispositivos[I]);
    end;
end;

{$IFDEF MSWINDOWS}
procedure TfrmSetup.PareadosDataClick(Sender: TObject);
{$ELSE}
procedure TfrmSetup.PareadosDataClick(Sender: TObject; const PointF: TPointF);
{$ENDIF}
begin
  cbxPareados.HideMenu;
  lblBluetooth.Text := cbxPareados.DescrItem;

  NumAlvoPareado := cbxPareados.CodItem.ToInteger;

  TLoading.Show(frmSetup, 'Adding Device...');

  TThRead.CreateAnonymousThread(
  procedure
  begin
    AddListaDeServiços;
    TThRead.Synchronize(TThRead.CurrentThread,
    procedure
    begin
      if (not DispHabilitado) then
        begin
          imgConect.Bitmap := (imlConect.Source[0].MultiResBitmap[0].Bitmap);
          ShowMessage('Device has no requirements for connection with Otto');
          frmPrincipal.lblStatusBluetooth.FontColor := $FFFFFFFF;
          frmPrincipal.lblStatusBluetooth.Opacity := 0.5;

        end
      else
        begin
          imgConect.Bitmap := (imlConect.Source[1].MultiResBitmap[0].Bitmap);
          frmPrincipal.lblStatusBluetooth.FontColor := $FF27B500;
          frmPrincipal.lblStatusBluetooth.Opacity := 1.0;
          frmPrincipal.AnimateStatusBluetooth(frmPrincipal.lblStatusBluetooth) ;
        end;

      TLoading.Hide;
    end);

  end).Start;
end;

{$IFDEF MSWINDOWS}
procedure TfrmSetup.DistanciaDataClick(Sender: TObject);
{$ELSE}
procedure TfrmSetup.DistanciaDataClick(Sender: TObject; const PointF: TPointF);
{$ENDIF}
begin
  cbxDistancia.HideMenu;
  lblDistancia.Text := cbxDistancia.DescrItem;
end;
//====================================================================================================================================

procedure TfrmSetup.AddListaDeServiços;
var
  i:integer;
begin
  ServicosDisponiveis:= BTMethod.Find_ServicesList(NumAlvoPareado);
  try
    DispHabilitado := False;
    for I := 0 to ServicosDisponiveis.DServiceName.Count -1 do
      if (ServicosDisponiveis.DServiceGUID[I] = '{00001101-0000-1000-8000-00805F9B34FB}') then
        begin

          try
            // conecta dispositivo bluetooth
            BTMethod.FServiceGUID:= ServicosDisponiveis.DServiceGUID[I];
            DispHabilitado := true;

          except
          {$IFDEF MSWINDOWS}

          {$ELSE}

          on E:EJNIException do
            begin
              ShowMessage('Not connected');
            end;

          {$ENDIF}
          end;

        end;

  finally
   //
  end;
end;


end.
