program Soal2;

uses crt;                                 { unit crt untuk clrscr }

const
  KATA_SANDI_RAHASIA = 'KamuNanya';   { kata sandi yang tersimpan secara internal }
  MAKS_PERCOBAAN     = 3;             { kesempatan maksimal login }

var
  Masukan: string;       { kata sandi yang diketik pengguna }
  Percobaan: Integer;    { penghitung percobaan login }
  Berhasil: Boolean;     { penanda apakah login sukses }

{ Memeriksa apakah kata sandi yang dimasukkan sama dengan kata sandi rahasia }
function KataSandiBenar(Teks: string): Boolean;
begin
  KataSandiBenar := (Teks = KATA_SANDI_RAHASIA);
end;

{ Proses login: maksimal 3 kali percobaan dengan repeat-until dan break }
procedure ProsesLogin;
begin
  Percobaan := 0;
  Berhasil := False;

  repeat
    Percobaan := Percobaan + 1;
    write('Percobaan ', Percobaan, ' dari ', MAKS_PERCOBAAN,
          ' - Masukkan kata sandi: ');
    readln(Masukan);

    if KataSandiBenar(Masukan) then
    begin
      Berhasil := True;
      writeln('Login Berhasil! Selamat Datang');
      break;                           { hentikan loop begitu sandi benar }
    end
    else if Percobaan < MAKS_PERCOBAAN then
      writeln('Kata sandi salah! Sisa kesempatan: ', MAKS_PERCOBAAN - Percobaan);
  until Percobaan >= MAKS_PERCOBAAN;   { berhenti setelah 3 kali percobaan }
end;

{ Program utama }
begin
  clrscr;                                { bersihkan layar saat program dimulai }
  writeln('=== SISTEM LOGIN ===');
  ProsesLogin;

  { Jika loop selesai tanpa berhasil, akun dikunci }
  if not Berhasil then
    writeln('Akses Ditolak! Akun Terkunci.');
end.