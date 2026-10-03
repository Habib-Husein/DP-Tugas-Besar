program Soal6;

uses crt;                                 { unit crt untuk clrscr }

const
  BOBOT_TUGAS = 30;    { bobot Nilai Tugas : 30% }
  BOBOT_UTS   = 30;    { bobot UTS         : 30% }
  BOBOT_UAS   = 40;    { bobot UAS         : 40% }
  NILAI_MIN   = 60;    { syarat Nilai Akhir minimal untuk lulus }
  HADIR_MIN   = 80;    { syarat Kehadiran minimal (%) untuk lulus }

var
  Tugas, UTS, UAS, Hadir: Real;   { data masukan }
  NilaiAkhir: Real;
  Indeks: Char;
  Lulus: Boolean;

{ Membaca satu nilai dan mengulang sampai berada pada rentang 0..100 }
function BacaNilai(Pesan: string): Real;
var
  X: Real;
begin
  repeat
    write(Pesan);
    readln(X);
    if (X < 0) or (X > 100) then
      writeln('Masukan harus antara 0 sampai 100. Silakan ulangi.');
  until (X >= 0) and (X <= 100);
  BacaNilai := X;
end;

{ Membaca seluruh data masukan }
procedure BacaData;
begin
  Tugas := BacaNilai('Nilai Tugas (0-100) : ');
  UTS   := BacaNilai('Nilai UTS (0-100)   : ');
  UAS   := BacaNilai('Nilai UAS (0-100)   : ');
  Hadir := BacaNilai('Kehadiran (0-100 %) : ');
end;

{ Menghitung Nilai Akhir = 30% Tugas + 30% UTS + 40% UAS.
  Dikalikan bobot bulat lalu dibagi 100 agar hasilnya akurat (tanpa 0.3 / 0.4). }
function HitungNilaiAkhir(T, U, S: Real): Real;
begin
  HitungNilaiAkhir := (T * BOBOT_TUGAS + U * BOBOT_UTS + S * BOBOT_UAS) / 100;
end;

{ Menentukan Indeks Huruf dengan if-else bertingkat.
  Dicek dari batas tertinggi, sehingga nilai berdesimal (misal 84.5) tetap tertangani. }
function TentukanIndeks(NA: Real): Char;
begin
  if NA >= 85 then
    TentukanIndeks := 'A'
  else if NA >= 75 then
    TentukanIndeks := 'B'
  else if NA >= 60 then
    TentukanIndeks := 'C'
  else if NA >= 50 then
    TentukanIndeks := 'D'
  else
    TentukanIndeks := 'E';
end;

{ LULUS jika Nilai Akhir >= 60 DAN Kehadiran >= 80% }
function StatusLulus(NA, Kehadiran: Real): Boolean;
begin
  StatusLulus := (NA >= NILAI_MIN) and (Kehadiran >= HADIR_MIN);
end;

{ Menampilkan hasil akhir beserta alasan jika tidak lulus }
procedure TampilkanHasil;
begin
  writeln;
  writeln('========== HASIL AKHIR ==========');
  writeln('Nilai Tugas (30%) : ', Tugas:0:2);
  writeln('Nilai UTS (30%)   : ', UTS:0:2);
  writeln('Nilai UAS (40%)   : ', UAS:0:2);
  writeln('Kehadiran         : ', Hadir:0:2, '%');
  writeln('---------------------------------');
  writeln('Nilai Akhir       : ', NilaiAkhir:0:2);
  writeln('Indeks Huruf      : ', Indeks);

  if Lulus then
    writeln('Status            : LULUS')
  else
  begin
    writeln('Status            : TIDAK LULUS');
    if NilaiAkhir < NILAI_MIN then
      writeln('Alasan            : Nilai Akhir kurang dari ', NILAI_MIN);
    if Hadir < HADIR_MIN then
      writeln('Alasan            : Kehadiran kurang dari ', HADIR_MIN, '%');
  end;
  writeln('=================================');
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== PENENTUAN NILAI AKHIR MATA KULIAH ===');
  BacaData;
  NilaiAkhir := HitungNilaiAkhir(Tugas, UTS, UAS);
  Indeks := TentukanIndeks(NilaiAkhir);
  Lulus := StatusLulus(NilaiAkhir, Hadir);
  TampilkanHasil;
end.