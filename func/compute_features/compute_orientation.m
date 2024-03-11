function theta = compute_orientation(c1, c2)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

c1_xy = [mean(c1.polygon.x), mean(c1.polygon.y)];
c2_xy = [mean(c2.polygon.x), mean(c2.polygon.y)];
v = c2_xy - c1_xy;
v = v/norm(v, 2);
theta = atan2(v(2), v(1))*180/pi;
if theta <0
    theta = theta + 360; %Convert it into range of [0 360]
end
theta = theta/360;
end