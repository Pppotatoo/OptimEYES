function p = extract_image_patch(c, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

x = c.polygon.x; y = c.polygon.y;
% round用于舍入到最近的整数
% 冒号主要用途：生成固定间隔的行向量、对数组某个维度的部分/所有元素进行索引、将数组重构为列向量、以及定义 for 循环的边界。
% 这个I到底是啥意思，某次运行出来是一个a×b的矩阵
p = I(min(round(y)):max(round(y)),  min(round(x)):max(round(x)), :);
end