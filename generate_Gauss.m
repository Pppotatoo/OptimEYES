%% 采用随机生成高斯噪声的方法为整张图像生成高斯噪声
clc
clear
close all;
%% 加载图像
% image=imread('a1.jpg');
% [width,height,z]=size(image);
page = importdata('test_page.mat'); % load a test webpage from our dataset
width = 1024;
height = 1297;
% z = 3;% 这个3也不知道是啥，但是每张img都是1024 * 1279 * 3 unit8
%% 添加高斯噪声
av=0;% 高斯噪声均值
std=100;% 高斯噪声方差
% 加完噪声，图像要么全黑，要么全白，可能是和图像本身的灰度范围有关系，添加的噪声方差要在图像灰度范围内
% 教程：https://blog.csdn.net/liuyingying0418/article/details/79432962
u1=rand(width,height);
u2=rand(width,height);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
result1=double(image)/255+x;
result1=uint8(255*result1);
%%
% figure;
set(gcf, 'PaperPositionMode', 'auto');% 输出图像大小调整
set(gcf,'units','normalized','outerposition',[0 0 1 1]);% 对图像的大小、位置及坐标进行设置
set(gca,'LooseInset',get(gca,'TightInset'));% 去除绘图周围空白边界

subplot(1,2,1);% 绘制子图
imshow(page.img);
title('原图');
subplot(1,2,2);
imshow(result1);
title('加入均值为0，标准差为0.1的高斯噪声后');