%% ����������ɸ�˹�����ķ���Ϊ����ͼ�����ɸ�˹����
clc
clear
close all;
%% ����ͼ��
% image=imread('a1.jpg');
% [width,height,z]=size(image);
page = importdata('test_page.mat'); % load a test webpage from our dataset
width = 1024;
height = 1297;
% z = 3;% ���3Ҳ��֪����ɶ������ÿ��img����1024 * 1279 * 3 unit8
%% ��Ӹ�˹����
av=0;% ��˹������ֵ
std=100;% ��˹��������
% ����������ͼ��Ҫôȫ�ڣ�Ҫôȫ�ף������Ǻ�ͼ����ĻҶȷ�Χ�й�ϵ����ӵ���������Ҫ��ͼ��Ҷȷ�Χ��
% �̳̣�https://blog.csdn.net/liuyingying0418/article/details/79432962
u1=rand(width,height);
u2=rand(width,height);
x=std*sqrt(-2*log(u1)).*cos(2*pi*u2)+av;
result1=double(image)/255+x;
result1=uint8(255*result1);
%%
% figure;
set(gcf, 'PaperPositionMode', 'auto');% ���ͼ���С����
set(gcf,'units','normalized','outerposition',[0 0 1 1]);% ��ͼ��Ĵ�С��λ�ü������������
set(gca,'LooseInset',get(gca,'TightInset'));% ȥ����ͼ��Χ�հױ߽�

subplot(1,2,1);% ������ͼ
imshow(page.img);
title('ԭͼ');
subplot(1,2,2);
imshow(result1);
title('�����ֵΪ0����׼��Ϊ0.1�ĸ�˹������');