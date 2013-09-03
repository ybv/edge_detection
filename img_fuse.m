function [edge_image] = img_fuse( h_img, v_img )

h_img=double(h_img);
v_img=double(v_img);

    [row,col] = size(h_img);
    for i = 1:row
        for j = 1:col
            if abs(h_img(i,j)) > abs(v_img(i,j))
                edge_image(i,j) = h_img(i,j);
            else
                edge_image(i,j) = v_img(i,j);
            end
        end
    end
   %  imshow(edge_image,[]);
end

