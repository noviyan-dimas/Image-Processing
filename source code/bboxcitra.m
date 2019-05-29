function [rasio, min_x, max_x, min_y, max_y] = bboxcitra(F)
% BBOXCITRA Mencari kotak terkecil yang melingkupi citra.
% Masukan: F = Citra berskala keabuan
% Keluaran: Nilai X dan Y terkecil dan terbesar
[m, n] = size(F);
min_y = m;
max_y = 1;
min_x = n;
max_x = 1;
for i=1 : m
 for j=1: n
 if F(i,j) == 1
 if min_y > i
 min_y = i;
 end

 if max_y < i
 max_y = i;
 end

 if min_x > j
 min_x = j;
 end

 if max_x < j
 max_x = j;
 end
 end
 end
end
luas = 0;
for i=1 : m
 for j=1 : n
   if F(i,j) ~= 0
 luas = luas + 1;
 end
 end
end
rasio = luas / ((max_y - min_y) * (max_x - min_x));