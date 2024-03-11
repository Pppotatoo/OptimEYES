function [kneighbors, nn] = find_nearest_neighbors(ei, ej, D, alpha)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016
% ��������A,����B��C=setdiff(A,B)��������������A��ȴ��������B�е�Ԫ�أ�����C�в������ظ�Ԫ�أ����Ҵ�С��������
Ns = setdiff(1:size(D, 1), [ei ej]);
if ~isempty(Ns)
    dist = D(ei, Ns);
    [~, idx_nn] = min(dist);
    kneighbors = Ns(dist <= alpha);
    nn = Ns(idx_nn);
else
    kneighbors = [];
    nn = [];
end
end