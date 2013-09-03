function recomposed_decomposed=multi_decompose(recomposed,it2,lp_filter,hp_filter)

    Approx_img = recomposed;    % Initializing the Approximation Image.
    
    for i = 1:it2
        [LL{i}, LH{i} ,HL{i} , HH{i}] = Decompose(Approx_img, lp_filter, hp_filter);
        Approx_img = LL{i};
    end
    
    band = LL{it2};
    for i = it2:-1:1
        band = [band,LH{i};HL{i},HH{i}];
    end
   recomposed_decomposed=band; 
end