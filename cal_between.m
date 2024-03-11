function b_ij = cal_between( c1,c2,page)
%CAL_NEIGHBOR �˴���ʾ�йش˺�����ժҪ
% �������ÿ��������ھӣ��������������ѽ
%   �˴���ʾ��ϸ˵��
% between = [];% ��������ھ�
n = length(page.components);
x1 = c1.polygon.x; y1 = c1.polygon.y;
x2 = c2.polygon.x; y2 = c2.polygon.y;
b_ij = 0;
for i = 1:n
    xi = page.components{i}.polygon.x; yi = page.components{i}.polygon.y;
    if(min(x1(1),x2(1)) < xi(1)&&xi(2) < max(x1(2),x2(2))&&min(y1(1),y2(1)) < yi(1)&&yi(4) < max(y1(4),y2(4)))
        b_ij = b_ij + 1;
    end
end

