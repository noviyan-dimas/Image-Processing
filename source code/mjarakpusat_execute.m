clc;
clear all;

pkg load image;

Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'), 0.5);
disp(["Momen jarak ke pusat : "])
mjarakpusat(Img)