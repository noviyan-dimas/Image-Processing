function A = zermoment (F, orde, tampil)
% ZERMOMENT Menghasilkan koefisien momen Zernike.
% Masukan:
% F = Citra biner
% orde = order momen Zernike
% tampil = true untuk menampilkan gambar
if nargin < 3
 tampil = false;
end
% Salin yang ada pada kotak pembatas
[min_x, max_x, min_y, max_y] = kotak_pembatas(F);
B = F(min_y:max_y, min_x:max_x);
[m, n] = size(B);
beta = 20000; % Parameter untuk mengatur
 % penyekalaan citra
luas = sum(sum(B)); % Luas objek
% Tentukan citra yang memenuhi perbandingan beta
% dengan luas citra B
m1 = fix(m * sqrt(beta/luas));
n1 = fix(n * sqrt(beta/luas));
C = imresize(B, [m1, n1]);
[m, n] = size(C);

% Atur ukuran gambar untuk kepentingan
% penyajian dalam bentuk lingkaran
maks_mn = max(m, n);
m_baru = round(sqrt(2) * maks_mn);
n_baru = m_baru;

D = zeros(m_baru, n_baru);
for i=1 : m
 for j=1: n
 D(i,j) = C(i,j);
 end
end
m = m_baru;
n = n_baru;
% Peroleh pusat massa dan letakkan di tengah citra
[xc, yc] = centroid(D);
xc = round(xc);
yc = round(yc);
xc = xc - round((n/2));
yc = yc - round((m/2));
% Atur gambar ke G
G = zeros(m,n);
for i=1 : m
 for j=1: n
 if ~((j-xc< 1) || (i-yc<1) || (i-yc > m) || (j-xc > n))
 G(i-yc, j-xc)= D(i,j);
 end
 end
end
% Bentuk grid untuk menentukan koordinat
% dengan tengah citra sebagai titik pusat
selang = 2 / (m-1);
ii = 0;
for i=-1 : selang : 1
 ii = ii + 1;
 jj = 0;
 for j=-1 : selang : 1;
 jj = jj + 1;
 X(ii, jj) = j;
 Y(ii, jj) = i;
 end
end
% Hitung sudut, rho, dan lingkaran
Theta = zeros(m, n);
Rho = zeros(m, n);
L = zeros(m, n);
for i=1 : m
 for j=1: n
 Theta(i,j) = atan2(Y(i,j), X(i,j));
 if Theta(i,j) < 0
 Theta(i,j) = Theta(i,j) + 2 * pi;
 end
 jarak2 = X(i,j)^2 + Y(i,j)^2;
 Rho(i,j) = sqrt(jarak2);
 L(i,j) = jarak2;
 end
end
% Bentuk lingkaran
DidalamL = find(L <= 1);
Lingkaran = zeros(m,n);
Lingkaran(DidalamL) = 1;
luas = 0;
for i=1 : m
 for j=1: n
 if Lingkaran(i,j) == 1
 luas = luas + 1;
 end
 end
end
% Hitung Koefisien momen Zernike
A = [];
indeks = 0;
for p = 2: orde
 for q = p:-2:0
 zpq_real = 0;
 zpq_imaj = 0;
 for i=1 : m
 for j=1 : n
 if Lingkaran(i,j) == 1
 vpq = fb_zernike(p,q, Rho(i,j));
zpq_real = zpq_real + G(i,j)* vpq * ...
 cos(q * Theta(i,j));
 zpq_imaj = zpq_imaj + G(i,j)* vpq * ...
 sin(q * Theta(i,j));
 end
 end
 end

 zpq_real = zpq_real * (p+1)/pi;
 zpq_imaj = zpq_imaj * (p+1)/pi;

 indeks = indeks + 1;
 A(indeks) = sqrt(zpq_real^2 + zpq_imaj^2);
 end;
end;
% Normalsiasi koefisien
m00 = momen_spasial(G, 0, 0);
A = A ./ m00;
% Tampilkan gambar kalau memang diminta
if tampil == true
 close all;

 figure;
 subplot(2,2,1);
 imshow(B);
 title('Citra dalam kotak pembatas');
 subplot(2,2,2);
 imshow(G);
 title('Hasil penyekalaan dan translasi');
 subplot(2,2,3);
 imshow(1-Lingkaran+G);
 title('Citra dalam lingkaran');

 subplot(2,2,4);
 plot(A);
 title('Deskriptor momen Zernike');
end
function p = fb_zernike (n,l,rho)
% Menghitung fungsi basis Zernike
p = 0;
if n == 2
  switch (l)
 case 0, p = 2*(rho.^2)-1;
 case 2, p = (rho.^2);
 end;
elseif n == 3
 switch (l)
 case 1, p = 3*(rho.^3)-2*rho;
 case 3, p = (rho.^3);
 end;
elseif n == 4
 switch (l)
 case 0, p = 6*(rho.^4)-6*(rho.^2)+1;
 case 2, p = 4*(rho.^4)-3*(rho.^2);
 case 4, p = (rho.^4);
 end;
elseif n == 5
 switch (l)
 case 1, p = 10*(rho.^5)-12*(rho.^3)+3*rho;
 case 3, p = 5*(rho.^5)- 4*(rho.^3);
 case 5, p = (rho.^5);
 end;
elseif n == 6
 switch (l)
 case 0, p = 20*(rho.^6)-30*(rho.^4)+12*(rho.^2)-1;
 case 2, p = 15*(rho.^6)-20*(rho.^4)+ 6*(rho.^2);
 case 4, p = 6*(rho.^6)- 5*(rho.^4);
 case 6, p = (rho.^6);
 end;
elseif n == 7
 switch (l)
 case 1, p = 35*(rho.^7)-60*(rho.^5)+30*(rho.^3)-4*rho;
 case 3, p = 21*(rho.^7)-30*(rho.^5)+10*(rho.^3);
 case 5, p = 7*(rho.^7)- 6*(rho.^5);
 case 7, p = (rho.^7);
 end;
elseif n == 8
 switch (l)
 case 0, p = 70*(rho.^8)-140*(rho.^6)+...
 90*(rho.^4)-20*(rho.^2)+1;
 case 2, p = 56*(rho.^8)-105*(rho.^6)+ ...
 60*(rho.^4)-10*(rho.^2);
 case 4, p = 28*(rho.^8)- 42*(rho.^6)+15*(rho.^4);
 case 6, p = 8*(rho.^8)- 7*(rho.^6);
 case 8, p = (rho.^8);
 end;
elseif n == 9
 switch (l)
 case 1, p = 126*(rho.^9)-280*(rho.^7)+ ...
 210*(rho.^5)-60*(rho.^3)+5*rho;
 case 3, p = 84*(rho.^9)-168*(rho.^7)+ ...
 105*(rho.^5)-20*(rho.^3);
 case 5, p = 36*(rho.^9)- 56*(rho.^7)+ 21*(rho.^5);
 case 7, p = 9*(rho.^9)- 8*(rho.^7);
 case 9, p = (rho.^9);
 end;
elseif n == 10
 switch (l)
 case 0, p = 252*(rho.^10)-630*(rho.^8)+ ...
 560*(rho.^6)-210*(rho.^4)+30*(rho.^2)-1;
 case 2, p = 210*(rho.^10)-504*(rho.^8)+ ...
 420*(rho.^6)- ...
 140*(rho.^4)+15*(rho.^2);
 case 4, p = 129*(rho.^10)-252*(rho.^8)+ ...
 168*(rho.^6)- ...
 35*(rho.^4);
 case 6, p = 45*(rho.^10)- 72*(rho.^8)+ 28*(rho.^6);
 case 8, p = 10*(rho.^10)- 9*(rho.^8);
 case 10, p = (rho.^10);
 end;
elseif n == 11
 switch (l)
 case 1, p = 462*(rho.^11)-1260*(rho.^9)+ ...
 1260*(rho.^7)- ...
 560*(rho.^5)+105*(rho.^3)-6*rho;
 case 3, p = 330*(rho.^11)- 840*(rho.^9)+ ...
 756*(rho.^7)- ...
 280*(rho.^5)+ 35*(rho.^3);
 case 5, p = 165*(rho.^11)- 360*(rho.^9)+ ...
 252*(rho.^7)- 56*(rho.^5);
 case 7, p = 55*(rho.^11)- 90*(rho.^9)+ 36*(rho.^7);
 case 9, p = 11*(rho.^11)- 10*(rho.^9);
 case 11, p = (rho.^11);
 end;
elseif n == 12
 switch (l)
 case 0, p = 924*(rho.^12)-2772*(rho.^10)+ ...
 3150*(rho.^8)- ...
 1680*(rho.^6)+420*(rho.^4)-42*(rho.^2)+1;
 case 2, p = 792*(rho.^12)-2310*(rho.^10)+ ...
 2520*(rho.^8)- ...
 1260*(rho.^6)+280*(rho.^4)-21*(rho.^2);
 case 4, p = 495*(rho.^12)-1320*(rho.^10)+ ...
 1260*(rho.^8)- ...
 504*(rho.^6)+ 70*(rho.^4);
 case 6, p = 220*(rho.^12)- 495*(rho.^10)+ ...
 360*(rho.^8)- ...
 84*(rho.^6);
 case 8, p = 66*(rho.^12)- 110*(rho.^10)+45*(rho.^8);
 case 10, p = 12*(rho.^12)- 11*(rho.^10);
 case 12, p = (rho.^12);
 end;
end;
function [min_x, max_x, min_y, max_y] = kotak_pembatas(F)
% Mencari koordinat kotak yang membatasi
% citra F
[m0, n0] = size(F);
min_y = m0;
max_y = 1;
min_x = n0;
max_x = 1;
for i=1 : m0
 for j=1: n0
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
