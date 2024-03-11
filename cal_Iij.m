function I_ij = cal_Iij( c1,c2,page,alpha )
%CAL_IIJ �˴���ʾ�йش˺�����ժҪ
%���ڼ������i��j֮��Ķ�׼ָʾ������
%   �˴���ʾ��ϸ˵��
x1 = c1.polygon.x; y1 = c1.polygon.y;
x2 = c2.polygon.x; y2 = c2.polygon.y;

% ���ն������ͼ�����룬�����������г���
dist_ij = abs(x1(1)-x2(1));% ��߿�ľ���
A_ij = logical(dist_ij < alpha);% ��߿�ľ����Ƿ�С����ֵ����ֵ������Ҫ��������Ϊ��λ��ͬ

b_ij = cal_between(c1,c2,page);
B_ij = logical(b_ij < 1);

I_ij = A_ij&B_ij;

end

