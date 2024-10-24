unit uSessionServidor;

interface

type
  TSession = class
  private
    class var FID_USUARIO: integer;
    class var FNOME: string;
    class var FEMAIL: string;
    class var FRAMAL: integer;
    class var FSECRETARIA: string;
    class var FLOCAL: string;
  public
    class property ID_USUARIO: integer read FID_USUARIO write FID_USUARIO;
    class property NOME: string read FNOME write FNOME;
    class property EMAIL: string read FEMAIL write FEMAIL;
    class property RAMAL: integer read FRAMAL write FRAMAL;
    class property SECRETARIA: string read FSECRETARIA write FSECRETARIA;
    class property LOCAL: string read FLOCAL write FLOCAL;
  end;

implementation

end.

