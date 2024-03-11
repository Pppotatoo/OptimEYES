function demo()
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

% this demo shows the usage of attention transition model and attention
% order model

close all;% �ر����л�ͼ����
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
set(gcf, 'PaperPositionMode', 'auto');% ���ͼ���С����
set(gcf,'units','normalized','outerposition',[0 0 1 1]);% ��ͼ��Ĵ�С��λ�ü������������
set(gca,'LooseInset',get(gca,'TightInset'));% ȥ����ͼ��Χ�հױ߽�

subplot(1, 2, 1);
% ������ͼsubplot(m,n,p)
% m��ʾ�ų�m�У�n�ų�n�У�n��ͼ�ų�һ�У�һ��m��
% p��ʾͼ����λ�ã�p = 1��ʾ�����Ҵ��ϵ��µĵ�һ��λ��
vis_prediction(TM, 'Attention Transition Matrix')% �ڵ�һ���ͼ
subplot(1, 2, 2);
vis_prediction(OM, 'Attention Order Matrix')% �ڵڶ����ͼ
end
