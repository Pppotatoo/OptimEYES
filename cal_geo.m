function [xc,yc,w,h]=cal_geo(x,y)

%CAL_GEO �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
xc=(max(x)+min(x))/2;
yc=(max(y)+min(y))/2;
w=max(x)-min(x);
h=max(y)-min(y);
end