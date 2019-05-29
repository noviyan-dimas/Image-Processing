function [Fitur] = mjarakpusat(F)
% FJARAKPUSAT Menghitung fitur momen jarak ke pusat.
% Masukan: F = Citra biner.
% p = Orde momen
% Keluaran: Fitur = fitur citra
Fitur.F1 = sqrt(momen_pusat_ke_p(F, 2)) / momen_ke_p(F, 1);
Fitur.F2 = momen_pusat_ke_p(F, 3) / (momen_ke_p(F, 2)^1.5);
Fitur.F3 = momen_pusat_ke_p(F, 4) / (momen_ke_p(F, 2)^2);
Fitur.F2a = momen_pusat_ke_p(F, 3)^(1/3) / momen_ke_p(F, 1);
Fitur.F3a = momen_pusat_ke_p(F, 4)^(1/4) / momen_ke_p(F, 1);
Fitur.mf = Fitur.F3a - Fitur.F1;
function [momen] = momen_pusat_ke_p(F, p)
momen_p = momen_ke_p(F, p);
momen_1 = momen_ke_p(F, 1);
Kontur = inbound_tracing(F);
[m, n] = size(F);
[xp, yp] = centroid(F);
jum = length(Kontur);
% Hitung momen pusat ke-p
momen = 0;
for i=1 : jum
 jarak = sqrt((Kontur(i,2)-xp)^2 + (Kontur(i,1)-yp)^2);

 momen = momen + abs(jarak - momen_1) ^ p;
end
momen = momen / jum;
function [momen] = momen_ke_p(F, p)
% Hitung momen ke-p
Kontur = inbound_tracing(F);
[m, n] = size(F);
[xp, yp] = centroid(F);
jum = length(Kontur);
momen = 0;
for i=1 : jum
 jarak = sqrt((Kontur(i,2)-xp)^2 + (Kontur(i,1)-yp)^2);
 momen = momen + jarak ^ p;
end
momen = momen / jum;