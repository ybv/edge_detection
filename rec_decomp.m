function recomp_decomposed=rec_decomp(recomposed,it2,lphaar,hphaar)

    app_img = recomposed;    % Initializing the Approximation Image.
    
    for i = 1:it2
        [LL{i}, LH{i} ,HL{i} , HH{i}] = img_decomp(app_img, lphaar, hphaar);
        app_img = LL{i};
    end

    subband = LL{it2};
    for i = it2:-1:1
        subband = [subband,LH{i};HL{i},HH{i}];
    end
   recomp_decomposed=subband; 
end