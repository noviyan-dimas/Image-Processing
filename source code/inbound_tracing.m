function [Kontur] = inbound_tracing(BW)
% INBOUND_TRACING Memperoleh kontur yang telah terurutkan
% dengan menggunakan algoritma pelacakan kontur Moore
[jum_baris, jum_kolom] = size(BW);
% Peroleh piksel awal
selesai = false;
for p = 1 : jum_baris
 for q = 1 : jum_kolom
 if BW(p, q) == 1
 b0.y = p;
 b0.x = q;

 selesai = true;
 break;
 end
 end

 if selesai
 break;
 end
end
c0 = 4; % Arah barat
% Periksa 8 tetangga dan cari piksel pertama yang bernilai 1
for p = 1 : 8
 [dy, dx] = delta_piksel(c0);
 if BW(b0.y + dy, b0.x + dx) == 1
 b1.y = b0.y + dy;
 b1.x = b0.x + dx;

 c1 = sebelum(c0);
 break;
 else
 c0 = berikut(c0);
 end
end
Kontur=[];
Kontur(1, 1) = b0.y;
Kontur(1, 2) = b0.x;
Kontur(2, 1) = b1.y;
Kontur(2, 2) = b1.x;
%Kontur
n = 2; % Jumlah piksel dalam kontur
b = b1;
c = c1;
% Ulang sampai berakhir
while true
 for p = 1 : 8
 [dy, dx] = delta_piksel(c);
 if BW(b.y + dy, b.x + dx) == 1
 b.y = b.y + dy;
 b.x = b.x + dx;

 c = sebelum(c);

 n = n + 1;
 Kontur(n, 1) = b.y;
 Kontur(n, 2) = b.x;

 break;
 else
 c = berikut(c);
end
end

 % Kondisi pengakhir pengulangan
 if (b.y == b0.y) && (b.x == b0.x)
 break;
 end
end
return
function [b] = berikut(x)
if x == 0
 b = 7;
else
 b = x - 1;
end
function [s] = sebelum(x)
if x == 7
 s = 0;
else
 s = x + 1;
end
if s < 2
 s = 2;
elseif s < 4
 s = 4;
elseif s < 6
 s = 6;
else
 s = 0;
end
function [dy, dx] = delta_piksel(id)
if id == 0
 dx = 1; dy = 0;
elseif id == 1
 dx = 1; dy = -1;
elseif id == 2
 dx = 0; dy = -1;
elseif id == 3
 dx = -1; dy = -1;
elseif id == 4
 dx = -1; dy = 0;
elseif id == 5
 dx = -1; dy = 1;
elseif id == 6
 dx = 0; dy = 1;
elseif id == 7
 dx = 1; dy = 1;
end
