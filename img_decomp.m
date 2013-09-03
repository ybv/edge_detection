function [LL, LH, HL, HH] = img_decomp(I,lphaar, hphaar)
 LL = conv2(I,lphaar ,'same');
 LL = imresize(LL,[size(LL,1) size(LL,2)/2]);  
 LL = conv2(LL,lphaar,'same');
 LL = imresize(LL,[size(LL,1)/2 size(LL,2)]); 
 LH = conv2(I,lphaar,'same');
 LH = imresize(LH,[size(LH,1) size(LH,2)/2]);
 LH = conv2(LH,hphaar,'same');
 LH = imresize(LH,[size(LH,1)/2 size(LH,2)]);
 HL = conv2(I,hphaar,'same'); 
 HL = imresize(HL,[size(HL,1) size(HL,2)/2]);    
 HL = conv2(HL,lphaar,'same');
 HL = imresize(HL,[size(HL,1)/2 size(HL,2)]);
 HH = conv2(I,hphaar,'same');
 HH = imresize(HH,[size(HH,1) size(HH,2)/2]); 
 HH = conv2(HH,hphaar,'same');
 HH = imresize(HH,[size(HH,1)/2 size(HH,2)]);
 %figure
 %imshow(LL);
 %figure
 %imshow(LH);
 %figure
 %imshow(HL);
 %figure
 %imshow(HH);
 end  
 
      