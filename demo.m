function demo()
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

% this demo shows the usage of attention transition model and attention
% order model

close all;% 关闭所有绘图窗口
warning off;

page = importdata('page6.mat'); % load a test webpage from our dataset

transition_model = importdata('transition_model.mat'); % load attention transition model
order_model = importdata('order_model.mat'); % load attention order model

%%
% predict attention transition between every pair of page components and
% output an attention transition matrix
TM = predict_mat(page.components, page.img, transition_model);
% predict attention order between every pair of page components and output
% an attention order matrix
OM = predict_mat(page.components, page.img, order_model);

%%
% show the webpage with labeled page components
figure;
imshow(page.img);
hold on;
plot_components(page.components);
hold on;
plot_component_text(page.components);

%%
% visualize predictions
figure;
set(gcf, 'PaperPositionMode', 'auto');% 输出图像大小调整
set(gcf,'units','normalized','outerposition',[0 0 1 1]);% 对图像的大小、位置及坐标进行设置
set(gca,'LooseInset',get(gca,'TightInset'));% 去除绘图周围空白边界

subplot(1, 2, 1);
% 创建子图subplot(m,n,p)
% m表示排成m行，n排成n列，n个图排成一行，一共m行
% p表示图所在位置，p = 1表示从左到右从上到下的第一个位置
vis_prediction(TM, 'Attention Transition Matrix')% 在第一块绘图
subplot(1, 2, 2);
vis_prediction(OM, 'Attention Order Matrix')% 在第二块绘图
end
