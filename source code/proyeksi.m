function [ProyHor, ProyVer]= proyeksi(F)
% PROYEKSI Memperoleh proyeksi vertikal dan horizontal.
% Masukan: F = Citra berskala keabuan
% Keluaran: ProyHor = Proyeksi horizontal
% ProyVer = Proyeksi vertikal
[m, n] = size(F);
ProyHor = zeros(m,1);
ProyVer = zeros(n,1);
for y=1 : m
 for x=1 : n
 ProyHor(y) = ProyHor(y) + F(y,x);
 ProyVer(x) = ProyVer(x) + F(y,x);
 end
end
