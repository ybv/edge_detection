function Final=img_fusion(LH_out,HL_out,lphaar,hphaar,lphaar2,hphaar2,it2)

  %LH_output here
it2=1;
LL=[];LH=[];HL=[];HH=[];
   
    app_img = LH_out;    % Initializing the Approximation Image.
    
    for i = 1:it2
        [LL{i}, LH{i} ,HL{i} , HH{i}] = img_decomp(app_img, lphaar, hphaar);
        app_img = LL{i};
    end
    
    
    LH_final = LL{it2};
    for i = it2:-1:1
        LH_final = [LH_final,LH{i};HL{i},HH{i}];
    end
   LH_final=(LH_final-min(min(LH_final)))/(max(max(LH_final)) - min(min(LH_final)));
    
    %HL_output here 
    app_img = HL_out;    % Initializing the Approximation Image.
    
    for i = 1:it2
        [LL{i}, LH{i} ,HL{i} , HH{i}] = img_decomp(app_img, lphaar, hphaar);
        app_img = LL{i};
    end
    
    HL_final = LL{it2};
    for i = it2:-1:1
        HL_final = [HL_final,LH{i};HL{i},HH{i}];
    end
 HL_final=(HL_final-min(min(HL_final)))/(max(max(HL_final)) - min(min(HL_final)));

    Final = img_fuse(LH_final, HL_final);
    
    
   
    
    Final = img_recomp(Final, it2, lphaar2, hphaar2);
Final=(Final-min(min(Final)))/(max(max(Final)) - min(min(Final)));
end