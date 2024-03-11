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
% 打印出原网页看看
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
%% 期望的组件浏览顺序
S=[5,6,10,4];
%% 计算每个组件的邻居
alpha=0.4;
n=length(S);% 输入组件数量 | S |
for i = 1:(n-1)
    order = S(i);% 当前组件
    nei = [];% 空数组放邻居
    for j = 1:(n-1)
        hd = compute_distance(page.components{order}, page.components{S(j)}, page.img);
        if(hd < alpha&&j ~= i+1&&j ~= i)
            nei = [nei,S(j)];
        end
    end
    neighbor{i,1} = nei;
end

E_previous = cal_E(page,page_input,TM,OM,S,neighbor)% 邻居计算要放在外面，然后调用目标函数的公式
%%
for i=1:10
    disp(i)
    while(1)% 如果成立的话，就循环
        page=generate_new_page(page0);% 先生成一个新配置的网页
        TM = predict_mat(page.components, page.img, transition_model);% 新网页的TM和OM矩阵
        OM = predict_mat(page.components, page.img, order_model);
        E_new = cal_E(page,page_input,TM,OM,S,neighbor)% 新网页的E
        if(E_new<E_previous)% 如果变小了，我们要找小
            disp(E_new)% 打印输出看看跑到哪了
            page0=page;% 就把当前网页赋给原网页，作为下一次迭代的新网页
            E_previous=E_new;% 更新E的值
            break% 不小的话就什么也不做
        end
    end
end
% 打印出新网页看看
figure;
imshow(page.img);
hold on;
plot_components(page.components);
hold on;
plot_component_text(page.components);