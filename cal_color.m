function [m1] = cal_color(c1, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

p1 = extract_image_patch(c1, I);

colorTransform = makecform('srgb2lab');
lab1 = applycform(p1, colorTransform);
m1 = mean(mean(lab1, 1), 2);
% 返回的是颜色数据，但是是一个列向量，转置之后加到参数序列里
m1 = m1(:);

