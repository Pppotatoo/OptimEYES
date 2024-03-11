function Ereg=cal_Ereg(page1,page2)
   m=length(page1.components);
   C1=[];
   C2=[];
   for i=1:m
      [xc1,yc1,w1,h1]=cal_geo(page1.components{i}.polygon.x,page1.components{i}.polygon.y);
      [xc2,yc2,w2,h2]=cal_geo(page2.components{i}.polygon.x,page2.components{i}.polygon.y);
      color1=cal_color(page1.components{i},page1.img)/100;%考虑度量单位不同，需要归一化
      color2=cal_color(page2.components{i},page2.img)/100;
      C1=[C1,xc1,yc1,w1,h1,color1'];% 组件参数化,color是列向量，要转置
      C2=[C2,xc2,yc2,w2,h2,color2'];
   end
   Ereg=norm(C1-C2)/100000;
end
