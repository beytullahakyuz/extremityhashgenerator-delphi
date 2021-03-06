unit uFunctions;


interface

  function SHA1FromFile(const FileName: string): string;
  function SHA224FromFile(const FileName: string): string;
  function SHA256FromFile(const FileName: string): string;
  function SHA384FromFile(const FileName: string): string;
  function SHA512FromFile(const FileName: string): string;
  function SHA512_224FromFile(const FileName: string): string;
  function SHA512_256FromFile(const FileName: string): string;
  function MD1FromFile(const FileName: string): string;
  function MD2FromFile(const FileName: string): string;
  function MD4FromFile(const FileName: string): string;
  function MD5FromFile(const FileName: string): string;
  function CRC16FromFile(const FileName: string): string;
  function CRC32FromFile(const FileName: string): string;
  function MD2FromString(const str: string): string;
  function MD4FromString(const str: string): string;
  function MD5FromString(const str: string): string;
  function SHA1FromString(const str: string): string;
  function SHA224FromString(const str: string): string;
  function SHA256FromString(const str: string): string;
  function SHA512_224FromString(const str: string): string;
  function SHA512_256FromString(const str: string): string;
  function SHA384FromString(const str: string): string;
  function SHA512FromString(const str: string): string;
  function CRC16FromString(const str: string): string;
  function CRC32FromString(const str: string): string;

implementation

uses
  IdHashCRC,
  IdSSLOpenSSL,
  IdHashSHA,
  IdHashMessageDigest,
  System.Classes, System.SysUtils, System.Hash;

function SHA1FromFile(const FileName: string): string;
var
  LSHA1: TIdHashSHA1;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LSHA1 := TIdHashSHA1.Create;
    try
      Result := LSHA1.HashStreamAsHex(LStream);
    finally
      LSHA1.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function SHA224FromFile(const FileName: string): string;
var
  LSHA224: THashSHA2;
begin
  try
    LSHA224 := THashSHA2.Create;
    try
      Result := LSHA224.GetHashStringFromFile(FileName, SHA224);
    finally
    end;
  finally
  end;
end;


function SHA256FromFile(const FileName: string): string;
var
  LSHA256: THashSHA2;
begin
  try
    LSHA256 := THashSHA2.Create;
    try
      Result := LSHA256.GetHashStringFromFile(FileName, SHA256);
    finally
    end;
  finally
  end;
end;

function SHA384FromFile(const FileName: string): string;
var
  LSHA384: THashSHA2;
begin
  try
    LSHA384 := THashSHA2.Create;
    try
      Result := LSHA384.GetHashStringFromFile(FileName, SHA384);
    finally
    end;
  finally
  end;
end;

function SHA512FromFile(const FileName: string): string;
var
  LSHA512: THashSHA2;
begin
  try
    LSHA512 := THashSHA2.Create;
    try
      Result := LSHA512.GetHashStringFromFile(FileName, SHA512);
    finally
    end;
  finally
  end;
end;

function SHA512_224FromFile(const FileName: string): string;
var
  LSHA512: THashSHA2;
begin
  try
    LSHA512 := THashSHA2.Create;
    try
      Result := LSHA512.GetHashStringFromFile(FileName, SHA512_224);
    finally
    end;
  finally
  end;
end;

function SHA512_256FromFile(const FileName: string): string;
var
  LSHA512: THashSHA2;
begin
  try
    LSHA512 := THashSHA2.Create;
    try
      Result := LSHA512.GetHashStringFromFile(FileName, SHA512_256);
    finally
    end;
  finally
  end;
end;

function MD1FromFile(const FileName: string): string;
var
  LMD1: TIdHashMessageDigest;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LMD1 := TIdHashMessageDigest.Create;
    try
      Result := LMD1.HashStreamAsHex(LStream);
    finally
      LMD1.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function MD2FromFile(const FileName: string): string;
var
  LMD2: TIdHashMessageDigest2;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LMD2 := TIdHashMessageDigest2.Create;
    try
      Result := LMD2.HashStreamAsHex(LStream);
    finally
      LMD2.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function MD4FromFile(const FileName: string): string;
var
  LMD4: TIdHashMessageDigest4;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LMD4 := TIdHashMessageDigest4.Create;
    try
      Result := LMD4.HashStreamAsHex(LStream);
    finally
      LMD4.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function MD5FromFile(const FileName: string): string;
var
  LMD5: TIdHashMessageDigest5;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LMD5 := TIdHashMessageDigest5.Create;
    try
      Result := LMD5.HashStreamAsHex(LStream);
    finally
      LMD5.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function CRC16FromFile(const FileName: string): string;
var
  LCRC16: TIdHashCRC16;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LCRC16 := TIdHashCRC16.Create;
    try
      Result := LCRC16.HashStreamAsHex(LStream);
    finally
      LCRC16.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function CRC32FromFile(const FileName: string): string;
var
  LCRC32: TIdHashCRC32;
  LStream : TFileStream;
begin
  LStream:=TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    LCRC32 := TIdHashCRC32.Create;
    try
      Result := LCRC32.HashStreamAsHex(LStream);
    finally
      LCRC32.Free;
    end;
  finally
    LStream.Free;
  end;
end;

function MD2FromString(const str: string): string;
var
  hash: TIdHashMessageDigest2;
begin
  hash := TIdHashMessageDigest2.Create;
  Result := hash.HashStringAsHex(str);

end;

function MD4FromString(const str: string): string;
var
  hash: TIdHashMessageDigest4;
begin
  hash := TIdHashMessageDigest4.Create;
  Result := hash.HashStringAsHex(str);
end;

function MD5FromString(const str: string): string;
var
  hash: TIdHashMessageDigest5;
begin
  hash := TIdHashMessageDigest5.Create;
  Result := hash.HashStringAsHex(str);
end;

function SHA1FromString(const str: string): string;
var
  hash: TIdHashSHA1;
begin
  hash := TIdHashSHA1.Create;
  Result := hash.HashStringAsHex(str);
end;

function SHA224FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA224);
end;

function SHA256FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA256);
end;

function SHA384FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA384);
end;

function SHA512FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA512);
end;

function SHA512_224FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA512_224);
end;

function SHA512_256FromString(const str: string): string;
var
  hash: THashSHA2;
begin
  hash := THashSHA2.Create;
  hash.GetHashString(str);
  Result := hash.GetHashString(str, SHA512_256);
end;

function CRC16FromString(const str: string): string;
var
  hash: TIdHashCRC16;
begin
  hash := TIdHashCRC16.Create;
  Result := hash.HashStringAsHex(str);
end;

function CRC32FromString(const str: string): string;
var
  hash: TIdHashCRC32;
begin
  hash := TIdHashCRC32.Create;
  Result := hash.HashStringAsHex(str);
end;

end.
