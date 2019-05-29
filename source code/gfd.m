function [GFD] = gfd(F, nrad, nang)
% GFD Memperoleh nilai gfd atau koefisien PFT.
% Masukan: F = citra biner
% nrad = frekuensi radial
% nang = frekuensi angular
Kontur = inbound_tracing(F);
jum = length(Kontur);
[x_pusat, y_pusat] = centroid(F);
% Cari jarak terpanjang
rad_maks = 0;
for i=1 : jum
 xi = Kontur(i,2); yi = Kontur(i, 1);

 panjang = ((xi-x_pusat)^2+(yi-y_pusat)^2)^0.5;
 if panjang > rad_maks
 rad_maks = panjang;
 end
end
% Tentukan frekuensi radial dan angular maksimum
if nargin < 3
 m = 4; % Frekuensi radial maksimum
 n = 6; % Frekuensi angular maksimum
else
 m = nrad;
 n = nang;
end
F = double(F);
[tinggi, lebar] = size(F);
for rad=0 : m
 for ang=0 : n
 FR(rad+1, ang+1) = 0;
 FI(rad+1, ang+1) = 0;
 for x=1 : lebar
 for y=1: tinggi
 radius = ((x-x_pusat)^2 + (y-y_pusat)^2)^.5;
 theta = atan2((y-y_pusat),(x-x_pusat));
 if (theta < 0)
 theta = theta + 2 * 3.14;
 end

FR(rad+1, ang+1) = FR(rad+1, ang+1) + ...
 F(y, x) * ...
cos(2 * 3.14 * rad * ...
(radius / rad_maks) + ang * theta);

 FI(rad+1, ang+1) = FI(rad+1, ang+1) - ...
 F(y, x) * ...
sin(2 * 3.14 * rad * ...
(radius / rad_maks) + ang * theta);
 end
 end
 end
end
% Peroleh GFD
for rad=0 : m
 for ang=0 : n
 if (rad==0) && (ang==0)
 dc = (FR(1,1)^2+FI(1,1)^2)^.5;
 GFD(1) = dc /(pi * rad_maks^2);
 else
 GFD(rad * n+ang+1)=(FR(rad+1, ang+1)^2+ ...
 FI(rad+1,ang+1)^2)^.5 / dc;
 end
 end
end

