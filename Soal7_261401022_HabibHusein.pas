program Soal7;

uses crt;                                 { unit crt untuk clrscr }

const
  JAM_MAKS = 10;    { jika lama parkir > JAM_MAKS, berlaku tarif maksimal flat }

var
  Kode: Char;                                { kode kendaraan: M, K, atau B }
  Jam: LongInt;                              { lama parkir (jam) }
  NamaKendaraan: string;                     { nama jenis kendaraan }
  TarifAwal, TarifTambah, TarifMaks: Int64;  { tarif jam pertama, per jam berikutnya, flat }
  Biaya: Int64;                              { total biaya parkir }
  Flat: Boolean;                             { True jika tarif maksimal flat dipakai }

{ Membaca kode kendaraan; huruf kecil diterima, ulangi sampai M/K/B }
procedure BacaKode;
var
  S: string;
begin
  repeat
    write('Kode kendaraan (M=Mobil, K=Motor, B=Bus) : ');
    readln(S);
    if S <> '' then
      Kode := UpCase(S[1])      { ambil huruf pertama, jadikan huruf besar }
    else
      Kode := ' ';
    if not (Kode in ['M', 'K', 'B']) then
      writeln('Kode tidak valid! Masukkan M, K, atau B.');
  until Kode in ['M', 'K', 'B'];
end;

{ Membaca lama parkir dan mengulang sampai minimal 1 jam }
procedure BacaJam;
begin
  repeat
    write('Lama parkir (jam, minimal 1) : ');
    readln(Jam);
    if Jam < 1 then
      writeln('Lama parkir minimal 1 jam. Silakan ulangi.');
  until Jam >= 1;
end;

{ Menentukan nama dan tarif sesuai kode kendaraan dengan case-of }
procedure AturTarif;
begin
  case Kode of
    'M': begin                       { Mobil }
           NamaKendaraan := 'Mobil';
           TarifAwal     := 5000;
           TarifTambah   := 3000;
           TarifMaks     := 30000;
         end;
    'K': begin                       { Motor }
           NamaKendaraan := 'Motor';
           TarifAwal     := 2000;
           TarifTambah   := 1000;
           TarifMaks     := 10000;
         end;
    'B': begin                       { Bus }
           NamaKendaraan := 'Bus';
           TarifAwal     := 10000;
           TarifTambah   := 5000;
           TarifMaks     := 50000;
         end;
  end;
end;

{ Menghitung biaya: tarif flat jika > JAM_MAKS, selain itu jam pertama + tambahan }
procedure HitungBiaya;
begin
  if Jam > JAM_MAKS then
  begin
    Biaya := TarifMaks;
    Flat := True;
  end
  else
  begin
    Biaya := TarifAwal + (Jam - 1) * TarifTambah;
    Flat := False;
  end;
end;

{ Menampilkan struk parkir }
procedure TampilkanStruk;
begin
  writeln;
  writeln('========== STRUK PARKIR ==========');
  writeln('Jenis Kendaraan : ', NamaKendaraan);
  writeln('Lama Parkir     : ', Jam, ' jam');
  writeln('----------------------------------');
  if Flat then
  begin
    writeln('Lama parkir > ', JAM_MAKS, ' jam, berlaku tarif maksimal flat.');
    writeln('Tarif Maksimal Flat : Rp ', TarifMaks);
  end
  else
  begin
    writeln('Tarif Jam Pertama   : Rp ', TarifAwal);
    writeln('Tarif Tambahan      : ', Jam - 1, ' jam x Rp ', TarifTambah,
            ' = Rp ', (Jam - 1) * TarifTambah);
  end;
  writeln('----------------------------------');
  writeln('Total Biaya Parkir  : Rp ', Biaya);
  writeln('==================================');
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== PERHITUNGAN TARIF PARKIR ===');
  BacaKode;
  BacaJam;
  AturTarif;
  HitungBiaya;
  TampilkanStruk;
end.