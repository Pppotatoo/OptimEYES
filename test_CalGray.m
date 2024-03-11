clear
clc
% img=imread('lena.jpg');
page = importdata('test_page.mat'); 
imshow(page.img);
% [m n]=size(img);图像长和宽
width = max(page.components{1}.polygon.x)-min(page.components{1}.polygon.x);
height = max(page.components{1}.polygon.y)-min(page.components{1}.polygon.y);
max=0;
min=256;
avg=0;
%%
for i=1:1:width
    for j=1:1:height
        if page.img(i,j)<min
            min=page.img(i,j);
        end
        if page.img(i,j)>max
            max=page.img(i,j);
        end
        avg=avg+double(page.img(i,j));
    end
end

avg=uint8(avg/(width * height));
%%
% 读取MAT图像文件
page = importdata('test_page.mat');
% imshow(page.img);
img_data = page.img;
% 计算灰度值范围
min_gray_value = min(img_data(:));
max_gray_value = max(img_data(:));
    
fprintf('灰度值范围: %d 到 %d\n', min_gray_value, max_gray_value);
