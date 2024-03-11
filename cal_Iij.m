function I_ij = cal_Iij( c1,c2,page,alpha )
%CAL_IIJ 此处显示有关此函数的摘要
%用于计算组件i和j之间的对准指示器变量
%   此处显示详细说明
x1 = c1.polygon.x; y1 = c1.polygon.y;
x2 = c2.polygon.x; y2 = c2.polygon.y;

% 按照对其类型计算距离，采用左对齐进行尝试
dist_ij = abs(x1(1)-x2(1));% 左边框的距离
A_ij = logical(dist_ij < alpha);% 左边框的距离是否小于阈值，阈值可能需要调整，因为单位不同

b_ij = cal_between(c1,c2,page);
B_ij = logical(b_ij < 1);

I_ij = A_ij&B_ij;

end

