unit uTextGenerator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    lbltext: TLabel;
    edittext: TEdit;
    lblmd2: TLabel;
    lblmd4: TLabel;
    lblmd5: TLabel;
    lblsha1: TLabel;
    lblcrc16: TLabel;
    lblcrc32: TLabel;
    editmd2: TEdit;
    editmd4: TEdit;
    editmd5: TEdit;
    editsha1: TEdit;
    editcrc16: TEdit;
    editcrc32: TEdit;
    lblsha2_224: TLabel;
    editsha2_224: TEdit;
    lblsha2_256: TLabel;
    editsha2_256: TEdit;
    lblsha2_384: TLabel;
    editsha2_384: TEdit;
    lblsha2_512: TLabel;
    editsha2_512: TEdit;
    lblsha2_512224: TLabel;
    editsha2_512224: TEdit;
    lblsha2_512256: TLabel;
    editsha2_512256: TEdit;
    procedure edittextChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  uFunctions, uMain;

procedure TForm2.edittextChange(Sender: TObject);
begin
  if edittext.Text <> '' then
  begin
    if Form1.menuuppercase.Checked then
    begin
      editmd2.Text := MD2FromString(edittext.Text);
      editmd4.Text := MD4FromString(edittext.Text);
      editmd5.Text := MD5FromString(edittext.Text);
      editsha1.Text := SHA1FromString(edittext.Text);
      editsha2_224.Text := SHA224FromString(edittext.Text);
      editsha2_256.Text := SHA256FromString(edittext.Text);
      editsha2_384.Text := SHA384FromString(edittext.Text);
      editsha2_512.Text := SHA512FromString(edittext.Text);
      editsha2_512224.Text := SHA512_224FromString(edittext.Text);
      editsha2_512256.Text := SHA512_256FromString(edittext.Text);
      editcrc16.Text := CRC16FromString(edittext.Text);
      editcrc32.Text := CRC32FromString(edittext.Text);
    end
    else
    begin
      editmd2.Text := LowerCase(MD2FromString(edittext.Text));
      editmd4.Text := LowerCase(MD4FromString(edittext.Text));
      editmd5.Text := LowerCase(MD5FromString(edittext.Text));
      editsha1.Text := LowerCase(SHA1FromString(edittext.Text));
      editsha2_224.Text := LowerCase(SHA224FromString(edittext.Text));
      editsha2_256.Text := LowerCase(SHA256FromString(edittext.Text));
      editsha2_384.Text := LowerCase(SHA384FromString(edittext.Text));
      editsha2_512.Text := LowerCase(SHA512FromString(edittext.Text));
      editsha2_512224.Text := LowerCase(SHA512_224FromString(edittext.Text));
      editsha2_512256.Text := LowerCase(SHA512_256FromString(edittext.Text));
      editcrc16.Text := LowerCase(CRC16FromString(edittext.Text));
      editcrc32.Text := LowerCase(CRC32FromString(edittext.Text));
    end;
  end
  else
  begin
    editmd2.Clear;
    editmd4.Clear;
    editmd5.Clear;
    editsha1.Clear;
    editsha2_224.Clear;
    editsha2_256.Clear;
    editsha2_384.Clear;
    editsha2_512.Clear;
    editcrc16.Clear;
    editcrc32.Clear;
  end;
end;

end.
