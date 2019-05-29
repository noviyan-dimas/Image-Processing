clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'),0.5);
%argumen kedua adalah radial maksimal
%argumen ketiga adalah frekuensi radial angular
disp(["Fitur GFD frekuensi radial maksimum sebesar " , num2str(nrad) "dan frekuensi radial angular sebesar ", num2str(nang)]);
X = gfd(Img, 4, 6)