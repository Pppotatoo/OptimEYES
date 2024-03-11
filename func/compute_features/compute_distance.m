function hd = compute_distance(c1, c2, I)
% Directing User Attention via Visual Flow on Web Designs
% Xufang Pang*, Ying Cao*, Rynson W.H. Lau and Antoni B. Chan (*Joint first authors)
% ACM Trans. on Graphics (Proc. ACM SIGGRAPH Asia 2016), Dec. 2016

P1.x = c1.polygon.x; P1.y =  c1.polygon.y;
P2.x = c2.polygon.x; P2.y =  c2.polygon.y;
hd = min_dist_between_two_polygons(P1,P2)/norm([size(I, 1) size(I, 2)], 2);
% size（）：获取矩阵的行数和列数
% s=size(A),
% 当只有一个输出参数时，返回一个行向量，该行向量的第一个元素时矩阵的行数，第二个元素是矩阵的列数。
% [r,c]=size(A),
% 当有两个输出参数时，size函数将矩阵的行数返回到第一个输出变量r，将矩阵的列数返回到第二个输出变量c。
% size(A,n)如果在size函数的输入参数中再添加一项n，并用1或2为n赋值，则 size将返回矩阵的行数或列数。
% 其中r=size(A,1)该语句返回的时矩阵A的行数， c=size(A,2) 该语句返回的时矩阵A的列数。

% n = norm(A)
% n = norm(A,p) ，p - 范数
% A可以是向量、也可以是矩阵；根据p的不同，norm函数可计算几种不同类型的矩阵（向量）范数，1<p<+∞。
% 其中，n = norm(A) 与 n = norm(A,2)相同，都表示2范数，即缺省默认为2范数。
% 向量：1范数是值的绝对值加和
      % 2范数是通常意义上的模
      % 无穷范数是取向量中所有元素绝对值的最大值，即max(abs(A))
% 矩阵：1范数是返回矩阵A中最大一列和，即max(sum(abs(A))) 。
      % 2范数：就是通常意义上的模，即返回的是矩阵A的二范数，(矩阵A的2范数就是 A的转置矩阵乘以A特征根 最大值的开根号)
      % 无穷范数(inf)：返回矩阵A中元素绝对值最大一行和。

end