%% 体素滤波器
function filtered_points = voxel_filter(points, voxel_size)
    % 输入：
    % points: 输入的点云数据 [N x 3] 矩阵，N 为点数，3 表示 x, y, z 坐标
    % voxel_size: 体素的大小，标量
    
    % 输出：
    % filtered_points: 经过体素滤波后的点云数据 [M x 3] 矩阵，M 为保留的点数

    % 将点云数据根据体素大小进行归一化处理
    voxel_indices = floor(points / voxel_size);

    % 使用唯一性函数来查找每个体素网格中的代表点
    [unique_voxel_indices, ~, idx] = unique(voxel_indices, 'rows');
    
    % 初始化代表点矩阵
    filtered_points = zeros(size(unique_voxel_indices));
    
    % 计算每个体素内所有点的质心作为代表点
    for i = 1:size(unique_voxel_indices, 1)
        % 获取属于同一体素的所有点
        points_in_voxel = points(idx == i, :);
        
        % 计算质心
        centroid = mean(points_in_voxel, 1);
        
        % 存储质心到代表点矩阵
        filtered_points(i, :) = centroid;
    end
end