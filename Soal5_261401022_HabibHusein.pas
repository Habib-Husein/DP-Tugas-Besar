program Soal5;

uses crt;                                 { unit crt untuk clrscr }

const
  MAKS_MHS    = 50;    { kapasitas maksimum jumlah mahasiswa }
  BATAS_LULUS = 65;    { rata-rata minimal untuk dinyatakan LULUS }

var
  M, N: Integer;                           { M = jumlah mahasiswa, N = jumlah tugas }
  RataRata: array[1..MAKS_MHS] of Real;    { rata-rata nilai tiap mahasiswa }
  JumlahLulus, JumlahTidakLulus: Integer;

{ Membaca M dan mengulang sampai nilainya valid (1..MAKS_MHS) }
procedure BacaM;
begin
  repeat
    write('Masukkan jumlah mahasiswa : ');
    readln(M);
    if (M < 1) or (M > MAKS_MHS) then
      writeln('M harus antara 1 sampai ', MAKS_MHS, '. Silakan ulangi.');
  until (M >= 1) and (M <= MAKS_MHS);
end;

{ Membaca N dan mengulang sampai nilainya valid (>= 1) }
procedure BacaN;
begin
  repeat
    write('Masukkan jumlah tugas   : ');
    readln(N);
    if N < 1 then
      writeln('N harus minimal 1. Silakan ulangi.');
  until N >= 1;
end;

{ Input nilai dengan nested for-do:
  loop luar = mahasiswa ke-1..M, loop dalam = tugas ke-1..N }
procedure InputNilai;
var
  I, J: Integer;
  Nilai, Jumlah: LongInt;
begin
  for I := 1 to M do
  begin
    writeln;
    writeln('--- Mahasiswa ke-', I, ' ---');
    Jumlah := 0;                           { reset jumlah untuk tiap mahasiswa }

    for J := 1 to N do
    begin
      { Validasi: nilai harus 0..100 }
      repeat
        write('Nilai tugas ke-', J, ' : ');
        readln(Nilai);
        if (Nilai < 0) or (Nilai > 100) then
          writeln('Nilai harus 0 sampai 100. Silakan ulangi.');
      until (Nilai >= 0) and (Nilai <= 100);

      Jumlah := Jumlah + Nilai;            { akumulasi nilai tugas }
    end;

    RataRata[I] := Jumlah / N;             { rata-rata mahasiswa ke-I }
  end;
end;

{ Menentukan kelulusan: rata-rata >= 65 }
function Lulus(R: Real): Boolean;
begin
  Lulus := (R >= BATAS_LULUS);
end;

{ Menampilkan rata-rata tiap mahasiswa dan menghitung total LULUS / TIDAK LULUS }
procedure TampilkanRekap;
var
  I: Integer;
begin
  JumlahLulus := 0;
  JumlahTidakLulus := 0;

  writeln;
  writeln('========== REKAPITULASI NILAI ==========');
  for I := 1 to M do
  begin
    write('Mahasiswa ke-', I, ' : rata-rata ', RataRata[I]:0:2, ' -> ');
    if Lulus(RataRata[I]) then
    begin
      writeln('LULUS');
      JumlahLulus := JumlahLulus + 1;
    end
    else
    begin
      writeln('TIDAK LULUS');
      JumlahTidakLulus := JumlahTidakLulus + 1;
    end;
  end;
  writeln('----------------------------------------');
  writeln('Total mahasiswa LULUS       : ', JumlahLulus);
  writeln('Total mahasiswa TIDAK LULUS : ', JumlahTidakLulus);
  writeln('========================================');
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  BacaM;
  BacaN;
  InputNilai;
  TampilkanRekap;
end.