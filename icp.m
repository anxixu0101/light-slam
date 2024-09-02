%% 前端算法

%% ICP匹配算法
function [R, T, aligned_points] = icp(target_points, source_points,R_init,T_init, max_iterations, tolerance)
    % ICP算法匹配点云
    % 输入:
    % target_points: 目标点云数据 (Nx3)
    % source_points: 源点云数据 (Mx3)
    % max_iterations: 最大迭代次数
    % tolerance: 收敛条件，两个迭代间的误差变化小于该值时停止
    
    % 输出:
    % R: 旋转矩阵
    % T: 平移向量
    % aligned_points: 对齐后的源点云

    % 初始化
    prev_error = Inf;
    N = size(source_points, 1);
    aligned_points = source_points;
    R = R_init;
    T = T_init;
    
    aligned_points = (R * aligned_points')' + T';
    
    for iter = 1:max_iterations
        % 1. 找到最近点
        distances = pdist2(aligned_points, target_points);
        [~, idx] = min(distances, [], 2);
        closest_points = target_points(idx, :);
        
        % 2. 计算质心
        centroid_source = mean(aligned_points, 1);
        centroid_target = mean(closest_points, 1);
        
        % 3. 去中心化
        source_centered = aligned_points - centroid_source;
        target_centered = closest_points - centroid_target;
        
        % 4. 计算协方差矩阵
        H = source_centered' * target_centered;
        
        % 5. SVD 分解
        [U, ~, V] = svd(H);
        
        % 6. 计算旋转矩阵 R
        R_iter = V * U';
        
        % 确保旋转矩阵无反射
        if det(R_iter) < 0
            V(:,3) = -V(:,3);
            R_iter = V * U';
        end
        
        % 7. 计算平移向量 T
        T_iter = centroid_target' - R_iter * centroid_source';
        
        % 8. 应用变换
        aligned_points = (R_iter * aligned_points')' + T_iter';
        
        % 更新总的旋转和平移
        R = R_iter * R;
        T = R_iter * T + T_iter;
        
        % 计算均方误差 (MSE)
        mean_error = mean(sqrt(sum((aligned_points - closest_points).^2, 2)));
        
        % 判断是否收敛
        if abs(prev_error - mean_error) < tolerance
            break;
        end
        
        prev_error = mean_error;
    end
end

