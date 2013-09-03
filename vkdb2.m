%Project #1 (Wavelet-based Edge Detection and Fusion)
%using db2 wavelet
%Irugu Guruswamy Vaibhav Krishna
%Nirupan Maruthappan

lpdb2 =[ -0.12940952255092145 0.22414386804185735 0.83651630373746899 0.48296291314469025 ]
hpdb2= [-0.48296291314469025 0.83651630373746899 -0.22414386804185735 -0.12940952255092145 ]
lpdb22=[0.48296291314469025 0.83651630373746899 0.22414386804185735 -0.12940952255092145 ]
hpdb22 =[-0.12940952255092145 -0.22414386804185735 0.83651630373746899 -0.48296291314469025 ]

x = imread('lena.jpg');
I = im2double(x);
it = 3;
it2= 2;
LH=img_lh(I,it,lpdb2,hpdb2);
HL=img_hl(I,it,lpdb2,hpdb2);



[LH_recomp,HL_recomp]=img_LH_and_HL_recomp(LH,HL,it,lpdb22,hpdb22)


 for i=1:it
     LH_recomp_decomposed{i}=rec_decomp(LH_recomp{i},it2,lpdb2,hpdb2);
     HL_recomp_decomposed{i}=rec_decomp(HL_recomp{i},it2,lpdb2,hpdb2);
 end

 for i=1:it
	fused{i}=img_fusion(LH_recomp{i},HL_recomp{i},lpdb2,hpdb2,lpdb22,hpdb22,it2); 
	
	figure
	imshow(fused{i},[]);
 end
 
  %The scale multiplication is implemented using the corelation of two adjacent dwt scales
 %in this case, the correlation is computed using the two adjacent levels , 2 and 3
 scale2= (4*fused{2}+2*fused{3})/4.4721;
 %in this case, the correlation is computed using the two adjacent levels , 1 and 2
 scale1= (8*fused{1}+4*fused{2})/8.944;

figure
figure
imshow(im2bw(scale1,0.70));%noise suppressed at this treshold
figure
imshow(im2bw(scale2,0.70));



 
 

    