function Ec=cal_E(page,page0,TM,OM,S,neighbor)
%% 计算Eatt_O
n=length(S);
sum0=0;% 循环外面定义加和
for i=1:(n-1)
    order=S(i);% ci当前阅读组件ci ∈ S
    Si=S((i+1):n);% 定义Si，最后一个没有
    m=length(Si);% | Si |
    sum1=0;
    for s=1:m
        order_s=Si(s);% s∈Si
        Po1=OM(order,order_s);% 从OM中读取概率
        Po2=OM(order_s,order);
        sum1=sum1+Po1-Po2;
    end
    sum0=sum0+sum1/m;
end
Eatt_O=-sum0/(n-1);
%% 计算Eatt_T
n = length(S);
sum0=0;
for i=1:(n-1)
   order=S(i); % ci
   pt1=TM(order,S(i+1));
   pt2=sum(TM(order,:));% 全集加和做分母
   nei=neighbor{i};% 定义邻居
   pt3=0;
   if(~isempty(nei))
       pt3=max(TM(order,nei));% 有时候邻居是空集
   end
   sum0=sum0+pt1/pt2-pt3/pt2;
end
Eatt_T=-sum0/(n-1);
%% 计算Ereg
Ereg=cal_Ereg(page0,page);
%% 计算Eprior_a
m = length(page.components);
n = length(S);
% a设置为左对齐
% 计算鼓励与类型a对齐的元素对的分数
sum1 = 0;% 定义两个加和变量
sum2 = 0;
mul0 = 1;% 定义两个乘积变量
mul1 = 1;
alpha_a = 3.5;% 根本找不到系数在哪，在那个表里[30]看到的
for i = 1:m % 网页上所有组件
    for j = 1:n % 期望浏览路径中的组件
       order = S(j);% 当前阅读组件
       I_ij = cal_Iij(page.components{order},page.components{i},page,0.065);% 调用对准指示变量
       
       dist_ij = abs(page.components{order}.polygon.x(1)-page.components{i}.polygon.x(1));
       Cdist_ij = 5 * atan(dist_ij/0.015);
       mul1 = mul1 * I_ij * Cdist_ij;% 在循环里面计算出乘积
    end
   sum1 = sum1 + I_ij;% 鼓励项的内层
   sum2 = sum2 + mul1;% 惩罚项的内层
end
mul0 = mul0 * sum1/(n^2);% 鼓励项加上系数
mul2 = sum2 / (3 * n^2);% 惩罚项加上系数
Ealign_a = -atan(alpha_a * mul0)/atan(alpha_a);% 鼓励项最后用一次sigmoid函数
% 计算惩罚与对齐类型不一致的分数
Emisalign_a = mul2;% % 惩罚项直接获得值
Eprior_a = Ealign_a + Emisalign_a;% % 得到优化_对齐项
%% 带入Ec
alpha1 = 0.5;
alpha2 = 0.01;% 跑出来的结果越来越大，只好调整惩罚项的参数，让他小点
alpha3 = 0.2;

Ec = alpha1 * (Eatt_O + Eatt_T) + alpha2 * Eprior_a + alpha3 * Ereg;
end