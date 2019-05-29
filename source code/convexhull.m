function [CH] = convexhull2(Kontur)
% CONVEXHULL Digunakan untuk mendapatkan convex hull
% dari suatu objek menggunakan metode 'Graham Scan'.
% Masukan: Kontur = kontur objek, yamg berdimensi dua
% dengan kolom pertama berisi data Y dan
% kolom kedua berisi data X.
% Keluaran: CH = Convex hull
jum = length(Kontur);
% Cari titik jangkar atau pivot
terkecil = 1;
for i=2 : jum
 if Kontur(i,1) == Kontur(terkecil, 1)
 if Kontur(i,2) < Kontur(terkecil, 2)
   terkecil = i;
 else
 if Kontur(i,1) < Kontur(terkecil, 1)
 terkecil = i;
 end
 end
 end
end
% Susun data dengan menyertakan sudut dan panjang,
% kecuali titik dengan posisi = terkecil
indeks = 0;
for i=1 : jum
 if i == terkecil
 continue;
 end

 indeks = indeks + 1;
 Piksel(indeks).y = Kontur(i, 1);
 Piksel(indeks).x = Kontur(i, 2);
 Piksel(indeks).sudut = sudut(Kontur(terkecil,:), ...
 Kontur(i,:));
 Piksel(indeks).jarak = jarak(Kontur(terkecil,:), ...
 Kontur(i,:));
end
jum_piksel = indeks;
% Lakukan pengurutan menurut sudut dan jarak
for p = 2: jum_piksel
 x = Piksel(p);
 % Sisipkan x ke dalam data[1..p-1]
 q = p - 1;
 ketemu = 0;
 while ((q >= 1) && (~ketemu))
 if x.sudut < Piksel(q).sudut
 Piksel(q+1) = Piksel(q);
 q = q - 1;
 else
 ketemu = 1;
 end
 Piksel(q+1) = x;
 end
end
% Kalau ada sejumlah piksel dengan nilai sudut sama
% maka hanya yang jaraknya terbesar yang akan
% dipertahankan
Piksel = unik(Piksel);
jum_piksel = length(Piksel);
% Siapkan tumpukan
H = [];
top = 0;
% Proses pemindaian
% Mula-mula sisipkan dua titik
top = top + 1;
H(top).y = Kontur(terkecil, 1);
H(top).x = Kontur(terkecil, 2);
top = top + 1;
H(top).y = Piksel(1).y;
H(top).x = Piksel(1).x;
i=2;
while i <= jum_piksel
 titik.x = Piksel(i).x;
 titik.y = Piksel(i).y;
 % Ambil dua data pertama pada tumpukan H
 % tanpa membuangnya

 A.x = H(top).x;
 A.y = H(top).y;

 B.x = H(top-1).x;
 B.y = H(top-1).y;

 if berputar_ke_kanan(A, B, titik)
 % Pop data pada tumpukan H
 top = top - 1;
 else
 % Tumpuk titik ke tumpukan H
 top = top + 1;
 H(top).x = titik.x;
 H(top).y = titik.y;

 i=i+1;
 end
end
% Ambil data dari tumpukan H
C = [];
indeks = 0;
while top ~= 0
 indeks = indeks + 1;

 % Pop data dari tumpukan H
 C(indeks,2) = H(top).x;
 C(indeks,1) = H(top).y;
 top = top - 1;
end
% Balik urutannya
for i=1 : indeks
 CH(indeks+1-i,1) = C(i,1);
 CH(indeks+1-i,2) = C(i,2);
end
function [s] = sudut(T1, T2)
dy = T1(1,1)-T2(1,1);
dx = T1(1,2)-T2(1,2);
if dx == 0
  dx = 0.00000001;
end
s = atan(dy / dx);
if s < 0
 s = s + pi;
end
function [j] = jarak(T1, T2)
j = (T1(1,1)-T2(1,1))^2 + (T1(1,2)-T2(1,2))^2;

function [stat] = berputar_ke_kanan(p1, p2, p3)
 stat = ((p2.x - p1.x) * (p3.y - p1.y) - ...
 (p3.x - p1.x) * (p2.y - p1.y)) > 0;
function [P] = unik(Piksel)
jum = length(Piksel);
sudut = -1;
% Tandai jarak dengan -1
% kalau titik tidak terpakai
for i=1 : jum
 if sudut ~= Piksel(i).sudut
 sudut = Piksel(i).sudut;
 jarak = Piksel(i).jarak;
 else
 if jarak < Piksel(i).jarak
 Piksel(i).jarak = -1;
 end
 end
end
indeks = 0;
for i=1 : jum
 if Piksel(i).jarak ~= -1
 indeks = indeks + 1;
 P(indeks) = Piksel(i);
 end
end
