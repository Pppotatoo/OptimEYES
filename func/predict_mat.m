function M = predict_mat(components, I, model)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

% precompute the quantities required to compute features
res = precompute_values(components, I);
 
M = zeros(length(components));
for i = 1:length(components)
    for j = 1:length(components)
        if i ~= j
            % compute features
            f = features(i, j, res);
            % normalization
            f = (f' - model.Xmean)./model.Xstd;
            if ~isempty(model.whMat)
                % whitening
                f = f*whMat;
            end
            % make prediction
            y =regRF_predict(f, model);
            M(i, j) = y;
        end
    end
end
end