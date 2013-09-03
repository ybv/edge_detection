function recomp_image = img_recomp( input,n ,lphaar, hphaar)
[rw cl]=size(input);
for i=n:-1:1
   sz=rw*(0.5^(i-1));
   low_band=input(1:sz,1:sz);
   LL=low_band(1:sz/2,1:sz/2);
   LH=low_band(1:sz/2,(1+sz/2):sz);
   HL=low_band((1+sz/2):sz,1:sz/2);
   HH=low_band((1+sz/2):sz,(1+sz/2):sz);

   
 LL_new = imresize(LL,[size(LL,1)*2 size(LL,2)]);
 LL_new = conv2(LL_new,lphaar ,'same');
 

 LH_new = imresize(LH,[size(LH,1)*2 size(LH,2)]);
 LH_new = conv2(LH_new,hphaar ,'same');
 L=LL_new+LH_new; 


 L = imresize(L,[size(L,1) size(L,2)*2]);
 L = conv2(L,lphaar ,'same');

 HL_new = imresize(HL,[size(HL,1)*2 size(HL,2)]);
 HL_new = conv2(HL_new,lphaar ,'same');
 
 HH_new = imresize(HH,[size(HH,1)*2 size(HH,2)]);
 HH_new = conv2(HH_new,hphaar ,'same');
 H=HL_new+LH_new; 
 
 H = imresize(H,[size(H,1) size(H,2)*2]);
 H = conv2(H,hphaar ,'same');
 
 
LH_image=L+H;


   input(1:sz,1:sz)=LH_image(1:sz,1:sz);
   
end  
recomp_image=input;
end

