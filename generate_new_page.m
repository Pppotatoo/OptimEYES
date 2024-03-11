function page=generate_new_page(page0)
page=page0;% ԭ��ҳ
m=length(page0.components);% ��ҳ�����������仯
for i=1:m
    poly=page0.components{i,1}.polygon;% д�������
    x=poly.x;
    y=poly.y;
    [xc,yc,w,h]=cal_geo(x,y);% ���ü��β���
    rng('shuffle');% ��matlab��seed�ĳ�shuffle���ͻ���ݷ��صĵ�ǰʱ�����������
    r=0.1*randn(4,1);% ���ɸ�˹�ֲ�����������0.1�����Ըģ�Խ������Խ�������ĸ�����
    xc=xc+r(1);% ���ڵ������λ��
    yc=yc+r(2);
    w=w*(1+r(3));% ���ڵ��������С
    h=h*(1+r(4));
    x=[xc-w/2;xc+w/2;xc+w/2;xc-w/2];
    y=[yc-h/2;yc-h/2;yc+h/2;yc+h/2];
    if(x(1) > 0.51&&y(1) > 0.51&&x(2) < 1024&&y(3) < 1279)
        page.components{i,1}.polygon.x=x;% ֮ǰ�ö�ν��Խ��Խ�󣬷���ԭ����polygon��ʽ�õķֺŷָ���õĶ���
        page.components{i,1}.polygon.y=y;% �������֮������ʼ�����˱�����
    end
end
end