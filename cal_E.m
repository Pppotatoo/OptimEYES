function Ec=cal_E(page,page0,TM,OM,S,neighbor)
%% ����Eatt_O
n=length(S);
sum0=0;% ѭ�����涨��Ӻ�
for i=1:(n-1)
    order=S(i);% ci��ǰ�Ķ����ci �� S
    Si=S((i+1):n);% ����Si�����һ��û��
    m=length(Si);% | Si |
    sum1=0;
    for s=1:m
        order_s=Si(s);% s��Si
        Po1=OM(order,order_s);% ��OM�ж�ȡ����
        Po2=OM(order_s,order);
        sum1=sum1+Po1-Po2;
    end
    sum0=sum0+sum1/m;
end
Eatt_O=-sum0/(n-1);
%% ����Eatt_T
n = length(S);
sum0=0;
for i=1:(n-1)
   order=S(i); % ci
   pt1=TM(order,S(i+1));
   pt2=sum(TM(order,:));% ȫ���Ӻ�����ĸ
   nei=neighbor{i};% �����ھ�
   pt3=0;
   if(~isempty(nei))
       pt3=max(TM(order,nei));% ��ʱ���ھ��ǿռ�
   end
   sum0=sum0+pt1/pt2-pt3/pt2;
end
Eatt_T=-sum0/(n-1);
%% ����Ereg
Ereg=cal_Ereg(page0,page);
%% ����Eprior_a
m = length(page.components);
n = length(S);
% a����Ϊ�����
% �������������a�����Ԫ�ضԵķ���
sum1 = 0;% ���������Ӻͱ���
sum2 = 0;
mul0 = 1;% ���������˻�����
mul1 = 1;
alpha_a = 3.5;% �����Ҳ���ϵ�����ģ����Ǹ�����[30]������
for i = 1:m % ��ҳ���������
    for j = 1:n % �������·���е����
       order = S(j);% ��ǰ�Ķ����
       I_ij = cal_Iij(page.components{order},page.components{i},page,0.065);% ���ö�׼ָʾ����
       
       dist_ij = abs(page.components{order}.polygon.x(1)-page.components{i}.polygon.x(1));
       Cdist_ij = 5 * atan(dist_ij/0.015);
       mul1 = mul1 * I_ij * Cdist_ij;% ��ѭ�����������˻�
    end
   sum1 = sum1 + I_ij;% ��������ڲ�
   sum2 = sum2 + mul1;% �ͷ�����ڲ�
end
mul0 = mul0 * sum1/(n^2);% ���������ϵ��
mul2 = sum2 / (3 * n^2);% �ͷ������ϵ��
Ealign_a = -atan(alpha_a * mul0)/atan(alpha_a);% �����������һ��sigmoid����
% ����ͷ���������Ͳ�һ�µķ���
Emisalign_a = mul2;% % �ͷ���ֱ�ӻ��ֵ
Eprior_a = Ealign_a + Emisalign_a;% % �õ��Ż�_������
%% ����Ec
alpha1 = 0.5;
alpha2 = 0.01;% �ܳ����Ľ��Խ��Խ��ֻ�õ����ͷ���Ĳ���������С��
alpha3 = 0.2;

Ec = alpha1 * (Eatt_O + Eatt_T) + alpha2 * Eprior_a + alpha3 * Ereg;
end