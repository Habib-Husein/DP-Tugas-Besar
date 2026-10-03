program Soal9;

uses crt;                                 { unit crt untuk clrscr }

var
  Tahun, Bulan: LongInt;    { masukan pengguna }
  Kabisat: Boolean;         { True jika Tahun adalah tahun kabisat }
  Hasil: LongInt;           { jumlah hari pada bulan yang dipilih }

{ Membaca tahun dan mengulang sampai nilainya valid (>= 1) }
procedure BacaTahun;
begin
  repeat
    write('Masukkan tahun        : ');
    readln(Tahun);
    if Tahun < 1 then
      writeln('Tahun harus bilangan bulat positif (>= 1). Silakan ulangi.');
  until Tahun >= 1;
end;

{ Membaca nomor bulan dan mengulang sampai berada pada rentang 1..12 }
procedure BacaBulan;
begin
  repeat
    write('Masukkan bulan (1-12) : ');
    readln(Bulan);
    if (Bulan < 1) or (Bulan > 12) then
      writeln('Bulan harus antara 1 sampai 12. Silakan ulangi.');
  until (Bulan >= 1) and (Bulan <= 12);
end;

{ Cek tahun kabisat memakai operator mod:
  habis dibagi 400, ATAU habis dibagi 4 tetapi tidak habis dibagi 100 }
function CekKabisat(T: LongInt): Boolean;
begin
  CekKabisat := (T mod 400 = 0) or ((T mod 4 = 0) and (T mod 100 <> 0));
end;

{ Menentukan jumlah hari pada bulan B; K menandakan tahun kabisat }
function JumlahHari(B: LongInt; K: Boolean): LongInt;
begin
  case B of
    1, 3, 5, 7, 8, 10, 12:        { bulan berumur 31 hari }
      JumlahHari := 31;
    4, 6, 9, 11:                  { bulan berumur 30 hari }
      JumlahHari := 30;
    2:                            { Februari: tergantung kabisat atau tidak }
      begin
        if K then
          JumlahHari := 29
        else
          JumlahHari := 28;
      end;
  else
    JumlahHari := 0;
  end;
end;

{ Mengembalikan nama bulan untuk ditampilkan }
function NamaBulan(B: LongInt): string;
begin
  case B of
    1:  NamaBulan := 'Januari';
    2:  NamaBulan := 'Februari';
    3:  NamaBulan := 'Maret';
    4:  NamaBulan := 'April';
    5:  NamaBulan := 'Mei';
    6:  NamaBulan := 'Juni';
    7:  NamaBulan := 'Juli';
    8:  NamaBulan := 'Agustus';
    9:  NamaBulan := 'September';
    10: NamaBulan := 'Oktober';
    11: NamaBulan := 'November';
    12: NamaBulan := 'Desember';
  else
    NamaBulan := '';
  end;
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== JUMLAH HARI DALAM BULAN ===');
  BacaTahun;
  BacaBulan;

  Kabisat := CekKabisat(Tahun);
  Hasil := JumlahHari(Bulan, Kabisat);

  writeln;
  if Kabisat then
    writeln('Tahun ', Tahun, ' adalah tahun kabisat.')
  else
    writeln('Tahun ', Tahun, ' bukan tahun kabisat.');
  writeln('Bulan ', NamaBulan(Bulan), ' ', Tahun, ' memiliki ', Hasil, ' hari.');
end.