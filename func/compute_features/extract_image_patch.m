function p = extract_image_patch(c, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

x = c.polygon.x; y = c.polygon.y;
% round�������뵽���������
% ð����Ҫ��;�����ɹ̶��������������������ĳ��ά�ȵĲ���/����Ԫ�ؽ����������������ع�Ϊ���������Լ����� for ѭ���ı߽硣
% ���I������ɶ��˼��ĳ�����г�����һ��a��b�ľ���
p = I(min(round(y)):max(round(y)),  min(round(x)):max(round(x)), :);
end