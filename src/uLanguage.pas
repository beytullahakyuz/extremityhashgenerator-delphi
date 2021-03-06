unit uLanguage;

interface

uses uMain, uCalculating, System.Classes;

procedure changelanguage(mylang, params: string);



var
  folderbrowsertitle: string  = 'L?tfen bir klas?r se?iniz...';
  filedialogtitle: string = 'L?tfen dosya(lar) se?iniz...';
  filefilter: string = 'T?m Dosyalar (*.*)|*.*|' + 'Metin Dosyalar? (*.txt,*.lang)|*.txt;*.lang|' + 'Resim Dosyalar? (*.jpg,*.jpe,*.png,*.jpeg,*.bmp,*.tiff,*.tif,*.psd)|*.jpg;*.jpe;*.png;*.jpeg;*.bmp;*.tiff;*.tif;*.psd|' +
                         'Ses Dosyalar? (*.mp3,*.ogg,*.wav,*.mp2)|*.mp3;*.ogg;*.wav;*.mp2|' + 'Vidyo Files (*.wmv,*.avi,*.mp4,*.3gp,*.mkv,*.mpeg,*.mov)|*.wmv;*.avi;*.mp4;*.3gp;*.mkv;*.mpeg;*.mov';
  msgclearlist: string = 'Listeyi temizle?';
  msgemptylist: string = 'Liste bo?.';
  statustoplam: string = 'Listedeki toplam ??e say?s?: ';
  statussecili: string = ', se?ili ??e say?s?: ';
  statusisaretli: string = ', i?aretli ??e say?s?: ';
  statuscopyclipbrd: string = '';
  statuslistempty: string = 'Listede ??e bulunmamaktad?r.';
  contextdelete: string = 'Se?ili ??eleri silmek istedi?inize emin misiniz?';
  ctdel: string = '';
  contextdelete2: string = 'Sil';
  form2caption: string;

  form3btnminimize, form3btncancel, form3btnmaximize, form3labelfilecount, form3labelfilename, form3labeldirectory: string;
  form3labelcalchash, form3lblstatus, form3lblfilecount, form3lblfiname, form3lbldirectory, form3lblcalchash: string;
  form3status1, form3status2: string;
  form3msgcancel, form3msgcancel2, form3caption: string;

  form4savedialogtitle, form4html, form4labellocation, form4btnsavesettings, form4btnsave, form4btncancel, form4caption: string;
  form4grup1, form4grup2, form4radiosaveall, form4radiosavechecked, form4labelcharset, form4labelsavetype, form4msgwrite: string;
  form4msgwritetitle: string;

  form2lbltext, form2lblmd2, form2lblmd4, form2lblmd5, form2lblsha1, form2lblsha224, form2lblsha256, form2lblsha384: string;
  form2lblsha512, form2lblsha512_224, form2lblsha512_256, form2lblcrc16, form2lblcrc32: string;

  aboutformlblversion, aboutformlbldescription, aboutformlbldeveloper, aboutformlblcopyright, aboutformcaption: string;

  mainforminfo, mainforminfotitle: string;

  charsetlist: TStringList;

implementation

procedure changelanguage(mylang, params: string);
begin
  charsetlist := TStringList.Create;
  charsetlist.Clear;
  if mylang = 'en' then
  begin
    Form1.mainmenu2.Caption := 'Edit';
    Form1.mainmenu3.Caption := 'Options';
    Form1.mainmenu4.Caption := 'Help';
    Form1.menuaddfolder.Caption := 'Add Folder';
    Form1.menuaddfiles.Caption := 'Add File(s)';
    Form1.menusavewizard.Caption := 'Save Wizard';
    Form1.menuexit.Caption := 'Exit';
    Form1.menuselect.Caption := 'Select All';
    Form1.menudeselect.Caption := 'Deselect All';
    Form1.menucheckall.Caption := 'Check All';
    Form1.menuuncheckall.Caption := 'Uncheck All';
    Form1.menuclearlist.Caption := 'Clear List';
    Form1.menutools.Caption := 'Tools';
    Form1.menutexthashgenerator.Caption := 'Text Hash Generator';
    Form1.menusettings.Caption := 'Settings';
    Form1.menulanguage.Caption := 'Language';
    Form1.menualgorithms.Caption := 'Algorithms';
    Form1.menusystemdefault.Caption := 'System Default';
    Form1.menuturkish.Caption := 'Turkish';
    Form1.menuenglish.Caption := 'English';
    Form1.menuthemes.Caption := 'Themes';
    Form1.menuabouthashgenerator.Caption := 'About';
    Form1.menuselected.Caption := 'Selected items';
    Form1.menuclipboard.Caption := 'Copy to clipboard';
    Form1.contextcheck.Caption := 'Check';
    Form1.contextuncheck.Caption := 'Uncheck';
    Form1.contextdelete.Caption := 'Delete';
    Form1.mylist1.Columns[0].Caption := 'File Name';
    Form1.mylist1.Columns[1].Caption := 'Location';
    Form1.mylist1.Columns[2].Caption := 'Algorithm';
    Form1.mylist1.Columns[3].Caption := 'Value';
    Form1.menufonttype.Caption := 'Font Style';
    Form1.menuuppercase.Caption := 'UpperCase';
    Form1.menulowercase.Caption := 'LowerCase';
    if params = 'default' then
      begin
        Form1.menusystemdefault.Checked := true;
        Form1.menusystemdefault.Default := true;
      end
      else
      begin
        Form1.menuenglish.Checked := true;
        Form1.menuenglish.Default := true;
      end;
    Form1.StatusBar1.Panels[0].Text := 'Status:';
    folderbrowsertitle := 'Please select a folder...';
    filedialogtitle := 'Please select a file(s)...';
    filefilter := 'All Files (*.*)|*.*|' + 'Text Files (*.txt,*.lang)|*.txt;*.lang|' + 'Image Files (*.jpg,*.jpe,*.png,*.jpeg,*.bmp,*.tiff,*.tif,*.psd)|*.jpg;*.jpe;*.png;*.jpeg;*.bmp;*.tiff;*.tif;*.psd|' +
                           'Audio Files (*.mp3,*.ogg,*.wav,*.mp2)|*.mp3;*.ogg;*.wav;*.mp2|' + 'Video Files (*.wmv,*.avi,*.mp4,*.3gp,*.mkv,*.mpeg,*.mov)|*.wmv;*.avi;*.mp4;*.3gp;*.mkv;*.mpeg;*.mov|' +
                            'Application Files (*.exe,*.dll,*.ocx,*.com,*.cmd,*.bat)|*.exe;*.dll;*.ocx;*.com;*.cmd;*.bat';
    msgclearlist := 'Clear List?';
    msgemptylist := 'List is empty';
    statustoplam := 'The count of items in the list: ';
    statusisaretli := ', the count of marked items: ';
    statussecili := ', lists of selected items: ';
    statuscopyclipbrd := ' value succesfully copied.';
    statuslistempty := 'There is no item in the list';
    contextdelete := 'Selected items Are you sure you want to delete?';
    contextdelete2  := 'Delete?';
    ctdel := 'Selected items Are you sure you want to delete?';
    form3btnminimize := 'Minimize';
    form3btnmaximize := 'Maximize';
    form3btncancel := 'Cancel';
    form3labelfilecount := 'File count:';
    form3labelfilename := 'File name:';
    form3labeldirectory := 'Directory:';
    form3labelcalchash := 'Calculated hash value:';
    form3status1 := 'Status: Calculating the number of files...';
    form3status2 := 'Status: Calculating hash values...';
    form3msgcancel := 'Are you sure want to cancel the process?';
    form3msgcancel2 := 'Cancel?';
    form3caption := 'Calculating... Please wait.';
    form4savedialogtitle := 'Please select a location...';
    form4labellocation := 'Location:';
    form4btnsavesettings := 'Save Settings';
    form4btnsave := 'Save';
    form4btncancel := 'Cancel';
    form4caption := 'Save Wizard';
    form4grup1 := 'Save settings';
    form4grup2 := 'Save options';
    form4html := 'HTML Document (*.html)|*.html|' + 'Rich Text Document (*.rtf)|*.rtf';
    form4radiosaveall := 'Save all';
    form4radiosavechecked := 'Save checked items';
    charsetlist.Add('big5 (Chinese Traditional - Big5)');
    charsetlist.Add('euc-kr (Korean - EUC)');
    charsetlist.Add('iso-8859-1 (Western Alphabet - ISO)');
    charsetlist.Add('iso-8859-2 (Central European Alphabet - ISO)');
    charsetlist.Add('iso-8859-3 (Latin 3 Alphabet - ISO)');
    charsetlist.Add('iso-8859-4 (Baltic Alphabet - ISO)');
    charsetlist.Add('iso-8859-5 (Cyrillic Alphabet - ISO)');
    charsetlist.Add('iso-8859-6 (Arabic Alphabet - ISO)');
    charsetlist.Add('iso-8859-7 (Greek Alphabet - ISO)');
    charsetlist.Add('iso-8859-8 (Hebrew Alphabet - ISO)');
    charsetlist.Add('koi8-r (Cyrillic Alphabet - KOI8-R)');
    charsetlist.Add('shift-jis (Japanese - Shift-JIS)');
    charsetlist.Add('x-euc (Japanese - EUC)');
    charsetlist.Add('utf-8 (Universal Alphabet - UTF-8)');
    form4labelcharset := 'Charset:';
    form4labelsavetype := 'Save type:';
    form4msgwrite := 'The list is saved successfully';
    form4msgwritetitle := 'Registration Information';
    aboutformlblversion := 'Version: 1.1';
    aboutformlbldescription := 'This program was developed by extremity software firm.'+ sLineBreak +'Free to use, copying and unauthorized distribution is prohibited.';
    aboutformlbldeveloper := 'Developer: Beytullah AKY?Z';
    aboutformlblcopyright := 'Copyright ? 2012 - 2021 Extremity Software';
    aboutformcaption := 'About';
    mainforminfo := 'Is under construction';
    mainforminfotitle := 'Information';
    form2lbltext := 'Text:';
    form2lblmd2 := 'MD2 hash value:';
    form2lblmd4 := 'MD4 hash value:';
    form2lblmd5 := 'MD5 hash value:';
    form2lblsha1 := 'SHA1 hash value:';
    form2lblsha224 := 'SHA2-224 hash value:';
    form2lblsha256 := 'SHA2-256 hash value:';
    form2lblsha384 := 'SHA2-384 hash value:';
    form2lblsha512 := 'SHA2-512 hash value:';
    form2lblsha512_224 := 'SHA2-512/224 hash value:';
    form2lblsha512_256 := 'SHA2-512/256 hash value:';
    form2lblcrc16 := 'CRC16 hash value:';
    form2lblcrc32 := 'CRC32 hash value:';
    form2caption := 'Text Hash Generator';
  end;
  if mylang = 'tr' then
  begin
    Form1.mainmenu2.Caption := 'D?zen';
    Form1.mainmenu3.Caption := 'Se?enekler';
    Form1.mainmenu4.Caption := 'Yard?m';
    Form1.menuaddfolder.Caption := 'Klas?r Ekle';
    Form1.menuaddfiles.Caption := 'Dosya(lar) Ekle';
    Form1.menusavewizard.Caption := 'Kaydetme Sihirbaz?';
    Form1.menuexit.Caption := '??k??';
    Form1.menuselect.Caption := 'T?m?n? Se?';
    Form1.menudeselect.Caption := 'T?m?n?n Se?imini Kald?r';
    Form1.menucheckall.Caption := 'T?m?n? ??aretle';
    Form1.menuuncheckall.Caption := 'T?m?n?n ??aretini Kald?r';
    Form1.menuclearlist.Caption := 'Listeyi Temizle';
    Form1.menutools.Caption := 'Ara?lar';
    Form1.menutexthashgenerator.Caption := 'Metin Hash Olu?turucu';
    Form1.menusettings.Caption := 'Ayarlar';
    Form1.menulanguage.Caption := 'Dil';
    Form1.menualgorithms.Caption := 'Algoritmalar';
    Form1.menusystemdefault.Caption := 'Sistem Varsay?lan';
    Form1.menuturkish.Caption := 'T?rk?e';
    Form1.menuenglish.Caption := '?ngilizce';
    Form1.menuthemes.Caption := 'Temalar';
    Form1.menuabouthashgenerator.Caption := 'Hakk?nda';
    Form1.menuselected.Caption := 'Se?ilen ??eleri';
    Form1.menuclipboard.Caption := 'Panoya kopyala';
    Form1.contextcheck.Caption := '??aretle';
    Form1.contextuncheck.Caption := '??aretlerini Kald?r';
    Form1.contextdelete.Caption := 'Sil';
    Form1.mylist1.Columns[0].Caption := 'Dosya Ad?';
    Form1.mylist1.Columns[1].Caption := 'Konum';
    Form1.mylist1.Columns[2].Caption := 'Algoritma';
    Form1.mylist1.Columns[3].Caption := 'De?er';
    Form1.menufonttype.Caption := 'Yaz? Stili';
    Form1.menuuppercase.Caption := 'B?y?k Harf';
    Form1.menulowercase.Caption := 'K???k Harf';
    if params = 'default' then
      begin
        Form1.menusystemdefault.Checked := true;
        Form1.menusystemdefault.Default := true;
      end
      else
      begin
        Form1.menuenglish.Checked := true;
        Form1.menuenglish.Default := true;
      end;
    Form1.StatusBar1.Panels[0].Text := 'Durum:';

    folderbrowsertitle := 'L?tfen bir klas?r se?iniz...';
    filedialogtitle := 'L?tfen dosya(lar) se?iniz...';
    filefilter := 'T?m Dosyalar (*.*)|*.*|' + 'Metin Dosyalar? (*.txt,*.lang)|*.txt;*.lang|' + 'Resim Dosyalar? (*.jpg,*.jpe,*.png,*.jpeg,*.bmp,*.tiff,*.tif,*.psd)|*.jpg;*.jpe;*.png;*.jpeg;*.bmp;*.tiff;*.tif;*.psd|' +
                           'Ses Dosyalar? (*.mp3,*.ogg,*.wav,*.mp2)|*.mp3;*.ogg;*.wav;*.mp2|' + 'Vidyo Files (*.wmv,*.avi,*.mp4,*.3gp,*.mkv,*.mpeg,*.mov)|*.wmv;*.avi;*.mp4;*.3gp;*.mkv;*.mpeg;*.mov|' +
                           'Uygulama Dosyalar? (*.exe,*.dll,*.ocx,*.com,*.cmd,*.bat)|*.exe;*.dll;*.ocx;*.com;*.cmd;*.bat';
    msgclearlist := 'Listeyi temizle?';
    msgemptylist := 'Liste bo?';
    statustoplam := 'Listedeki ??elerin say?s?: ';
    statusisaretli := ', i?aretli ??elerin say?s?: ';
    statussecili := ', se?ili ??elerin say?s?: ';
    statuscopyclipbrd := ' de?eri ba?ar?yla kopyaland?';
    statuslistempty := 'Listede ??e bulunmamaktad?r';
    contextdelete := 'Se?ili ??eleri silmek istedi?inize emin misiniz?';
    contextdelete2  := 'Sil?';
    ctdel := 'Se?ili ??eleri silmek istedi?inize emin misiniz?';
    form3btnminimize := 'K???lt';
    form3btnmaximize := 'B?y?lt';
    form3btncancel := '?ptal';
    form3labelfilecount := 'Dosya say?s?:';
    form3labelfilename := 'Dosya ad?:';
    form3labeldirectory := 'Dizin:';
    form3labelcalchash := 'Hesaplanan hash de?eri:';
    form3status1 := 'Durum: Dosya say?s? hesaplan?yor...';
    form3status2 := 'Durum: Hash de?erleri hesaplan?yor...';
    form3msgcancel := '??lemi iptal etmek istedi?inize emin misiniz?';
    form3msgcancel2 := '?ptal?';
    form3caption := 'Hesaplan?yor... L?tfen bekleyin.';
    form4savedialogtitle := 'L?tfen konum se?iniz...';
    form4labellocation := 'Konum:';
    form4btnsavesettings := 'Ayarlar? Kaydet';
    form4btnsave := 'Kaydet';
    form4btncancel := '?ptal';
    form4caption := 'Kaydetme Sihirbaz?';
    form4grup1 := 'Kaydetme ayarlar?';
    form4grup2 := 'Kaydetme se?enekleri';
    form4html := 'HTML Belgesi (*.html)|*.html|' + 'Zengin Metin Belgesi (*.rtf)|*.rtf';
    form4radiosaveall := 'T?m?n? kaydet';
    form4radiosavechecked := '??aretlenen ??eleri kaydet';
    charsetlist.Add('big5 (Geleneksel ?ince - Big5)');
    charsetlist.Add('euc-kr (Korece - EUC)');
    charsetlist.Add('iso-8859-1 (Bat? Alfabe - ISO)');
    charsetlist.Add('iso-8859-2 (Orta Avrupa Alfabe - ISO)');
    charsetlist.Add('iso-8859-3 (Latin 3 Alfabe - ISO)');
    charsetlist.Add('iso-8859-4 (Balt?k Alfabe - ISO)');
    charsetlist.Add('iso-8859-5 (Kiril Alfabesi - ISO)');
    charsetlist.Add('iso-8859-6 (Arap?a Alfabe - ISO)');
    charsetlist.Add('iso-8859-7 (Yunan Alfabesi - ISO)');
    charsetlist.Add('iso-8859-8 (?brani Alfabesi - ISO)');
    charsetlist.Add('koi8-r (Kiril Alfabesi - KOI8-R)');
    charsetlist.Add('shift-jis (Japonca - Shift-JIS)');
    charsetlist.Add('x-euc (Japonca - EUC)');
    charsetlist.Add('utf-8 (Evrensel Alfabe - UTF-8)');
    form4labelcharset := 'Karakter seti:';
    form4labelsavetype := 'Kay?t t?r?:';
    form4msgwrite := 'Listedeki ??eler ba?ar?yla kaydedildi.';
    form4msgwritetitle := 'Kay?t Bilgi';
    aboutformlblversion := 'S?r?m: 1.1';
    aboutformlbldescription := 'Bu program Extremity Software firmas? taraf?ndan geli?tirilmi?tir.' + sLineBreak + 'Kullan?m? ?cretsiz, kopyalanmas? ve izinsiz da??t?lmas? yasakt?r.';
    aboutformlbldeveloper := 'Geli?tirici: Beytullah AKY?Z';
    aboutformlblcopyright := 'Telif Hakk? ? 2012 - 2021 Extremity Software';
    aboutformcaption := 'Hakk?nda';
    mainforminfo := 'Yap?m a?amas?ndad?r';
    mainforminfotitle := 'Bilgi';
    form2lbltext := 'Metin:';
    form2lblmd2 := 'MD2 hash de?eri:';
    form2lblmd4 := 'MD4 hash de?eri:';
    form2lblmd5 := 'MD5 hash de?eri:';
    form2lblsha1 := 'SHA1 hash de?eri:';
    form2lblsha224 := 'SHA224 hash de?eri:';
    form2lblsha256 := 'SHA256 hash de?eri:';
    form2lblsha384 := 'SHA384 hash de?eri:';
    form2lblsha512 := 'SHA512 hash de?eri:';
    form2lblsha512_224 := 'SHA2-512/224 hash de?eri:';
    form2lblsha512_256 := 'SHA2-512/256 hash de?eri:';
    form2lblcrc16 := 'CRC16 hash de?eri:';
    form2lblcrc32 := 'CRC32 hash de?eri:';
    form2caption := 'Metin Hash Olu?turucu';
  end;
  Form1.listcalc;

end;
end.
