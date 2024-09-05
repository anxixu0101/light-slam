%% 多分辨率ICP

function [R, T] = multi_icp(target_points, ...
    source_points,max_iterations, tolerance,voxel_size)
numscale=1;
R_init = eye(2); % 初始化为3x3单位矩阵
T_init = zeros(2, 1); % 初始化为3x1零向量
for resoluation=voxel_size:-0.02:0.02
    target_points_1 = voxel_filter(target_points, resoluation);
    source_points_1 = voxel_filter(source_points, resoluation);
    
    [R_init,T_init] = icp(target_points_1, source_points_1,R_init,T_init, max_iterations, tolerance);
    
    
end
R = R_init;
T = T_init;


end