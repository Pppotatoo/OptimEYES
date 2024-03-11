function [cdist, h1, h2] = compute_color(c1, c2, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

p1 = extract_image_patch(c1, I);
p2 = extract_image_patch(c2, I);
% 计算组件颜色的原理还是不懂
h1 = [];
h2 = [];
colorTransform = makecform('srgb2lab');
lab1 = applycform(p1, colorTransform);
m1 = mean(mean(lab1, 1), 2);
% 冒号用于将数组重构为列向量
m1 = m1(:);

colorTransform = makecform('srgb2lab');
lab2 = applycform(p2, colorTransform);
m2 = mean(mean(lab2, 1), 2);
m2 = m2(:);
cdist = norm(m1-m2, 2);
end