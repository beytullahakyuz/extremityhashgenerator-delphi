unit uAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw;

type
  TfrmAbout = class(TForm)
    Image1: TImage;
    lblversion: TLabel;
    lblfirm: TLabel;
    lbldeveloper: TLabel;
    lbldescription: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

end.
