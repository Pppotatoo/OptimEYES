function pos = compute_position(c1, c2, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

P1x = mean(c1.polygon.x); P1y =  mean(c1.polygon.y);
P2x = mean(c2.polygon.x); P2y =  mean(c2.polygon.y);
x = mean([P1x P2x]);
y = mean([P1y P2y]);
gx = size(I, 2)/2; gy = size(I, 1)/2;
pos = [(x - gx)/gx; (y - gy)/gy];
end