program Soal3;

uses crt;                                 { unit crt untuk clrscr }

var
  N: LongInt;          { batas atas deret }
  Kategori: LongInt;   { 1 = Ganjil, 2 = Genap }

{ Membaca N dan mengulang sampai nilainya valid (>= 1) }
procedure BacaN;
begin
  repeat
    write('Masukkan nilai N : ');
    readln(N);
    if N < 1 then
      writeln('N harus bilangan bulat positif (>= 1). Silakan ulangi.');
  until N >= 1;
end;

{ Membaca kategori deret dan mengulang sampai pilihannya 1 atau 2 }
procedure BacaKategori;
begin
  writeln('Kategori deret: 1 = Ganjil, 2 = Genap');
  repeat
    write('Pilih kategori (1/2) : ');
    readln(Kategori);
    if (Kategori <> 1) and (Kategori <> 2) then
      writeln('Pilihan tidak valid! Masukkan 1 atau 2.');
  until (Kategori = 1) or (Kategori = 2);
end;

{ Mengembalikan nama kategori untuk ditampilkan }
function NamaKategori(K: LongInt): string;
begin
  if K = 1 then
    NamaKategori := 'Ganjil'
  else
    NamaKategori := 'Genap';
end;

{ Menampilkan deret 1..N dengan while-do, disaring memakai continue }
procedure TampilkanDeret;
var
  I: LongInt;        { penghitung loop }
  Angka: LongInt;    { angka yang sedang diperiksa }
  Jumlah: LongInt;   { banyaknya angka yang berhasil ditampilkan }
begin
  writeln;
  writeln('Deret angka ', NamaKategori(Kategori), ' dari 1 sampai ', N,
          ' (tanpa kelipatan 5):');

  I := 1;
  Jumlah := 0;
  while I <= N do
  begin
    Angka := I;     { simpan angka yang sedang diperiksa }
    I := I + 1;     { increment SEBELUM continue agar tidak infinite loop }

    { Lewati angka yang tidak sesuai kategori }
    if (Kategori = 1) and (Angka mod 2 = 0) then
      continue;
    if (Kategori = 2) and (Angka mod 2 <> 0) then
      continue;

    { Lewati angka kelipatan 5 }
    if Angka mod 5 = 0 then
      continue;

    { Angka lolos semua penyaringan, tampilkan }
    write(Angka, ' ');
    Jumlah := Jumlah + 1;
  end;

  if Jumlah = 0 then
    writeln('(Tidak ada angka yang memenuhi syarat)')
  else
  begin
    writeln;        { akhiri baris deret }
    writeln('Jumlah angka yang ditampilkan : ', Jumlah);
  end;
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  BacaN;
  BacaKategori;
  TampilkanDeret;
end.