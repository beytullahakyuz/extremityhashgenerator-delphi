unit uExport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmExport = class(TForm)
    GroupBox1: TGroupBox;
    labellocation: TLabel;
    editpath: TEdit;
    btnbrowse: TButton;
    btnsave: TButton;
    btncancel: TButton;
    radiosaveall: TRadioButton;
    radiocheckeditems: TRadioButton;
    savedialog: TSaveDialog;
    labelcharset: TLabel;
    combocharset: TComboBox;
    labelsavetype: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure chkmd2Click(Sender: TObject);
    procedure btnbrowseMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnsaveMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    //procedure chkmd2Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure control;
    procedure writefile(path: string);
    procedure SetOwnerDraw(Value: Boolean);
    function getcountlist: Integer;
  end;

var
  frmExport: TfrmExport;

implementation

{$R *.dfm}

uses
  uLanguage, uMain, Vcl.Styles.OwnerDrawFix;

var
  path: string;

procedure TfrmExport.btnbrowseMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  savedialog.FileName := '';
  savedialog.Title := form4savedialogtitle;
  savedialog.InitialDir := GetEnvironmentVariable('USERPROFILE') + '\Desktop';
  savedialog.Filter := form4html;
  savedialog.Execute();
  if savedialog.FileName <> '' then
  begin
    path := savedialog.FileName;
    if ExtractFileExt(path) = '' then
      if savedialog.FilterIndex = 1 then
        path := path + '.html'
      else if savedialog.FilterIndex = 2 then
        path := path + '.rtf';
    editpath.Text := path;
    control;
    //writefile(path);
  end;
end;

procedure TfrmExport.btncancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmExport.btnsaveMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  writefile(path);
end;

procedure TfrmExport.chkmd2Click(Sender: TObject);
var
  str: string;
begin
  if (Sender) is TCheckBox then
  begin
    str := BoolToStr(TCheckBox(Sender).Checked);
    if str = '-1' then
      TCheckBox(Sender).Checked := true
      else
      TCheckBox(Sender).Checked := false;
  end;
  control;
end;

procedure TfrmExport.control;
begin
  if (path = '') then
    btnsave.Enabled := false
    else
    btnsave.Enabled := true;
end;

procedure TfrmExport.FormActivate(Sender: TObject);
begin
  control;
end;

procedure TfrmExport.FormCreate(Sender: TObject);
begin
  labellocation.Caption := form4labellocation;
  GroupBox1.Caption := form4grup1;
  btnsave.Caption := form4btnsave;
  btncancel.Caption := form4btncancel;
  Self.Caption := form4caption;
  radiosaveall.Caption := form4radiosaveall;
  radiocheckeditems.Caption := form4radiosavechecked;
  SetOwnerDraw(true);
  combocharset.Items.Clear;
  combocharset.Items.AddStrings(charsetlist);
  labelcharset.Caption := form4labelcharset;
  labelsavetype.Caption := form4labelsavetype;
  combocharset.ItemIndex := 13;
end;

function TfrmExport.getcountlist: Integer;
var
  adet, i: Integer;
begin
  adet := 0;
  for i := 0 to Form1.mylist1.Items.Count - 1 do
  begin
    if Form1.mylist1.Items[i].Checked then
      adet := adet + 1;
  end;
  Result := adet;
end;

procedure TfrmExport.writefile(path: string);
var
  sfile: TStreamWriter;
  charset: string;
  i: Integer;
begin
  //stream := TStream.Create;
  case combocharset.ItemIndex of
    0: charset := 'big5';
    1: charset := 'euc-kr';
    2: charset := 'iso-8859-1';
    3: charset := 'iso-8859-2';
    4: charset := 'iso-8859-3';
    5: charset := 'iso-8859-4';
    6: charset := 'iso-8859-5';
    7: charset := 'iso-8859-6';
    8: charset := 'iso-8859-7';
    9: charset := 'iso-8859-8';
    10: charset := 'koi8-r';
    11: charset := 'shift-jis';
    12: charset := 'x-euc';
    13: charset := 'utf-8';
  end;

  sfile := TStreamWriter.Create(path, false);
  try
    sfile.Write('<html><head><meta charset="' + charset + '">');
    sfile.Write('<style>body{font-family: Tahoma; background-color: white; font-size: 10pt}table{border-collapse: collapse}table th{font-weight: bold; text-align: left; border-bottom:3px solid black}');
    sfile.Write('table tr{text-align: left; border-bottom:1px solid black}table td,table th	{padding: 15px}</style></head><body><form><center><table><tr><th>');
    sfile.WriteLine(Form1.mylist1.Columns.Items[0].Caption + '</th>' + '<th>'+ Form1.mylist1.Columns.Items[2].Caption + '</th><th>' + Form1.mylist1.Columns[3].Caption + '</th></tr>');

    for i := 0 to Form1.mylist1.Items.Count - 1 do
    begin
      if radiosaveall.Checked then
      begin
        sfile.WriteLine('<tr>');
        sfile.WriteLine('<td>' + Form1.mylist1.Items[i].Caption + '</td>');
        sfile.WriteLine('<td>' + Form1.mylist1.Items[i].SubItems[1] + '</td>');
        sfile.WriteLine('<td>' + Form1.mylist1.Items[i].SubItems[2] + '</td>');
        sfile.WriteLine('</tr>');
      end;
      if radiocheckeditems.Checked then
      begin
        if Form1.mylist1.Items[i].Checked then
        begin
          sfile.WriteLine('<tr>');
          sfile.WriteLine('<td>' + Form1.mylist1.Items[i].Caption + '</td>');
          sfile.WriteLine('<td>' + Form1.mylist1.Items[i].SubItems[1] + '</td>');
          sfile.WriteLine('<td>' + Form1.mylist1.Items[i].SubItems[2] + '</td>');
          sfile.WriteLine('</tr>');
        end;
      end;
    end;
     sfile.WriteLine('</table></center></form></body></html>');
    sfile.Close;
  finally
    sfile.Free;
  end;
  Application.MessageBox(PWideChar(form4msgwrite), PWideChar(form4msgwritetitle), 64);
  //sfile.AutoFlush := true;
  //sfile.NewLine := sLineBreak;
end;

procedure TfrmExport.SetOwnerDraw(Value: Boolean);
begin
  combocharset.OnDrawItem:=VclStylesOwnerDrawFix.ComboBoxDrawItem;
  //combocharset.OnMouseDown:=VclStylesOwnerDrawFix.ComboBoxDrawItem;
end;

end.
