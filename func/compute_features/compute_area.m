function s = compute_area(c1, c2)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

P1.x = c1.polygon.x; P1.y =  c1.polygon.y;
P2.x = c2.polygon.x; P2.y =  c2.polygon.y;
area1 = abs(polygonArea([P1.x P1.y]));
area2 = abs(polygonArea([P2.x P2.y]));
s = area1/area2;
end