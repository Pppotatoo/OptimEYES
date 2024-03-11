function plot_component_text(components)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

for i = 1:length(components)
    x = mean(components{i}.polygon.x);
    y = mean(components{i}.polygon.y);
    text(x, y, num2str(i), 'FontSize', 15, 'Color', 'r', 'HorizontalAlignment', 'center');
end
end