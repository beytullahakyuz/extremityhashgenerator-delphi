unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, stdActns,
  Vcl.Buttons, Vcl.ImgList, Vcl.Menus, Vcl.ExtCtrls, System.ImageList;

type
  TForm1 = class(TForm)
    mylist1: TListView;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    StatusBar1: TStatusBar;
    mainmenu: TMainMenu;
    mainmenu1: TMenuItem;
    menuaddfolder: TMenuItem;
    menuaddfiles: TMenuItem;
    mainmenu3: TMenuItem;
    menutools: TMenuItem;
    menusettings: TMenuItem;
    N2: TMenuItem;
    menusavewizard: TMenuItem;
    N3: TMenuItem;
    menuexit: TMenuItem;
    menutexthashgenerator: TMenuItem;
    mainmenu4: TMenuItem;
    menuabouthashgenerator: TMenuItem;
    OpenDialog1: TOpenDialog;
    menulanguage: TMenuItem;
    menuturkish: TMenuItem;
    menuenglish: TMenuItem;
    menusystemdefault: TMenuItem;
    mainmenu2: TMenuItem;
    menuselect: TMenuItem;
    menudeselect: TMenuItem;
    N5: TMenuItem;
    menuclearlist: TMenuItem;
    menuclipboard: TMenuItem;
    menuselected: TMenuItem;
    contextcheck: TMenuItem;
    contextuncheck: TMenuItem;
    N1: TMenuItem;
    contextdelete: TMenuItem;
    menuthemes: TMenuItem;
    thememenu1: TMenuItem;
    thememenu2: TMenuItem;
    thememenu3: TMenuItem;
    thememenu4: TMenuItem;
    thememenu5: TMenuItem;
    thememenu6: TMenuItem;
    thememenu7: TMenuItem;
    menucheckall: TMenuItem;
    menuuncheckall: TMenuItem;
    N4: TMenuItem;
    Timer1: TTimer;
    menufonttype: TMenuItem;
    menuuppercase: TMenuItem;
    menulowercase: TMenuItem;
    menualgorithms: TMenuItem;
    algorithmmenumd2: TMenuItem;
    algorithmmenumd4: TMenuItem;
    algorithmmenumd5: TMenuItem;
    algorithmmenusha1: TMenuItem;
    algorithmmenucrc16: TMenuItem;
    algorithmmenucrc32: TMenuItem;
    algorithmmenusha224: TMenuItem;
    algorithmmenusha256: TMenuItem;
    algorithmmenusha384: TMenuItem;
    algorithmmenusha512: TMenuItem;
    algorithmmenusha512_224: TMenuItem;
    algorithmmenusha512_256: TMenuItem;
    procedure menuaddfolderClick(Sender: TObject);
    procedure menuaddfilesClick(Sender: TObject);
    procedure menuexitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuselectClick(Sender: TObject);
    procedure menudeselectClick(Sender: TObject);
    procedure menuclearlistClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure contextcheckClick(Sender: TObject);
    procedure contextuncheckClick(Sender: TObject);
    procedure contextdeleteClick(Sender: TObject);
    procedure contextcopy1Click(Sender: TObject);
    procedure menutexthashgeneratorClick(Sender: TObject);
    procedure extportmenumd2Click(Sender: TObject);
    procedure thememenu1Click(Sender: TObject);
    procedure menucheckallClick(Sender: TObject);
    procedure menuuncheckallClick(Sender: TObject);
    procedure menusystemdefaultClick(Sender: TObject);
    procedure menuturkishClick(Sender: TObject);
    procedure menuenglishClick(Sender: TObject);
    procedure mylist1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Timer1Timer(Sender: TObject);
    procedure menusavewizardClick(Sender: TObject);
    procedure menuwebsiteClick(Sender: TObject);
    procedure menuforumClick(Sender: TObject);
    procedure menuabouthashgeneratorClick(Sender: TObject);
    procedure menuuppercaseClick(Sender: TObject);
    procedure algorithmmenumd2Click(Sender: TObject);
    procedure WMDROPFILES(var msg: TWMDropFiles); message WM_DROPFILES;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    folderdialog: TBrowseForFolder;
    path: string;
    stlist: TStrings;
    key: string;
    procedure SetOwnerDraw(Value : Boolean);
    procedure getdefaultlanguage;
    procedure savesettings;
    procedure listcalc;
    //stlist: TStrings;
  end;

var
  Form1: TForm1;

implementation


uses
  Vcl.Styles, ShellApi, System.StrUtils, uLanguage, Registry, Vcl.Themes, ClipBrd,
  Winapi.CommCtrl, Vcl.Styles.OwnerDrawFix, uCalculating, uTextGenerator, Vcl.FileCtrl,
  Vcl.Styles.Utils.SysControls, System.UITypes, Vcl.Styles.Utils.SystemMenu, uExport, uAbout;

{$R *.dfm}

procedure TForm1.WMDROPFILES(var msg: TWMDropFiles);
var
  i, fileCount: integer;
  dropfolder: array [0 .. MAX_PATH] of Char;
  frm: TfrmCalculation;
begin
  fileCount := DragQueryFile(msg.Drop, $FFFFFFFF, dropfolder, MAX_PATH);
  stlist := TStringList.Create;
  for i := 0 to fileCount - 1 do
  begin
    DragQueryFile(msg.Drop, i, dropfolder, MAX_PATH);
    if FileExists(dropfolder) then begin
        stlist.Add(dropfolder);
    end;
  end;
  DragFinish(msg.Drop);
  frm := TfrmCalculation.Create(Self);
  frm.path := stlist[0];
  frm.startindex := 2;
  frm.Position := poMainFormCenter;
  menulanguage.Enabled := false;
  frm.ShowModal;
  frm.Free;
end;

procedure TForm1.menucheckallClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
  begin
    mylist1.Items[i].Checked := true;
  end;
  listcalc;
end;

procedure TForm1.menuclearlistClick(Sender: TObject);
var
  msg: Byte;
  str: PWideChar;
begin
  str := PWideChar(msgclearlist);
  if mylist1.Items.Count > 0 then
  begin
    msg := Application.MessageBox(str, str, 33 + 256);
    if msg = 1 then
      mylist1.Items.Clear;
    listcalc;
  end
  else
    Application.MessageBox(PWideChar(msgemptylist), PWideChar(msgemptylist), 48);

end;

procedure TForm1.thememenu1Click(Sender: TObject);
var
  txt: string;
begin
  TMenuItem(Sender).Checked := true;
  txt := TMenuItem(Sender).Caption.Replace('&', '');
  if LowerCase(txt).Trim = 'calypso' then
    TStyleManager.SetStyle('Calypso')
  else if LowerCase(txt).Trim = 'flat ui light' then
    TStyleManager.SetStyle('Flat UI Light')
  else if LowerCase(txt).Trim = 'glossy' then
    TStyleManager.SetStyle('Glossy')
  else if LowerCase(txt).Trim = 'windows10' then
    TStyleManager.SetStyle('Windows10')
  else if LowerCase(txt).Trim = 'windows10 clear day' then
    TStyleManager.SetStyle('Windows10 Clear Day')
  else if LowerCase(txt).Trim = 'windows10 malibu' then
    TStyleManager.SetStyle('Windows10 Malibu')
  else if LowerCase(txt).Trim = 'windows10 slategray' then
    TStyleManager.SetStyle('Windows10 SlateGray');

  savesettings;
  Application.ProcessMessages;
  DragAcceptFiles( Handle, True );
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  StatusBar1.Panels[2].Text := '';
end;

procedure TForm1.algorithmmenumd2Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    TMenuItem(Sender).Checked := false
  else
    TMenuItem(Sender).Checked := true;

  if (algorithmmenumd2.Checked = false) and (algorithmmenumd4.Checked = false) and (algorithmmenumd5.Checked = false) and (algorithmmenusha1.Checked = false) and (algorithmmenusha224.Checked = false)
         and (algorithmmenusha256.Checked = false) and (algorithmmenusha384.Checked = false) and (algorithmmenusha512.Checked = false) and (algorithmmenucrc16.Checked = false) and (algorithmmenucrc32.Checked = false)
         and (algorithmmenusha512_224.Checked = false) and (algorithmmenusha512_256.Checked = false) then begin
    menuaddfolder.Enabled := false;
    menuaddfiles.Enabled := false;
    DragAcceptFiles(Handle,false);
  end
  else begin
    menuaddfolder.Enabled := true;
    menuaddfiles.Enabled := true;
    DragAcceptFiles(Handle,true);
  end;
  savesettings;
end;

procedure TForm1.contextcheckClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
    begin
      if mylist1.Items[i].Selected then
        mylist1.Items[i].Checked := true;
    end;
  listcalc;
end;

procedure TForm1.menuabouthashgeneratorClick(Sender: TObject);
var
  frm: TfrmAbout;
begin
  frm := TfrmAbout.Create(Self);
  frm.Position := poMainFormCenter;
  frm.lblversion.Caption := aboutformlblversion;
  frm.lblfirm.Caption := aboutformlblcopyright;
  frm.lbldeveloper.Caption := aboutformlbldeveloper;
  frm.lbldescription.Caption := aboutformlbldescription;
  frm.Caption := aboutformcaption;
  frm.ShowModal;
  frm.Free;
end;

procedure TForm1.menuaddfilesClick(Sender: TObject);
var
  frm: Tfrmcalculation;
  item: string;
begin
  OpenDialog1.FileName := '';
  OpenDialog1.InitialDir := GetEnvironmentVariable('USERPROFILE') + '\' + 'Desktop';
  OpenDialog1.Filter := filefilter;
  OpenDialog1.Title := filedialogtitle;
  OpenDialog1.FilterIndex := 0;
  OpenDialog1.Execute();
  if OpenDialog1.Files.Count <> 0 then
  begin
    frm := Tfrmcalculation.Create(Self);
    stlist := TStringList.Create;
    for item in OpenDialog1.Files do
    begin
      stlist.Add(item);
    end;
    frm.path := OpenDialog1.Files[0];
    frm.startindex := 2;
    frm.Position := poMainFormCenter;
    menulanguage.Enabled := false;
    frm.ShowModal;
    frm.Free;
    listcalc;
  end;

end;

procedure TForm1.menudeselectClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
  begin
    mylist1.Items[i].Selected := false;
  end;
  listcalc;
end;

procedure TForm1.contextdeleteClick(Sender: TObject);
var
  msg: Byte;
begin
  msg := Application.MessageBox(PWideChar(ctdel), PWideChar(contextdelete2), 36 + 256);
  if msg = 6 then
  begin
    mylist1.DeleteSelected;
  end;
  listcalc;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  reg: TRegistry;
  lang: string;
  theme, exportstr, fontstyle: string;
begin
  inherited;
  DragAcceptFiles(Self.Handle, true);
  SetOwnerDraw(true);
  reg := TRegistry.Create(KEY_READ);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if not reg.OpenKeyReadOnly('\Software\Extremitysoft\Hash Generator Free') then
    begin
      getdefaultlanguage;
    end
    else
    begin
      lang := reg.ReadString('Language');
      if lang = 'en' then
        changelanguage('en', 'en')
      else if lang = 'tr' then
        changelanguage('tr', 'tr')
      else
        getdefaultlanguage;
      theme := reg.ReadString('Theme');
      if LowerCase(theme).Trim = 'calypso' then
      begin
        TStyleManager.SetStyle('Calypso');
        thememenu1.Checked := true;
      end
      else if LowerCase(theme).Trim = 'flat ui light' then
      begin
        TStyleManager.SetStyle('Flat UI Light');
        thememenu2.Checked := true;
      end
      else if LowerCase(theme).Trim = 'glossy' then
      begin
        TStyleManager.SetStyle('Glossy');
        thememenu3.Checked := true;
      end
      else if LowerCase(theme).Trim = 'windows10' then
      begin
        TStyleManager.SetStyle('Windows10');
        thememenu4.Checked := true;
      end
      else if LowerCase(theme).Trim = 'windows10 clear day' then
      begin
        TStyleManager.SetStyle('Windows10 Clear Day');
        thememenu5.Checked := true;
      end
      else if LowerCase(theme).Trim = 'windows10 malibu' then
      begin
        TStyleManager.SetStyle('Windows10 Malibu');
        thememenu6.Checked := true;
      end
      else if LowerCase(theme).Trim = 'windows10 slategray' then
      begin
        TStyleManager.SetStyle('Windows10 SlateGray');
        thememenu7.Checked := true;
      end;
      Application.ProcessMessages;
      DragAcceptFiles(Handle,True);
      exportstr := reg.ReadString('Algorithms');
      exportstr := LowerCase(exportstr).Trim;
      if reg.ValueExists('Algorithms') = true then
      begin
        if exportstr.IndexOf('md2') >= 0 then
          algorithmmenumd2.Checked := true
          else
          algorithmmenumd2.Checked := false;
        if exportstr.IndexOf('md4') >= 0 then
          algorithmmenumd4.Checked := true
          else
          algorithmmenumd4.Checked := false;
        if exportstr.IndexOf('md5') >= 0 then
          algorithmmenumd5.Checked := true
          else
          algorithmmenumd5.Checked := false;
        if exportstr.IndexOf('sha1') >= 0 then
          algorithmmenusha1.Checked := true
          else
          algorithmmenusha1.Checked := false;
        if exportstr.IndexOf('sha224') >= 0 then
          algorithmmenusha224.Checked := true
          else
          algorithmmenusha224.Checked := false;
        if exportstr.IndexOf('sha256') >= 0 then
          algorithmmenusha256.Checked := true
          else
          algorithmmenusha256.Checked := false;
        if exportstr.IndexOf('sha384') >= 0 then
          algorithmmenusha384.Checked := true
          else
          algorithmmenusha384.Checked := false;
        if exportstr.IndexOf('sha512') >= 0 then
          algorithmmenusha512.Checked := true
          else
          algorithmmenusha512.Checked := false;
        if exportstr.IndexOf('shax') >= 0 then
          algorithmmenusha512_224.Checked := true
          else
          algorithmmenusha512_224.Checked := false;
        if exportstr.IndexOf('shay') >= 0 then
          algorithmmenusha512_256.Checked := true
          else
          algorithmmenusha512_256.Checked := false;
        if exportstr.IndexOf('crc16') >= 0 then
          algorithmmenucrc16.Checked := true
          else
          algorithmmenucrc16.Checked := false;
        if exportstr.IndexOf('crc32') >= 0 then
          algorithmmenucrc32.Checked := true
          else
          algorithmmenucrc32.Checked := false;
      end;

      if (algorithmmenumd2.Checked = false) and (algorithmmenumd4.Checked = false) and (algorithmmenumd5.Checked = false) and (algorithmmenusha1.Checked = false) and (algorithmmenusha224.Checked = false)
         and (algorithmmenusha256.Checked = false) and (algorithmmenusha384.Checked = false) and (algorithmmenusha512.Checked = false) and (algorithmmenucrc16.Checked = false) and (algorithmmenucrc32.Checked = false)
         and (algorithmmenusha512_224.Checked = false) and (algorithmmenusha512_256.Checked = false) then begin
        menuaddfolder.Enabled := false;
        menuaddfiles.Enabled := false;
        DragAcceptFiles(Self.Handle, false);
      end;


      if reg.ValueExists('Font Style') then
      begin
        fontstyle := reg.ReadString('Font Style');
        if LowerCase(fontstyle).Trim = 'uppercase' then
        begin
          menuuppercase.Checked := true;
          menuuppercase.Default := true;
        end
        else
        begin
          menulowercase.Checked := true;
          menulowercase.Default := true;
        end;
      end;
    reg.CloseKey;
    end;
  except on e: Exception do
    begin
      reg.Free;
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DragAcceptFiles(Self.Handle, false);
  inherited;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  frm: TfrmCalculation;
begin
  if ParamCount > 0 then begin
    if (ParamStr(1) = '/scan') and (FileExists(ParamStr(2))) then begin
      frm := Tfrmcalculation.Create(Self);
      stlist := TStringList.Create;
      stlist.Add(ParamStr(2));
      frm.path := ParamStr(2);
      frm.startindex := 2;
      frm.Position := poDesktopCenter;
      menulanguage.Enabled := false;
      frm.ShowModal;
      frm.Free;
    end;
  end;
end;

procedure TForm1.getdefaultlanguage;
var
  Ident: Integer;
  MyLang: PChar;
const
  Size: Integer = 250;
begin
  GetMem(MyLang, Size);
  Ident:=GetSystemDefaultLangID;
  VerLanguageName(Ident, MyLang, Size);
  if (StrPas(MyLang).IndexOf('T?rkiye') > -1) or (StrPas(MyLang).IndexOf('T?rk?e') > -1) then
  begin
    changelanguage('tr', 'default');
  end
  else
    changelanguage('en', 'default');
  FreeMem(MyLang);
end;

procedure TForm1.menuaddfolderClick(Sender: TObject);
var
  frm: Tfrmcalculation;
begin
  folderdialog := TBrowseForFolder.Create(Self);
  folderdialog.Caption := folderbrowsertitle;
  folderdialog.Folder := '';
  folderdialog.BrowseOptions := [bifNewDialogStyle];
  folderdialog.Execute;
  if folderdialog.Folder <> '' then
    begin
      path := folderdialog.Folder;
      frm := Tfrmcalculation.Create(Self);
      frm.path := path;
      frm.startindex := 1;
      frm.Position := poMainFormCenter;
      menulanguage.Enabled := false;
      frm.ShowModal;
      frm.Free;
      listcalc;
    end;
end;

procedure TForm1.menutexthashgeneratorClick(Sender: TObject);
var
  frm: TForm2;
begin
  frm := TForm2.Create(Self);
  frm.Position := poMainFormCenter;
  frm.lbltext.Caption := form2lbltext;
  frm.lblmd2.Caption := form2lblmd2;
  frm.lblmd4.Caption := form2lblmd4;
  frm.lblmd5.Caption := form2lblmd5;
  frm.lblsha1.Caption := form2lblsha1;
  frm.lblsha2_224.Caption := form2lblsha224;
  frm.lblsha2_256.Caption := form2lblsha256;
  frm.lblsha2_384.Caption := form2lblsha384;
  frm.lblsha2_512.Caption := form2lblsha512;
  frm.lblsha2_512224.Caption := form2lblsha512_224;
  frm.lblsha2_512256.Caption := form2lblsha512_256;
  frm.lblcrc16.Caption := form2lblcrc16;
  frm.lblcrc32.Caption := form2lblcrc32;
  frm.Caption := form2caption;
  frm.Show;
  //Application.MessageBox(PWideChar(mainforminfo), PWideChar(mainforminfotitle), 64);
end;

procedure TForm1.menuturkishClick(Sender: TObject);
begin
  changelanguage('tr', 'tr');
  menuturkish.Checked := true;
  menuturkish.Default := true;
  savesettings;
end;

procedure TForm1.menuuncheckallClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
  begin
    mylist1.Items[i].Checked := false;
  end;
  listcalc;
end;

procedure TForm1.menuuppercaseClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := true;
  TMenuItem(Sender).Default := true;
  savesettings;
end;

procedure TForm1.menuwebsiteClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('http://extremitysoft.com/'), '', nil, SW_MAXIMIZE);
end;

procedure TForm1.listcalc;
var
  adet, f: Integer;
begin
  adet := 0;
  if mylist1.Items.Count <> 0 then
  begin
    for f := 0 to mylist1.Items.Count - 1 do
    begin
      if Form1.mylist1.Items[f].Checked then
        adet := adet + 1;
    end;
    Form1.StatusBar1.Panels[1].Text := statustoplam + inttostr(Form1.mylist1.Items.Count) + statusisaretli + IntToStr(adet) + statussecili + IntToStr(Form1.mylist1.SelCount);
  end;
end;

procedure TForm1.mylist1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  listcalc;
end;

procedure TForm1.extportmenumd2Click(Sender: TObject);
begin
  if TMenuItem(Sender).Checked then
    TMenuItem(Sender).Checked := false
  else
    TMenuItem(Sender).Checked := true;
  savesettings;
end;

procedure TForm1.contextcopy1Click(Sender: TObject);
begin
  Clipboard.AsText := mylist1.Selected.SubItems[2];
  StatusBar1.Panels[2].Text := mylist1.Selected.SubItems[1] + statuscopyclipbrd;
  Timer1.Enabled := true;
end;


procedure TForm1.menuenglishClick(Sender: TObject);
begin
  changelanguage('en', 'en');
  menuenglish.Checked := true;
  menuenglish.Default := true;
  savesettings;
end;

procedure TForm1.menuexitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.menuforumClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('http://forum.extremitysoft.com/'), '', nil, SW_MAXIMIZE);
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin
  if mylist1.SelCount = 0 then
  begin
    menuclipboard.Enabled := false;
    menuselected.Enabled := false;
  end
  else
  begin
    menuclipboard.Enabled := true;
    menuselected.Enabled := true;
  end;
end;

procedure TForm1.savesettings;
var
  reg: TRegistry;
  metin: string;
begin
  reg := TRegistry.Create(KEY_WRITE);
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey('Software\Extremitysoft\Hash Generator Free', true);
    if menusystemdefault.Checked then
      reg.WriteString('Language', 'default')
    else if menuturkish.Checked then
      reg.WriteString('Language', 'tr')
    else
      reg.WriteString('Language', 'en');
    if thememenu1.Checked then
      reg.WriteString('Theme', 'Calypso')
    else if thememenu2.Checked then
      reg.WriteString('Theme', 'Flat UI Light')
    else if thememenu3.Checked then
      reg.WriteString('Theme', 'Glossy')
    else if thememenu4.Checked then
      reg.WriteString('Theme', 'Windows10')
    else if thememenu5.Checked then
      reg.WriteString('Theme', 'Windows10 Clear Day')
    else if thememenu6.Checked then
      reg.WriteString('Theme', 'Windows10 Malibu')
    else if thememenu7.Checked then
      reg.WriteString('Theme', 'Windows10 SlateGray');
    if algorithmmenumd2.Checked then
      metin := ',MD2' + metin;
    if algorithmmenumd4.Checked then
      metin := ',MD4' + metin;
    if algorithmmenumd5.Checked then
      metin := ',MD5' + metin;
    if algorithmmenusha1.Checked then
      metin := ',SHA1' + metin;
    if algorithmmenusha224.Checked then
      metin := ',SHA224' + metin;
    if algorithmmenusha256.Checked then
      metin := ',SHA256' + metin;
    if algorithmmenusha384.Checked then
      metin := ',SHA384' + metin;
    if algorithmmenusha512.Checked then
      metin := ',SHA512' + metin;
    if algorithmmenusha512_224.Checked then
      metin := ',SHAX' + metin;
    if algorithmmenusha512_256.Checked then
      metin := ',SHAY' + metin;
    if algorithmmenucrc16.Checked then
      metin := ',CRC16' + metin;
    if algorithmmenucrc32.Checked then
      metin := ',CRC32' + metin;
    metin := metin.Substring(1);
    reg.WriteString('Algorithms', metin);
    if menuuppercase.Checked then
      reg.WriteString('Font Style', 'uppercase')
      else
      reg.WriteString('Font Style', 'lowercase');
    reg.CloseKey;
  finally
    reg.Free;
  end;
end;

procedure TForm1.menusavewizardClick(Sender: TObject);
var
  frm: TfrmExport;
  i: Integer;
  status: Boolean;
begin
  status := false;
  if mylist1.Items.Count <> 0 then
  begin
    frm := TfrmExport.Create(Self);
    frm.Position := poMainFormCenter;
    for i := 0 to mylist1.Items.Count - 1 do
      begin
        if status = false then
          if mylist1.Items[i].Checked then
              status := true;
      end;
    if status = false then
      frm.radiocheckeditems.Enabled := false;
    frm.ShowModal;
  end
  else
    Application.MessageBox(PWideChar(msgemptylist), PWideChar(msgemptylist), 48);
  
end;

procedure TForm1.menuselectClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
  begin
    mylist1.Items[i].Selected := true;
  end;
  listcalc;
end;

procedure TForm1.menusystemdefaultClick(Sender: TObject);
begin
  getdefaultlanguage;
  menusystemdefault.Checked := true;
  menusystemdefault.Default := true;
  savesettings;
end;

procedure TForm1.SetOwnerDraw(Value: Boolean);
begin
  mylist1.OwnerDraw:=True;
  mylist1.OnDrawItem:=VclStylesOwnerDrawFix.ListViewDrawItem;
  mylist1.OnMouseDown:=VclStylesOwnerDrawFix.ListViewMouseDown;
end;

procedure TForm1.contextuncheckClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to mylist1.Items.Count - 1 do
    begin
      if mylist1.Items[i].Selected then
        mylist1.Items[i].Checked := false;
    end;
  listcalc;
end;

initialization
   //TStyleManager.Engine.RegisterStyleHook(TListView, TListViewStyleHookFix);

end.
