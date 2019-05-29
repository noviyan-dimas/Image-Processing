function [] = tesconvex(berkas)
% TESCONVEX Digunakan untuk membuat convex hull
% pada objek.
% Masukan: Nama berkas yang berisi objek biner.
Img = im2bw(imread(berkas), 0.5);
Kontur = inbound_tracing(Img);
K = convexhull(Kontur);
X = K(:,2);
Y = K(:,1);
X = [X; X(1)]; % Tambahkan elemen pertama di akhir
Y = [Y; Y(1)]; % Tambahkan elemen pertama di akhir
imshow(1-Img);
hold on;
plot(X, Y, 'r');
hold off;
