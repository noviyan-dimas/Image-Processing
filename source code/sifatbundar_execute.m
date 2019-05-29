clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
A = sifatbundar(Img);

disp(["Nilai Sifat Bundar = ", num2str(A)])