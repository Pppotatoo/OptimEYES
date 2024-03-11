function vis_prediction(M, title_str)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

for k = 1:size(M, 1)
    xTicks{k} = num2str(k);
    yTicks{k} = num2str(k);
end

imagesc(M);
colormap(gray);
axis image;
box off;

h =colorbar;
set(h, 'ylim', [0 1],'YTick', 0:0.2:1);
set(h,'fontsize',15);
set(gca, 'xTickLabel', xTicks, 'xTick', 1:size(M, 1), 'FontSize', 15, ...
    'yTickLabel',yTicks, 'yTick', 1:size(M, 1));
set(gca, 'XAxisLocation', 'Top');
title(title_str, 'FontSize', 20);
end