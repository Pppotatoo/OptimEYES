function [kneighbors, nn] = find_nearest_neighbors(ei, ej, D, alpha)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016
% 对于向量A,向量B，C=setdiff(A,B)函数返回在向量A中却不在向量B中的元素，并且C中不包含重复元素，并且从小到大排序。
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