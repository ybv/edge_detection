function [img_LH_recomp,img_HL_recomp]=img_LH_and_HL_recomp(LH,HL,it,lphaar2,hphaar2)
for j=1:it
   approx = zeros(size(HL{j},1),size(HL{j},2));
    for i = j:-1:1
        [m,n] = size(HL{i});
        if(i==j)
        approx = [approx,zeros(m,n);HL{i},zeros(m,n)];
        else
        approx = [approx,zeros(m,n);zeros(m,n),zeros(m,n)];    
        end
             
    end
    img_HL_recomp{j} = img_recomp(approx,j,lphaar2,hphaar2);
end


for j=1:it
   approx = zeros(size(LH{j},1),size(LH{j},2));
    for i = j:-1:1
        [m,n] = size(LH{i});
        if(i==j)
        approx = [approx,LH{i};zeros(m,n),zeros(m,n)];
        else
        approx = [approx,zeros(m,n);zeros(m,n),zeros(m,n)];    
        end
             
    end
    img_LH_recomp{j} = img_recomp(approx,j,lphaar2,hphaar2);
end
end