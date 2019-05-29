function [rasio, min_a, max_a, min_b, max_b] = bboxobjek(F)
% BBOXOBJEK Mencari kotak terkecil yang melingkupi citra.
% Masukan: F = Citra berskala keabuan yang
% mengandung suatu objek
% Keluaran: Nilai alpha dan beta terkecil dan terbesar
if nargin < 2
 tampil = true;
end
% Cek citra biner atau tidak
Cek = find(F>1);
if ~isempty(Cek)
 % Kalau F bukan citra biner
 Kontur = inbound_tracing(im2bw(F));
else
 Kontur = inbound_tracing(F);
end
jum = length(Kontur);
% Cari nilai alpha dan beta terbesar dan terkecil
max_a = 0;
min_a = 10^300;
max_b = 0;
min_b = min_a;
[xc,yc] = centroid(F);
theta = 0.5 * atan(2 * momen_pusat(F,1,1)/...
 (momen_pusat(F,2,0) - momen_pusat(F,0,2)));
for i=1 : jum
 x = Kontur(i, 2);
 y = Kontur(i, 1);
 alpha = x * cos(theta) + y * sin(theta);
 beta = -x * sin(theta) + y * cos(theta);
 if min_b > beta
 min_b = beta;
 end

 if max_b < beta
 max_b = beta;
 end

 if min_a > alpha
 min_a = alpha;
 end

 if max_a < alpha
 max_a = alpha;
 end
end
% Hitung luas
[m, n] = size(F);
luas = 0;
for i=1 : m
 for j=1 : n
 if F(i,j) ~= 0
 luas = luas + 1;
 end
 end
end
% Hitung rasio
if luas == 0
 rasio = 0;
else
 rasio = luas / ((max_a - min_a) * (max_b - min_b));
end