program Soal8;

uses crt;                                 { unit crt untuk clrscr }

const
  JAM_STANDAR     = 40;       { jam kerja standar per minggu }
  TARIF_LEMBUR    = 20000;    { upah lembur per jam }
  BATAS_BONUS     = 50;       { total jam kerja yang memicu bonus Golongan C }
  NILAI_BONUS     = 100000;   { besar bonus Golongan C }
  JAM_MAKS_MINGGU = 168;      { jumlah jam dalam satu minggu (7 x 24) }

var
  Golongan: Char;                             { golongan karyawan: A, B, atau C }
  JamKerja: LongInt;                          { total jam kerja per minggu }
  JamLembur: LongInt;                         { jam kerja di atas standar }
  GajiPokok, Lembur, Bonus, TotalGaji: Int64;

{ Membaca golongan; huruf kecil diterima, ulangi sampai A/B/C }
procedure BacaGolongan;
var
  S: string;
begin
  repeat
    write('Golongan (A/B/C)          : ');
    readln(S);
    if S <> '' then
      Golongan := UpCase(S[1])
    else
      Golongan := ' ';
    if not (Golongan in ['A', 'B', 'C']) then
      writeln('Golongan tidak valid! Masukkan A, B, atau C.');
  until Golongan in ['A', 'B', 'C'];
end;

{ Membaca total jam kerja dan mengulang sampai berada pada rentang 0..168 }
procedure BacaJamKerja;
begin
  repeat
    write('Total jam kerja per minggu : ');
    readln(JamKerja);
    if (JamKerja < 0) or (JamKerja > JAM_MAKS_MINGGU) then
      writeln('Jam kerja harus antara 0 sampai ', JAM_MAKS_MINGGU,
              '. Silakan ulangi.');
  until (JamKerja >= 0) and (JamKerja <= JAM_MAKS_MINGGU);
end;

{ Menentukan gaji pokok sesuai golongan dengan case-of }
function HitungGajiPokok(G: Char): Int64;
begin
  case G of
    'A': HitungGajiPokok := 1500000;
    'B': HitungGajiPokok := 2000000;
    'C': HitungGajiPokok := 2500000;
  else
    HitungGajiPokok := 0;
  end;
end;

{ Menghitung jam lembur: kelebihan di atas 40 jam }
function HitungJamLembur(Jam: LongInt): LongInt;
begin
  if Jam > JAM_STANDAR then
    HitungJamLembur := Jam - JAM_STANDAR
  else
    HitungJamLembur := 0;
end;

{ Bonus hanya untuk Golongan C dengan total jam kerja > 50 }
function HitungBonus(G: Char; Jam: LongInt): Int64;
begin
  if (G = 'C') and (Jam > BATAS_BONUS) then
    HitungBonus := NILAI_BONUS
  else
    HitungBonus := 0;
end;

{ Menampilkan slip gaji }
procedure TampilkanSlip;
begin
  writeln;
  writeln('============ SLIP GAJI ============');
  writeln('Golongan           : ', Golongan);
  writeln('Jam Kerja          : ', JamKerja, ' jam (lembur ', JamLembur, ' jam)');
  writeln('-----------------------------------');
  writeln('Gaji Pokok         : Rp ', GajiPokok);
  writeln('Lembur             : Rp ', Lembur);
  writeln('Bonus              : Rp ', Bonus);
  writeln('-----------------------------------');
  writeln('Total Gaji Akhir   : Rp ', TotalGaji);
  writeln('===================================');
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== PERHITUNGAN GAJI KARYAWAN ===');
  BacaGolongan;
  BacaJamKerja;

  GajiPokok := HitungGajiPokok(Golongan);
  JamLembur := HitungJamLembur(JamKerja);
  Lembur    := JamLembur * TARIF_LEMBUR;
  Bonus     := HitungBonus(Golongan, JamKerja);
  TotalGaji := GajiPokok + Lembur + Bonus;

  TampilkanSlip;
end.