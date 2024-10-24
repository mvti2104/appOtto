unit BTConfig;

interface

Uses
  System.SysUtils, System.Classes, System.Bluetooth,
  FMX.Dialogs;

type
  DServiceListType = Record    // Service List of Paired Devices.
  DServiceName : TStringList;
  DServiceGUID : TStringList;
end;

type
  TBTMethod = class(TObject)
  private
    FBluetoothManager: TBluetoothManager;
    FPairedDevices: TBluetoothDeviceList;
    FAdapter: TBluetoothAdapter;
    ItemIndex: Integer;

  public
    MyDeviceName : string;
    FServiceGUID : string;
    FSocket: TBluetoothSocket;

    constructor Create;
    destructor Destroy; override;

    function Receivedata( nPair:integer) : String ;
    function ManagerConnected() :Boolean;
    function PairedDevices : TStringList;
    function Find_ServicesList( nPair : integer ) : DServiceListType;
    function SendData( nPair:integer; sData: string) : Boolean;
   end;

implementation


//----------------------------------------------------
constructor TBTMethod.Create;
begin
  inherited;
end;


destructor TBTMethod.Destroy;
begin
  inherited;
end;

//-------------------------------------------------------------------------------
function TBTMethod.ManagerConnected() :Boolean;
begin
  if FBluetoothManager.ConnectionState = TBluetoothConnectionState.Connected then
     Result := True
  else
    Result := False;
end;


//-------------------------------------------------
// 앱 시작시 최초 호출 됨.
function TBTMethod.PairedDevices() : TStringList;
var
  i : Integer;
  pDList : TStringList;
begin
  pDList := TStringList.Create;

  try
    FBluetoothManager := TBluetoothManager.Current;
    FAdapter := FBluetoothManager.CurrentAdapter;

    MyDeviceName := FBluetoothManager.CurrentAdapter.AdapterName;

    if ManagerConnected then
    begin
      FPairedDevices := FBluetoothManager.GetPairedDevices;

      // 단말기에 등록된 페어링 디바이스 리스트 출력
      if FPairedDevices.Count > 0 then
         for i:= 0 to FPairedDevices.Count - 1 do
             pDList.Add( FPairedDevices[i].DeviceName );
    end;

  except
    on E : Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

  result := pDList;
end;


//-------------------------------------------------------------------------------------
// nPair : Paired Device List No
function TBTMethod.Find_ServicesList( nPair : integer ) : DServiceListType;
var
  LServices: TBluetoothServiceList;
  LDevice: TBluetoothDevice;
  i : Integer;
  pSList : DServiceListType;
begin
  pSList.DServiceName := TStringList.Create;
  pSList.DServiceGUID := TStringList.Create;

  if ManagerConnected then
    if nPair > -1 then
    begin
      LDevice :=  FPairedDevices[ nPair ] as TBluetoothDevice;
      LServices := LDevice.GetServices;

      for i := 0 to LServices.Count - 1 do
      begin
        if LServices[ i ].Name = '' then
           pSList.DServiceName.Add( 'Unknown Service Name' )
        else
          pSList.DServiceName.Add( LServices[ i ].Name );
        pSList.DServiceGUID.Add( GUIDToString( LServices[ i ].UUID ));
      end;

    end
    else
      ShowMessage('No paired device selected');

  result := pSList;
end;

//---------------------------------------------------------------------------------------
// nPair : Paired Device List No
function TBTMethod.SendData( nPair:integer; sData:string ) : Boolean;
var
  ToSend: TBytes;
  LDevice: TBluetoothDevice;
begin
  result := FALSE;
  if ManagerConnected then
  try
    if (FSocket = nil) or ( ItemIndex <> nPair ) then
    begin
      if nPair > -1 then
      begin
        LDevice := FPairedDevices[ nPair ] as TBluetoothDevice;
        FSocket := LDevice.CreateClientSocket( StringToGUID( FServiceGUID ), False);
        if FSocket <> nil then
        begin
          ItemIndex := nPair;
          FSocket.Connect;
          ToSend := TEncoding.UTF8.GetBytes( sData );
          FSocket.SendData(ToSend);
          result := TRUE;
        end
        else
          ShowMessage('Out of time -15s-');
      end
      else
        ShowMessage('No paired device selected');
    end

    else
    begin
      ToSend := TEncoding.UTF8.GetBytes( sData );
      FSocket.SendData(ToSend);
      result := TRUE;
    end;

  except
      on E : Exception do
      begin
        ShowMessage('Error: No communication with Otto');
        FreeAndNil(FSocket);
      end;
    end;
end;

//---------------------------------------------------------------------------------------
// nPair : Paired Device List No
function TBTMethod.Receivedata( nPair:integer) : String ;
var
  ToReceive: TBytes;
  StrReceive : String;
  LDevice: TBluetoothDevice;
begin
  result := '';
  if ManagerConnected then
  try
    if (FSocket = nil) or ( ItemIndex <> nPair ) then
    begin
      if nPair > -1 then
      begin
        //-----------Pour la connexion
        LDevice := FPairedDevices[ nPair ] as TBluetoothDevice;
        FSocket := LDevice.CreateClientSocket( StringToGUID( FServiceGUID ), False);
        //-----------Pour la connexion
        if FSocket <> nil then
        begin
          ItemIndex := nPair;
          FSocket.Connect;

          ToReceive := FSocket.ReceiveData;;  //TBytes
          StrReceive := TEncoding.UTF8.GetString(ToReceive);
          result := StrReceive;                                    //Probleme renvoie un 3??????? en plus
        end
        else
          ShowMessage('Out of time -15s-Sorry-');
      end
      else
        ShowMessage('No paired device selected');
    end

    else
    begin
      ToReceive := FSocket.ReceiveData;;  // FSocket.ReceiveData
      StrReceive := TEncoding.UTF8.GetString(ToReceive);
      result := StrReceive;
    end;

  except
      on E : Exception do
      begin
        ShowMessage(E.Message);
        FreeAndNil(FSocket);
      end;
    end;
end;
//-------------------------------------------------------------------------------------

end.
