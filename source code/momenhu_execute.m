clc;
clear all;

pkg load image;

format('long');
Img = im2bw(imread('C:\Users\asus\Documents\SEMESTER 4\Pengolahan Citra\biner.jpg'),0.5);
disp(["7 momen Hu : "])
X = momenhu(Img)