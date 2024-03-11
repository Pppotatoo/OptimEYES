function [xc,yc,w,h]=cal_geo(x,y)

%CAL_GEO 此处显示有关此函数的摘要
%   此处显示详细说明
xc=(max(x)+min(x))/2;
yc=(max(y)+min(y))/2;
w=max(x)-min(x);
h=max(y)-min(y);
end