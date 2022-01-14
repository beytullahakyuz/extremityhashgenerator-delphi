unit uCalculating;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Gauges, Vcl.Buttons;

type
  TForm3 = class(TForm)
    labelfilecount: TLabel;
    lblstatus: TLabel;
    progress1: TProgressBar;
    labelcalchash: TLabel;
    labelfilename: TLabel;
    labeldirectory: TLabel;
    lblfilecount: TLabel;
    lblfilename: TLabel;
    lbldirectory: TLabel;
    btncancel: TButton;
    lblcalchash: TLabel;
    Timer1: TTimer;
    btnminimize: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btncancelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure btnminimizeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    var path: String;
    stlist: TStrings;
    startindex: Integer;
    status: Boolean;
    minimize: Boolean;
    minimizestatus: Boolean;
    procedure Delay(ms : longint);
    //procedure Calchash;
    procedure sizeminimize(status: Boolean);
  end;

var
  Form3: TForm3;

  procedure Calchash;

implementation

{$R *.dfm}

uses
  uMain, uFunctions, IdHashCRC,
  IdSSLOpenSSL,
  IdHashSHA,
  IdHashMessageDigest, uLanguage;

procedure Calchash;
var
  i,f, adet: Integer;
  md2hash, md4hash, md5hash, sha1hash, sha224hash, sha256hash, sha384hash, sha512hash, crc16hash, crc32hash: string;
  item: TListItem;
begin
  Form3.lblfilecount.Caption := '[ 0 / ' + IntToStr(Form3.stlist.Count) + ' ]';
  Form3.progress1.Max := Form3.stlist.Count * 10;
  Form3.lblstatus.Caption := form3status2;
  //Form3.Delay(100);
  for i := 0 to Form3.stlist.Count - 1 do
  begin
    try
      if (Form3.Height < 200) and (Form3.minimize = false) then
          Form3.sizeminimize(false)
        else if (Form3.Height > 200) and (Form3.minimize = true)  then
          Form3.sizeminimize(true);
      Form3.lblfilename.Caption := ExtractFileName(Form3.stlist[i]);
      Form3.lbldirectory.Caption := ExtractFileDir(Form3.stlist[i]);
      Form3.lblfilecount.Caption := '[ ' + IntToStr(i + 1) + ' / ' + IntToStr(Form3.stlist.Count) + ' ]';
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'MD2';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //md2hash := MD2FromFile(Form3.stlist[i]);
        item := Form1.mylist1.Items.Add;
        item.Caption := ExtractFileName(Form3.stlist[i]);
        item.SubItems.Add(ExtractFileDir(Form3.stlist[i]));
        item.SubItems.Add(md2hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'MD4';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //md4hash := MD4FromFile(Form3.stlist[i]);
        item.SubItems.Add(md4hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'MD5';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //md5hash := MD5FromFile(Form3.stlist[i]);
        item.SubItems.Add(md5hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'SHA1';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //sha1hash := SHA1FromFile(Form3.stlist[i]);
        item.SubItems.Add(sha1hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'SHA224';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //sha224hash := SHA224FromFile(Form3.stlist[i]);
        item.SubItems.Add(sha224hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'SHA256';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //sha256hash := SHA256FromFile(Form3.stlist[i]);
        item.SubItems.Add(sha256hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'SHA384';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //sha384hash := SHA384FromFile(Form3.stlist[i]);
        item.SubItems.Add(sha384hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'SHA512';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //sha512hash := SHA512FromFile(Form3.stlist[i]);
        item.SubItems.Add(sha512hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'CRC16';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //crc16hash := CRC16FromFile(Form3.stlist[i]);
        item.SubItems.Add(crc16hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      if Form3.status = true then
      begin
        Form3.lblcalchash.Caption := 'CRC32';
        //Form3.Delay(100);
        Form3.progress1.StepIt;
        //crc32hash := CRC32FromFile(Form3.stlist[i]);
        item.SubItems.Add(crc32hash);
      end
      else
      begin
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
        Form3.Timer1.Enabled := true;
        Exit;
      end;
      item.Checked := true;
    except on E: Exception do
      begin
        Form3.progress1.Position := i * 10;
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
      end;
    end;
  end;
  Form3.Timer1.Enabled := true;
end;


procedure TForm3.btncancelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  msg: Byte;
begin
  msg := Application.MessageBox(PWideChar(form3msgcancel), PWideChar(form3msgcancel2), 36 + 256);
  if msg = 6 then
    status := false;
end;

procedure TForm3.btnminimizeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if minimizestatus then
  begin
    minimize := true;
    minimizestatus := false;
    btnminimize.Caption := form3btnmaximize;
  end
  else
  begin
    minimize := false;
    minimizestatus := true;
    btnminimize.Caption := form3btnminimize;
  end;
end;



procedure TForm3.Delay(ms : longint);
var
  TheTime : LongInt;
begin
  TheTime := GetTickCount + ms;
  while GetTickCount < TheTime do
    Application.ProcessMessages;
end;

procedure TForm3.FormActivate(Sender: TObject);
var
  search: TSearchRec;
  i: Integer;
  kimlikid: DWord;
begin
  kimlikid := 1;
  if startindex = 1 then
  begin
    lblstatus.Caption := form3status1;
    Delay(100);
    stlist := TStringList.Create;
      try
        if FindFirst(path + '\*.*', faNormal, search) = 0 then
        begin
          repeat
            stlist.Add(path + '\' + search.Name); //Fill the list
          until FindNext(search) <> 0;
            FindClose(search);
        end;
    finally
      //stlist.Free;
    end;
    //Calchash;
    CreateThread(nil, 0, @Calchash, nil, 0, kimlikid);
  end
  else if startindex = 2 then
  begin
    lblstatus.Caption := form3status1;
    Delay(100);
    stlist := TStringList.Create;
      try
        for i := 0 to Form1.stlist.Count - 1 do
          stlist.Add(Form1.stlist[i]);
    finally
      //stlis1t.Free;
    end;
    //Calchash;
    CreateThread(nil, 0, @Calchash, nil, 0, kimlikid);
  end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  LoadOpenSSLLibrary;
  status := True;
  btncancel.Focused;
  minimizestatus := true;
  labelfilecount.Caption := form3labelfilecount;
  labelfilename.Caption := form3labelfilename;
  labelcalchash.Caption := form3labelcalchash;
  labeldirectory.Caption := form3labeldirectory;
  btnminimize.Caption := form3btnminimize;
  btncancel.Caption := form3btncancel;
  Self.Caption := form3caption;
end;

procedure TForm3.sizeminimize(status: Boolean);
var
  screenheight, screenwidth: Integer;
  db: Double;
begin
  if status = true then
  begin
    screenheight := Screen.WorkAreaHeight;
    screenwidth := Screen.WorkAreaWidth;
    labelfilecount.Visible := false;
    labelcalchash.Visible := false;
    labelfilename.Visible := false;
    labeldirectory.Visible := false;
    lblfilecount.Visible := false;
    lblfilename.Visible := false;
    lbldirectory.Visible := false;
    lblcalchash.Visible := false;
    lblstatus.Top := 8;
    progress1.Width := 217;
    progress1.Top := 24;
    btncancel.Top := 14;
    btnminimize.Top := 14;
    Self.BorderStyle := bsSizeable;
    Self.ClientHeight := 35;
    Self.Top := screenheight - Self.Height;
    Self.Left := screenwidth - Self.Width;
    Self.BorderStyle := bsSingle;
  end
  else
  begin
    labelfilecount.Visible := true;
    labelcalchash.Visible := true;
    labelfilename.Visible := true;
    labeldirectory.Visible := true;
    lblfilecount.Visible := true;
    lblfilename.Visible := true;
    lbldirectory.Visible := true;
    lblcalchash.Visible := true;
    lblstatus.Top := 144;
    progress1.Width := 377;
    progress1.Top := 163;
    btncancel.Top := 11;
    btnminimize.Top := 11;
    Self.BorderStyle := bsSizeable;
    Self.ClientHeight := 190;
    if (Form1.Width > 1000) then
    begin
      //db = Screen.WorkAreaHeight / 2
      db := (Screen.WorkAreaHeight / 2) - (Self.Height / 2);
      Self.Top := Trunc(db);
      db := (Screen.WorkAreaWidth / 2) - (Self.Width / 2);
      Self.Left := Trunc(db);
    end
    else
    begin
      Self.Left := Form1.Left + 272;
      Self.Top := Form1.Top + 190;
    end;

    //Self.Position := poMainFormCenter;
    Self.BorderStyle := bsSingle;
  end;
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Form1.menulanguage.Enabled := true;
  Self.Close;
end;

end.
