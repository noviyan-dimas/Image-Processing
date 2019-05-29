# Image Processing - Ekstraksi Fungsi dan Bentuk Citra


1. tanda tangan kontur
-------> tandatangan.m->-execute
	>> diagram (img)

2. deskriptor fourier
------->-perolehFD.m->-execute
	>> jumlah data (txt) 
	>> jumlah deskriptor fourier (txt)
------->-plotFD.m->-execute
	>> outline (img)
------->-fiturFourier.m->-execute
	>> input n >> outline (img)
------->-normalisasiFD.m
	>> function
------->-amatiFD.m->-execute
	>> diagram (img)


3. sifat bundar
------->-sifatbundar.m->-execute
	>> nilai sifat bundar (txt)

4. convex hull
------->-convexhull.m->-execute
	>> titik M (txt)
------->-tesconvex.m->-execute
	>> outline (img)
------->-konveksitas.m->-execute
	>> error "perim2 function not found"
------->-soliditas.m->-execute
	>> nilai soliditas (txt)

5. proyeksi
------->-proyeksi.m->-execute
	>> diagram (img)

6. momen spasial dan momen pusat
------->-normomen.m->-execute
	>> input x,y >> momen pusat ternormalisasi orde (x,y) (txt)
------->-momen_pusat.m
	>> function
------->-momen_spasial.m
	>> function

7. momen invariant
------->-momenhu.m->-execute
	>> momen Hu (txt)

8. momen jarak ke pusat
------->-mjarakpusat.m->-execute
	>> momen jarak ke pusat (txt)

9. momen zernike
------->-zermoment.m->-execute
	>> true for (img) | false for (txt)

10. polar fourier transform
------->-gfd.m->-execute
	>> Fitur GFD (txt)

11. kotak pembatas
------->-bboxcitra.m->-execute
	>> Rasio Berorientasi Citra (txt)
------->-bboxobjek.m->-execute
	>> Rasio Berorientasi Objek (txt)