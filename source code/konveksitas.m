function [konv] = konveksitas(BW)
% KONVEKSITAS Berguna untuk memperoleh konveksitas objek.
% Masukan: BW = Citra biner yang berisi objek.
% Keluaran: konv = nilai konveksitas
Kontur = inbound_tracing(BW);
CHull = convexhull(Kontur);
X = CHull(:,2);
Y = CHull(:,1);
X = [X; X(1)];
Y = [Y; Y(1)];
perimeter_objek = perim2(BW);
% Hitung perimeter konveks
perimeter_konveks = 0;
for i=2 : length(X)
 perimeter_konveks = perimeter_konveks + ...
 sqrt((X(i)-X(i-1))^2 + (Y(i)-Y(i-1))^2);
end
% Peroleh rasio
konv = perimeter_konveks / perimeter_objek;