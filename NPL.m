function [NP,valid] = NPL(image)

NP = 0;
valid = 0;
img_gry = rgb2gray(image);
    %% Open morphological and edge detection
    SE1 = ones(15,40);
    img_open = imopen(img_gry,SE1);
    img_edge = img_gry - img_open;

    %% Binarisation
    img_bin = img_edge;
    med = 90;
    img_bin(img_edge>=med) = 255;
    img_bin(img_edge<med) = 0;

    %% Open and Close morphological to remove noise
    SE2 = ones(3);
    img_oc = imopen(img_bin,SE2);
    img_oc = imclose(img_oc,SE2);

    %% NPL
    [img_concomp,n] = bwlabel(img_oc);

    for i = 1:n
        [row,col] = find(img_concomp == i);
        H = max(row) - min(row);
        W = max(col) - min(col);
        if (H <= 80 && H>= 30)
            if ((W/H)<7 && (W/H)>3)
                if (W*H <= 30000 && W*H >=8000 )
                    NP = img_bin(min(row):max(row),min(col):max(col));
                    valid = 1;
                end
            end
        end
    end

end