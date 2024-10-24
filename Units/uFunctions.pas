unit uFunctions;

interface

uses SysUtils, FMX.TextLayout, FMX.ListView.Types, System.Types, FMX.Graphics, FMX.Controls, System.Classes, Soap.EncdDecd, Data.DB,
     DateUtils, System.Net.HttpClient, System.Net.HttpClientComponent, FMX.Objects, System.RegularExpressions, System.IOUtils;

type
    TFunctions = class
    private

    public
      class procedure LoadImageFromURL(img: TBitmap; url: string);
      class function Round2(aValue:double):double;
      class function UTCtoDateBR(dt: string): string;
      class function GerarChave(): string;
      class function GeraCodFoto: String;
      class function GetTextHeight(const D: TListItemText; const Width: single; const Text: string): Integer;
      class function BitmapFromBase64(const base64: string): TBitmap;
      class function Base64FromBitmap(Bitmap: TBitmap): string;
      class function StrToAvaliacao(avaliacao: string): double; static;
      class function StrToMoney(vl: string): double; static;
      class function StrToData(dt, formato: string): TDateTime; static;
      class function OccurrencesOfChar(const S: string; const C: char): integer; static;
      class function iifs(condicao: Boolean; value1, value2 : string) : string;
      class procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
      class function LoadBitmapFromBlobField(Blob: TBlobField): TBitmap; static;
      class function ValidarEmail(email: string): Boolean;
      class procedure CopyFileBetweenFolders(const SourceFileName, DestinationFileName: string);
      {$IFDEF ANDROID}
      class function GetAppVersion: string;
      {$ENDIF}
      {$IFDEF IOS}
      class function GetAppVersion: string;
      {$ENDIF}

end;


implementation

{$IFDEF ANDROID}
uses
    Androidapi.Helpers, Androidapi.JNI.JavaTypes, FMX.Helpers.Android, Androidapi.JNI.GraphicsContentViewText;
{$ENDIF}

{$IFDEF IOS}
uses
  iOSapi.Foundation, FMX.Helpers.iOS;
{$ENDIF}

{$IFDEF ANDROID}
class function TFunctions.GetAppVersion: string;

var
  Context: JContext;
  PackageInfo: JPackageInfo;
begin
  Context := TAndroidHelper.Context;
  PackageInfo := Context.getPackageManager.getPackageInfo(Context.getPackageName, 0);
  Result := JStringToString(PackageInfo.versionName);
end;
{$ENDIF}

{$IFDEF IOS}
class function TFunctions.GetAppVersion: string;
 var
  AppKey: Pointer;
  AppBundle: NSBundle;
  BuildStr : NSString;
begin
  AppKey := NSStr('CFBundleShortVersionString').description;  //CFBundleVersion
  AppBundle := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
  BuildStr := TNSString.Wrap(AppBundle.infoDictionary.objectForKey(AppKey));
  Result := UTF8ToString(BuildStr.UTF8String);
//  Result :=  NSStrToStr(TNSBundle.Wrap(TNSBundle.OCClass.mainBundle).infoDictionary.objectForKey(NSStr('CFBundleShortVersionString')).description);
end;
{$ENDIF}

class procedure TFunctions.CopyFileBetweenFolders(const SourceFileName, DestinationFileName: string);
begin
  if not TFile.Exists(SourceFileName) then
    raise Exception.CreateFmt('O arquivo de origem "%s" não existe.', [SourceFileName]);

  try
    TFile.Copy(SourceFileName, DestinationFileName, True);
//    Writeln(Format('Arquivo copiado de "%s" para "%s" com sucesso.', [SourceFileName, DestinationFileName]));
  except
    on E: Exception do
      Writeln(Format('Erro ao copiar o arquivo: %s', [E.Message]));
  end;
end;

class function TFunctions.UTCtoDateBR(dt: string): string;
begin
    // 2022-05-05 15:23:52.000
    Result := Copy(dt, 9, 2) + '/' + Copy(dt, 6, 2) + '/' + Copy(dt, 1, 4) + ' ' + Copy(dt, 12, 8);
end;

class function TFunctions.GeraCodFoto: String;
begin
    Result := FormatDateTime('yymmddHHnnsszzz', now);
end;

class function TFunctions.Round2(aValue:double):double;
begin
  Round2:=Round(aValue*100)/100;
end;

class procedure TFunctions.LoadImageFromURL(img: TBitmap; url: string);
var
    http : TNetHTTPClient;
    vStream : TMemoryStream;
begin
    try
        try
            http := TNetHTTPClient.Create(nil);
            vStream :=  TMemoryStream.Create;

            if (Pos('https', LowerCase(url)) > 0) then
                  HTTP.SecureProtocols  := [THTTPSecureProtocol.TLS1,
                                            THTTPSecureProtocol.TLS11,
                                            THTTPSecureProtocol.TLS12];

            http.Get(url, vStream);
            vStream.Position  :=  0;


            img.LoadFromStream(vStream);
        except
        end;

    finally
        vStream.Free;
        http.Free;
    end;
end;

class function TFunctions.iifs(condicao: Boolean; value1, value2 : string) : string;
begin
  if (condicao) then
    result := value1
  else
    result := value2
end;

class function TFunctions.OccurrencesOfChar(const S: string; const C: char): integer;
var
  i: Integer;
begin
    Result := 0;

    for i := 1 to Length(S) do
        if S[i] = C then
            inc(result);
end;

// Converte uma string base64 em um Bitmap...
class function TFunctions.BitmapFromBase64(const base64: string): TBitmap;
var
  Input: TStringStream;
  Output: TBytesStream;
begin
  Input := TStringStream.Create(base64, TEncoding.ASCII);
  try
    Output := TBytesStream.Create;
    try
      Soap.EncdDecd.DecodeStream(Input, Output);
      Output.Position := 0;
      Result := TBitmap.Create;
      try
        Result.LoadFromStream(Output);
      except
        Result.Free;
        raise;
      end;
    finally
      Output.Free;
    end;

  finally
    Input.Free;
  end;
end;

// Converte um Bitmap em uma string no formato base64...
class function TFunctions.Base64FromBitmap(Bitmap: TBitmap): string;
var
  Input: TBytesStream;
  Output: TStringStream;
begin
  Input := TBytesStream.Create;
  try
    Bitmap.SaveToStream(Input);
    Input.Position := 0;
    Output := TStringStream.Create('', TEncoding.ASCII);

    try
      Soap.EncdDecd.EncodeStream(Input, Output);
      Result := Output.DataString;
    finally
      Output.Free;
    end;

  finally
    Input.Free;
  end;
end;

// Gera um código de 15 caracteres...
class function TFunctions.GerarChave(): string;
begin
  Result := FormatDateTime('yymmddhhnnsszzz', Now);
end;

// Trata conversao de string "4.5" para avaliacao Float
class function TFunctions.StrToAvaliacao(avaliacao: string): double;
begin
  try
    avaliacao := avaliacao.Replace('.', '');
    avaliacao := avaliacao.Replace(',', '');

    Result := StrToFloat(avaliacao) / 10;
  except
    Result := 0;
  end;
end;

// Trata conversao de string monetaria "1.500,25" para valor Float
class function TFunctions.StrToMoney(vl: string): double;
begin
    try
        vl := vl.Replace('.', '');
        vl := vl.Replace(',', '');

        Result := StrToFloat(vl) / 100;
    except
        Result := 0;
    end;
end;


// Trata conversao de string para data
class function TFunctions.StrToData(dt, formato: string): TDateTime;
var
    dia, mes, ano, hora, min, seg : Word;
    pos_d, pos_m, pos_y, pos_h, pos_n, pos_s : Integer;
begin
    try
        if formato = '' then
            formato := 'dd/mm/yyyy';

        pos_d := Pos('d', formato);
        pos_m := Pos('m', formato);
        pos_y := Pos('y', formato);

        pos_h := Pos('h', formato);
        pos_n := Pos('n', formato);
        pos_s := Pos('s', formato);

        dia := Copy(dt, pos_d, OccurrencesOfChar(formato, 'd')).ToInteger;
        mes := Copy(dt, pos_m, OccurrencesOfChar(formato, 'm')).ToInteger;
        ano := Copy(dt, pos_y, OccurrencesOfChar(formato, 'y')).ToInteger;

        hora := Copy(dt, pos_h, OccurrencesOfChar(formato, 'h')).ToInteger;
        min := Copy(dt, pos_n, OccurrencesOfChar(formato, 'n')).ToInteger;
        seg := Copy(dt, pos_s, OccurrencesOfChar(formato, 's')).ToInteger;

        if pos_h > 0 then
            Result := EncodeDateTime(ano, mes, dia, hora, min, seg, 0)
        else
            Result := EncodeDate(ano, mes, dia)
    except
        Result := date;
    end;
end;

// Calcula a altura de um item TListItemText
class function TFunctions.GetTextHeight(const D: TListItemText; const Width: single; const Text: string): Integer;
var
  Layout: TTextLayout;
begin
  // Create a TTextLayout to measure text dimensions
  Layout := TTextLayoutManager.DefaultTextLayout.Create;
  try
    Layout.BeginUpdate;
    try
      // Initialize layout parameters with those of the drawable
      Layout.Font.Assign(D.Font);
      Layout.VerticalAlign := D.TextVertAlign;
      Layout.HorizontalAlign := D.TextAlign;
      Layout.WordWrap := D.WordWrap;
      Layout.Trimming := D.Trimming;
      Layout.MaxSize := TPointF.Create(Width, TTextLayout.MaxLayoutSize.Y);
      Layout.Text := Text;
    finally
      Layout.EndUpdate;
    end;
    // Get layout height
    Result := Round(Layout.Height);
    // Add one em to the height
    Layout.Text := 'm';
    Result := Result + Round(Layout.Height);
  finally
    Layout.Free;
  end;
end;

class procedure TFunctions.LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    Bitmap.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

class function TFunctions.LoadBitmapFromBlobField(Blob: TBlobField):TBitmap;
var
  ms: TMemoryStream;
begin
  Result := TBitmap.Create;
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    Result.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

class function TFunctions.ValidarEmail(email: string): Boolean;
const
  RegexPadrao = '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$';
begin
  Result := TRegEx.IsMatch(Email, RegexPadrao);
end;

end.
