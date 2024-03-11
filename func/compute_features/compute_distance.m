function hd = compute_distance(c1, c2, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

P1.x = c1.polygon.x; P1.y =  c1.polygon.y;
P2.x = c2.polygon.x; P2.y =  c2.polygon.y;
hd = min_dist_between_two_polygons(P1,P2)/norm([size(I, 1) size(I, 2)], 2);
% size��������ȡ���������������
% s=size(A),
% ��ֻ��һ���������ʱ������һ�������������������ĵ�һ��Ԫ��ʱ������������ڶ���Ԫ���Ǿ����������
% [r,c]=size(A),
% ���������������ʱ��size������������������ص���һ���������r����������������ص��ڶ����������c��
% size(A,n)�����size��������������������һ��n������1��2Ϊn��ֵ���� size�����ؾ����������������
% ����r=size(A,1)����䷵�ص�ʱ����A�������� c=size(A,2) ����䷵�ص�ʱ����A��������

% n = norm(A)
% n = norm(A,p) ��p - ����
% A������������Ҳ�����Ǿ��󣻸���p�Ĳ�ͬ��norm�����ɼ��㼸�ֲ�ͬ���͵ľ���������������1<p<+�ޡ�
% ���У�n = norm(A) �� n = norm(A,2)��ͬ������ʾ2��������ȱʡĬ��Ϊ2������
% ������1������ֵ�ľ���ֵ�Ӻ�
      % 2������ͨ�������ϵ�ģ
      % �������ȡ����������Ԫ�ؾ���ֵ�����ֵ����max(abs(A))
% ����1�����Ƿ��ؾ���A�����һ�кͣ���max(sum(abs(A))) ��
      % 2����������ͨ�������ϵ�ģ�������ص��Ǿ���A�Ķ�������(����A��2�������� A��ת�þ������A������ ���ֵ�Ŀ�����)
      % �����(inf)�����ؾ���A��Ԫ�ؾ���ֵ���һ�к͡�

end