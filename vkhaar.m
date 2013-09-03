%Project #1 (Wavelet-based Edge Detection and Fusion)
%using haar wavelet
%Irugu Guruswamy Vaibhav Krishna
%Nirupan Maruthappan


lphaar = [1/sqrt(2),1/sqrt(2)];     
hphaar = [-1/sqrt(2),1/sqrt(2)];
hphaar2 = [1/sqrt(2),-1/sqrt(2)];
lphaar2 = [1/sqrt(2),1/sqrt(2)];      


x = imread('lena.jpg');
I = im2double(x);
it = 3;
it2= 2;
LH=img_lh(I,it,lphaar,hphaar);
HL=img_hl(I,it,lphaar,hphaar);



[LH_recomp,HL_recomp]=img_LH_and_HL_recomp(LH,HL,it,lphaar2,hphaar2)


 for i=1:it
     LH_recomp_decomposed{i}=rec_decomp(LH_recomp{i},it2,lphaar,hphaar);
     HL_recomp_decomposed{i}=rec_decomp(HL_recomp{i},it2,lphaar,hphaar);
 end

 for i=1:it
	fused{i}=img_fusion(LH_recomp{i},HL_recomp{i},lphaar,hphaar,lphaar2,hphaar2,it2); 
	figure
	imshow(fused{i},[]);
 end
 

 %The scale multiplication is implemented using the corelation of two adjacent dwt scales
 %in this case, the correlation is computed using the two adjacent levels , 2 and 3
 scale2= (4*fused{2}+2*fused{3})/4.4721;
 %in this case, the correlation is computed using the two adjacent levels , 1 and 2
 scale1= (8*fused{1}+4*fused{2})/8.944;

figure
imshow(im2bw(scale1,0.70));%noise removed at this treshold
figure
imshow(im2bw(scale2,0.70));

 

    