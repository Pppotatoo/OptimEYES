function res = precompute_values(components, I, d, p, o, c, a, g)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

if nargin <= 2
     a = 1; g = 1; d = 1; p = 1; o = 1; c = 1; 
end

A = [];
G = [];
D = zeros(length(components));
Px = zeros(length(components));
Py = zeros(length(components));
O = zeros(length(components));
C = zeros(length(components));
for i = 1:length(components)
    if a
        A = [A; abs(polygonArea([components{i}.polygon.x components{i}.polygon.y]))]; % area
    end
    if g
        G = [G; mean(mean(rgb2gray(extract_image_patch(components{i}, I))))/255]; % intensity
    end
    for j = i+1:length(components)
        if d
            D(i, j) = compute_distance(components{i}, components{j}, I); % distance
        end
        if p
             xy = compute_position(components{i}, components{j}, I); % position
             Px(i, j) = xy(1);
             Py(i, j) = xy(2);
        end
        if o
            O(i, j) = compute_orientation(components{i}, components{j}); % orientation
        end
        if c
            C(i, j) = compute_color(components{i},  components{j}, I); % color
        end
    end
end

D = D + D';
Px = Px + Px';
Py = Py + Py';
O = O + tril(mod(O' + 0.5, 1), -1);
C = C + C';

res.A = A;
res.G = G;
res.D = D;
res.Px = Px;
res.Py = Py;
res.O = O;
res.C = C;
end