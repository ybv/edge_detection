function LH=img_lh(I,it,lphaar,hphaar)

    app_img = I;    % Initializing the Approximation Image.
    
    for i = 1:it

        [LL{i}, LH{i} ,HL{i} , HH{i}] = img_decomp(app_img, lphaar, hphaar);
        app_img = LL{i};
       % figure
       % imshow(LH{i});
    end
    
end