program Soal1;

uses crt;                                 { unit crt untuk clrscr }

const
  MAKS_BARANG = 100;                       { kapasitas maksimum jumlah barang }

var
  Harga: array[1..MAKS_BARANG] of Int64;   { menyimpan harga tiap barang }
  N: Integer;                              { jumlah barang yang dibeli }
  Total, Diskon, TotalBayar: Int64;
  PersenDiskon: Integer;

{ Membaca N dan mengulang sampai nilainya valid (1..MAKS_BARANG) }
procedure BacaJumlahBarang;
begin
  repeat
    write('Masukkan jumlah barang : ');
    readln(N);
    if (N < 1) or (N > MAKS_BARANG) then
      writeln('N harus antara 1 sampai ', MAKS_BARANG, '. Silakan ulangi.');
  until (N >= 1) and (N <= MAKS_BARANG);
end;

{ Menginput harga barang ke-1 sampai ke-N menggunakan for-to-do }
procedure BacaHarga;
var
  I: Integer;
begin
  writeln;
  for I := 1 to N do
  begin
    repeat
      write('Harga barang ke-', I, ' : Rp ');
      readln(Harga[I]);
      if Harga[I] < 0 then
        writeln('Harga tidak boleh negatif. Silakan ulangi.');
    until Harga[I] >= 0;
  end;
end;

{ Menjumlahkan seluruh harga menjadi Total Belanja }
procedure HitungTotal;
var
  I: Integer;
begin
  Total := 0;
  for I := 1 to N do
    Total := Total + Harga[I];
end;

{ Menentukan persentase diskon dengan if-else, lalu menghitung total bayar }
procedure HitungDiskon;
begin
  if Total < 100000 then
    PersenDiskon := 0
  else if Total < 500000 then
    PersenDiskon := 10
  else
    PersenDiskon := 20;

  Diskon := Total * PersenDiskon div 100;
  TotalBayar := Total - Diskon;
end;

{ Menampilkan struk belanja }
procedure TampilkanRincian;
var
  I: Integer;
begin
  writeln;
  writeln('========== RINCIAN BELANJA ==========');
  for I := 1 to N do
    writeln('Barang ke-', I, ' : Rp ', Harga[I]);
  writeln('-------------------------------------');
  writeln('Total Sebelum Diskon : Rp ', Total);
  writeln('Persentase Diskon    : ', PersenDiskon, '%');
  writeln('Besar Diskon         : Rp ', Diskon);
  writeln('Total Bayar Akhir    : Rp ', TotalBayar);
  writeln('=====================================');
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  BacaJumlahBarang;
  BacaHarga;
  HitungTotal;
  HitungDiskon;
  TampilkanRincian;
end.