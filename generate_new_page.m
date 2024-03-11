function page=generate_new_page(page0)
page=page0;% 原网页
m=length(page0.components);% 网页组件数量不会变化
for i=1:m
    poly=page0.components{i,1}.polygon;% 写起来简便
    x=poly.x;
    y=poly.y;
    [xc,yc,w,h]=cal_geo(x,y);% 调用几何参数
    rng('shuffle');% 把matlab的seed改成shuffle，就会根据返回的当前时间生成随机数
    r=0.1*randn(4,1);% 生成高斯分布，参数调成0.1，可以改，越大噪声越大；生成四个噪声
    xc=xc+r(1);% 用于调整组件位置
    yc=yc+r(2);
    w=w*(1+r(3));% 用于调整组件大小
    h=h*(1+r(4));
    x=[xc-w/2;xc+w/2;xc+w/2;xc-w/2];
    y=[yc-h/2;yc-h/2;yc+h/2;yc+h/2];
    if(x(1) > 0.51&&y(1) > 0.51&&x(2) < 1024&&y(3) < 1279)
        page.components{i,1}.polygon.x=x;% 之前好多次结果越跑越大，发现原来的polygon格式用的分号分割，我用的逗号
        page.components{i,1}.polygon.y=y;% 修正标点之后结果开始慢慢彼变正常
    end
end
end