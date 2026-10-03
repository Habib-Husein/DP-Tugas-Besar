program Soal4;

uses crt;                                 { unit crt untuk clrscr }

var
  Pilihan: LongInt;   { pilihan menu operasi }
  A, B: Real;         { operand untuk operasi bilangan real }
  P, Q: Int64;        { operand bulat khusus untuk DIV & MOD }
  Ulang: Char;        { jawaban Y/T dari pengguna }

{ Menampilkan menu operasi }
procedure TampilkanMenu;
begin
  writeln;
  writeln('========== KALKULATOR SEDERHANA ==========');
  writeln('1. Penjumlahan');
  writeln('2. Pengurangan');
  writeln('3. Perkalian');
  writeln('4. Pembagian Real');
  writeln('5. DIV & MOD');
  writeln('==========================================');
end;

{ Membaca pilihan menu dan mengulang sampai valid (1..5) }
procedure BacaPilihan;
begin
  repeat
    write('Pilih operasi (1-5) : ');
    readln(Pilihan);
    if (Pilihan < 1) or (Pilihan > 5) then
      writeln('Pilihan tidak valid! Masukkan angka 1 sampai 5.');
  until (Pilihan >= 1) and (Pilihan <= 5);
end;

{ Membaca dua operand bilangan real (untuk operasi 1 sampai 4) }
procedure BacaOperandReal;
begin
  write('Masukkan angka pertama : ');
  readln(A);
  write('Masukkan angka kedua   : ');
  readln(B);
end;

{ Membaca dua operand bilangan bulat (untuk operasi 5: DIV & MOD) }
procedure BacaOperandBulat;
begin
  writeln('(Operasi DIV & MOD memerlukan bilangan bulat)');
  write('Masukkan angka pertama : ');
  readln(P);
  write('Masukkan angka kedua   : ');
  readln(Q);
end;

{ Pembagian real, dengan penanganan pembagian oleh nol }
procedure Pembagian;
begin
  if B = 0 then
    writeln('Error: pembagian dengan nol tidak diperbolehkan!')
  else
    writeln('Hasil: ', A:0:2, ' / ', B:0:2, ' = ', (A / B):0:2);
end;

{ DIV dan MOD, dengan penanganan pembagi nol }
procedure DivDanMod;
begin
  if Q = 0 then
    writeln('Error: DIV dan MOD dengan nol tidak diperbolehkan!')
  else
  begin
    writeln('Hasil: ', P, ' DIV ', Q, ' = ', P div Q);
    writeln('Hasil: ', P, ' MOD ', Q, ' = ', P mod Q);
  end;
end;

{ Memilih operasi dengan case-of lalu menampilkan hasilnya }
procedure Hitung;
begin
  case Pilihan of
    1: writeln('Hasil: ', A:0:2, ' + ', B:0:2, ' = ', (A + B):0:2);
    2: writeln('Hasil: ', A:0:2, ' - ', B:0:2, ' = ', (A - B):0:2);
    3: writeln('Hasil: ', A:0:2, ' * ', B:0:2, ' = ', (A * B):0:2);
    4: Pembagian;
    5: DivDanMod;
  else
    writeln('Pilihan tidak dikenal.');
  end;
end;

{ Menanyakan apakah ingin menghitung lagi; hanya menerima Y/y/T/t }
procedure TanyaUlang;
var
  Jawab: string;
begin
  writeln;
  repeat
    write('Apakah ingin melakukan perhitungan lagi?(Y/T) : ');
    readln(Jawab);
    if Jawab <> '' then
      Ulang := Jawab[1]    { ambil huruf pertama jawaban }
    else
      Ulang := ' ';
    if not (Ulang in ['Y', 'y', 'T', 't']) then
      writeln('Jawaban tidak valid! Ketik Y atau T.');
  until Ulang in ['Y', 'y', 'T', 't'];
end;

{ Program utama: ulangi sampai pengguna menjawab T atau t }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== PROGRAM KALKULATOR ===');
  repeat
    TampilkanMenu;
    BacaPilihan;
    if Pilihan = 5 then
      BacaOperandBulat
    else
      BacaOperandReal;
    writeln;
    Hitung;
    TanyaUlang;
  until (Ulang = 'T') or (Ulang = 't');

  writeln;
  writeln('Terima kasih. Program selesai.');
end.