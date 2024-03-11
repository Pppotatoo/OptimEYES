clc
clear
close all
%%
page0 = importdata('page6.mat'); % load a test webpage from our dataset
page=page0;
page_input=page0;
%
% figure;
% imshow(page.img);
% hold on;
% plot_components(page.components);
% hold on;
% plot_component_text(page.components);
% ��ӡ��ԭ��ҳ����
figure
imshow(page0.img);
hold on;
plot_components(page0.components);
hold on;
plot_component_text(page0.components);

transition_model = importdata('transition_model.mat'); % load attention transition model
order_model = importdata('order_model.mat'); % load attention order model
%%
% predict attention transition between every pair of page components and
% output an attention transition matrix
TM = predict_mat(page.components, page.img, transition_model);
% predict attention order between every pair of page components and output
% an attention order matrix
OM = predict_mat(page.components, page.img, order_model);
%% ������������˳��
S=[5,6,10,4];
%% ����ÿ��������ھ�
alpha=0.4;
n=length(S);% ����������� | S |
for i = 1:(n-1)
    order = S(i);% ��ǰ���
    nei = [];% ��������ھ�
    for j = 1:(n-1)
        hd = compute_distance(page.components{order}, page.components{S(j)}, page.img);
        if(hd < alpha&&j ~= i+1&&j ~= i)
            nei = [nei,S(j)];
        end
    end
    neighbor{i,1} = nei;
end

E_previous = cal_E(page,page_input,TM,OM,S,neighbor)% �ھӼ���Ҫ�������棬Ȼ�����Ŀ�꺯���Ĺ�ʽ
%%
for i=1:10
    disp(i)
    while(1)% ��������Ļ�����ѭ��
        page=generate_new_page(page0);% ������һ�������õ���ҳ
        TM = predict_mat(page.components, page.img, transition_model);% ����ҳ��TM��OM����
        OM = predict_mat(page.components, page.img, order_model);
        E_new = cal_E(page,page_input,TM,OM,S,neighbor)% ����ҳ��E
        if(E_new<E_previous)% �����С�ˣ�����Ҫ��С
            disp(E_new)% ��ӡ��������ܵ�����
            page0=page;% �Ͱѵ�ǰ��ҳ����ԭ��ҳ����Ϊ��һ�ε���������ҳ
            E_previous=E_new;% ����E��ֵ
            break% ��С�Ļ���ʲôҲ����
        end
    end
end
% ��ӡ������ҳ����
figure;
imshow(page.img);
hold on;
plot_components(page.components);
hold on;
plot_component_text(page.components);