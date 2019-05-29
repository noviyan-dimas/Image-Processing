function [Jarak] = tandatangan(BW) 
  % TANDATANGAN Digunakan untuk memperoleh jarak-jarak antara 
  %     piksel dalam batas objek dri citra biner BW 
  %     Keluaran: Jarak - Berisi sejumlah pasangan Y, X 
  %     yang menyatakan jarak             
  [m,n] = size(BW); 
  Batas = double(inbound_tracing(BW));   
  [jum, z] = size(Batas); 
  [pusat_x, pusat_y] = centroid(BW); 
 
  Jarak = zeros(1,m); 
  for p=1 : jum     
    Jarak(p) = sqrt((Batas(p,1)-pusat_y)^2 + ...                     
    (Batas(p,2)-pusat_x)^2); 
  end   
  % Plot jarak 
  X = 1: p; 
  plot(X, Jarak);