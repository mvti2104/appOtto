unit About;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, System.IOUtils,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmAbout = class(TForm)
    rectToolBar: TRectangle;
    lblTitulo: TLabel;
    imgBack: TImage;
    rectWebsite: TRectangle;
    Image11: TImage;
    Image1: TImage;
    rectInstructions: TRectangle;
    Image2: TImage;
    Label1: TLabel;
    lblLinkWebsite: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblLinkInstructions: TLabel;
    Label7: TLabel;
    procedure imgBackClick(Sender: TObject);
    procedure rectWebsiteClick(Sender: TObject);
    procedure rectInstructionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.fmx}

uses u_urlOpen;

procedure TfrmAbout.imgBackClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmAbout.rectInstructionsClick(Sender: TObject);
begin
  TURLOpen.Open('https://www.hackster.io/cparrapa/otto-diy-build-your-own-robot-in-one-hour-5f2a1c');
end;

procedure TfrmAbout.rectWebsiteClick(Sender: TObject);
begin
  TURLOpen.Open('https://www.ottodiy.com/');
end;

end.
