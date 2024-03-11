function [X, Xp, Xc] = features(i, j, res)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

%Pair-wise features
a = res.A(i)/res.A(j); %Scale ratio
d = res.D(i, j);  %Normalized distance
p = [res.Px(i, j) res.Py(i, j)]'; %Normalized position
o = res.O(i, j); % Relative orientation
b = res.G(i)/res.G(j);%Relative intensity
c = res.C(i, j); %Color contrast
Xp = [a; d; p; o; b; c(:)];

%Context features
Xc = [];
%Find the nearest neighbors
[kneighbors, nn] = find_nearest_neighbors(i, j, res.D, 0.4);

if ~isempty(kneighbors) && ~isempty(nn)      
    %Normalized distance to nearest neighbor
    d = res.D(i, nn);
    %Relative orientation to nearest neighbor
    o = res.O(i, nn);
    %Ratio between the sizes of the current element and its largest
    %neighbors
    nn_sizes = res.A(kneighbors);
    a = res.A(i)/max(nn_sizes);
    %Ratio between the brightness of the current element to that of its brightest neighbor
    nn_brightness = res.G(kneighbors);
    b = res.G(i)/max(nn_brightness);
    Xc = [d; o; a; b];
end
X = [Xp; Xc];
end