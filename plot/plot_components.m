function fhs = plot_components(components)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

biasdis = 0;
fhs = [];
for i = 1:length(components)
    h = plot_single_component(components{i}, biasdis, 'r', 1);
    fhs = [fhs; h];
    hold on;
end
end
