function h = plot_single_component(component, biasdis, color, width)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

x = component.polygon.x;
y = component.polygon.y;
h = rectangle('Position',[x(1),y(1)+biasdis,abs(x(2)-x(1))+1,abs(y(3)-y(2))+1],'EdgeColor',color,'LineWidth',width);
end