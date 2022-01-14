unit uCalculating;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Gauges, Vcl.Buttons;

type
  TfrmCalculation = class(TForm)
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
    procedure Calchash;
    procedure sizeminimize(status: Boolean);
  end;

var
  frmCalculation: TfrmCalculation;

implementation

{$R *.dfm}

uses
  uMain, uFunctions, IdHashCRC,
  IdSSLOpenSSL,
  IdHashSHA,
  IdHashMessageDigest, uLanguage;

procedure TfrmCalculation.Calchash;
var
  i,f, adet: Integer;
  md2hash, md4hash, md5hash, sha1hash, sha224hash, sha256hash, sha384hash, sha512hash, sha512_224hash, sha512_256hash, crc16hash, crc32hash: string;
  item: TListItem;
  md2h, md4h, md5h, sha1h, sha224h, sha256h, sha384h, sha512h, sha512_224h, sha512_256h, crc16h, crc32h: Boolean;
  hashcount: Integer;

begin
  hashcount := 0;
  if Form1.algorithmmenumd2.Checked then begin
    md2h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenumd4.Checked then begin
    md4h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenumd5.Checked then begin
    md5h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha1.Checked then begin
    sha1h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha224.Checked then begin
    sha224h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha256.Checked then begin
    sha256h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha384.Checked then begin
    sha384h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha512.Checked then begin
    sha512h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha512_224.Checked then begin
    sha512_224h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenusha512_256.Checked then begin
    sha512_256h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenucrc16.Checked then begin
    crc16h := true;
    hashcount := hashcount + 1;
  end;
  if Form1.algorithmmenucrc32.Checked then begin
    crc32h := true;
    hashcount := hashcount + 1;
  end;
  lblfilecount.Caption := '[ 0 / ' + IntToStr(stlist.Count) + ' ]';
  progress1.Max := stlist.Count * hashcount;
  lblstatus.Caption := form3status2;
  Delay(100);
  Application.ProcessMessages;
  for i := 0 to stlist.Count - 1 do
  begin
    try
      lblfilename.Caption := ExtractFileName(stlist[i]);
      lbldirectory.Caption := ExtractFileDir(stlist[i]);
      lblfilecount.Caption := '[ ' + IntToStr(i + 1) + ' / ' + IntToStr(stlist.Count) + ' ]';
      if md2h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'MD2';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              md2hash := MD2FromFile(stlist[i])
            else
              md2hash := LowerCase(MD2FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('MD2');
          item.SubItems.Add(md2hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;
      if md4h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'MD4';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              md4hash := MD4FromFile(stlist[i])
            else
              md4hash := LowerCase(MD4FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('MD4');
          item.SubItems.Add(md4hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if md5h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'MD5';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              md5hash := MD5FromFile(stlist[i])
            else
              md5hash := LowerCase(MD5FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('MD5');
          item.SubItems.Add(md5hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha1h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA1';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha1hash := SHA1FromFile(stlist[i])
            else
              sha1hash := LowerCase(SHA1FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA1');
          item.SubItems.Add(sha1hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha224h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-224';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha224hash := SHA224FromFile(stlist[i])
            else
              sha224hash := LowerCase(SHA224FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-224');
          item.SubItems.Add(sha224hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha256h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-256';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha256hash := SHA256FromFile(stlist[i])
            else
              sha256hash := LowerCase(SHA256FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-256');
          item.SubItems.Add(sha256hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha384h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-384';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha384hash := SHA384FromFile(stlist[i])
            else
              sha384hash := LowerCase(SHA384FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-384');
          item.SubItems.Add(sha384hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha512h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-512';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha512hash := SHA512FromFile(stlist[i])
            else
              sha512hash := LowerCase(SHA512FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-512');
          item.SubItems.Add(sha512hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha512_224h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-512/224';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha512_224hash := SHA512_224FromFile(stlist[i])
            else
              sha512_224hash := LowerCase(SHA512_224FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-512/224');
          item.SubItems.Add(sha512_224hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if sha512_256h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'SHA2-512/256';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              sha512_256hash := SHA512_256FromFile(stlist[i])
            else
              sha512_256hash := LowerCase(SHA512_256FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('SHA2-512/256');
          item.SubItems.Add(sha512_256hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;
      end;

      if crc16h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'CRC16';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              crc16hash := CRC16FromFile(stlist[i])
            else
              crc16hash := LowerCase(CRC16FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('CRC-16');
          item.SubItems.Add(crc16hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;

      end;

      if crc32h then begin
        if status = true then
        begin
          lblcalchash.Caption := 'CRC32';
          Delay(100);
          progress1.StepIt;
          Application.ProcessMessages;
          if Form1.menuuppercase.Checked then
              crc32hash := CRC32FromFile(stlist[i])
            else
              crc32hash := LowerCase(CRC32FromFile(stlist[i]));
          item := Form1.mylist1.Items.Add;
          item.Caption := ExtractFileName(stlist[i]);
          item.SubItems.Add(ExtractFileDir(stlist[i]));
          item.SubItems.Add('CRC-32');
          item.SubItems.Add(crc32hash);
          item.Checked := true;
        end
        else
        begin
          Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
          Timer1.Enabled := true;
          Exit;
        end;

      end;
    except on E: Exception do
      begin
        progress1.Position := i * 10;
        Form1.mylist1.Items.Delete(Form1.mylist1.Items.Count - 1);
      end;
    end;
  end;
  Timer1.Enabled := true;

end;


procedure TfrmCalculation.btncancelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  msg: Byte;
begin
  msg := Application.MessageBox(PWideChar(form3msgcancel), PWideChar(form3msgcancel2), 36 + 256);
  if msg = 6 then
  begin
    status := false;
    btncancel.Enabled := false;
  end;

end;

procedure TfrmCalculation.btnminimizeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if minimizestatus then
  begin
    minimize := true;
    minimizestatus := false;
    btnminimize.Caption := form3btnmaximize;
    btnminimize.ImageIndex := 4;
    Form1.Hide;
    sizeminimize(true);
  end
  else
  begin
    minimize := false;
    minimizestatus := true;
    btnminimize.Caption := form3btnminimize;
    btnminimize.ImageIndex := 5;
    Form1.Show;
    sizeminimize(false);
  end;
end;

procedure TfrmCalculation.Delay(ms : longint);
var
  TheTime : LongInt;
begin
  TheTime := GetTickCount + ms;
  while GetTickCount < TheTime do
    Application.ProcessMessages;
end;

procedure TfrmCalculation.FormActivate(Sender: TObject);
var
  search: TSearchRec;
  i: Integer;
begin
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
    TThread.CreateAnonymousThread(Calchash).Start;
    //CreateThread(nil, 0, @Calchash, nil, 0, kimlikid);y
    //thread1 := TMyThread.Create(True);
    //thread1.Resume;
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
    TThread.CreateAnonymousThread(Calchash).Start;
    //CreateThread(nil, 0, @Calchash, nil, 0, kimlikid);
    //thread1 := TMyThread.Create(True);
    //thread1.Resume;
  end;

end;

procedure TfrmCalculation.FormCreate(Sender: TObject);
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

procedure TfrmCalculation.sizeminimize(status: Boolean);
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
    Self.ClientHeight := 40;
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
    Self.BorderStyle := bsSingle;
  end;
end;

procedure TfrmCalculation.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  Form1.menulanguage.Enabled := true;
  Form1.Show;
  Form1.listcalc;
  Self.Close;
end;

end.
