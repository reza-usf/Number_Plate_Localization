clc;
clear;
close all;

%% Reading image in rgb and convert it to gray scale
for j = 1:220
    img_rgb = imread(['D:\NPL Rahneshan\Data Set\car_plate_dataset-master\IRCP_dataset_640X480\',num2str(j),'.jpg']);
    
    cd 'D:\NPL Rahneshan'
    [NP,valid] = NPL(img_rgb);
    
    if valid==1
        cd 'D:\NPL Rahneshan\NPLs'
        imwrite(NP,['NP',num2str(j),'.jpg'])
    end
    
end



