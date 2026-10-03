program Soal10;

uses crt;                                 { unit crt untuk clrscr }

var
  Nomor: LongInt;    { nomor hari yang dimasukkan pengguna }

{ Menampilkan nama hari sesuai nomor dengan case-of.
  1 = Senin, 2 = Selasa, ..., 7 = Minggu }
procedure TampilkanHari(N: LongInt);
begin
  case N of
    1: writeln('Hari Senin');
    2: writeln('Hari Selasa');
    3: writeln('Hari Rabu');
    4: writeln('Hari Kamis');
    5: writeln('Hari Jumat');
    6: writeln('Hari Sabtu');
    7: writeln('Hari Minggu');
  else
    { input di luar rentang 1..7 }
    writeln('Input tidak valid! Masukkan angka 1 sampai 7.');
  end;
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== NAMA HARI ===');
  write('Input (1-7) : ');
  readln(Nomor);
  write('Output      : ');
  TampilkanHari(Nomor);
end.