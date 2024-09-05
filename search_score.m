function [score] = search_score(target_points, source_points,R_init,T_init)

    score = Inf;
    N = size(source_points, 1);
    aligned_points = source_points;
    R = R_init;
    T = T_init;
    
    aligned_points = (R * aligned_points')' + T';
    
   
        %  找到最近点
        distances = pdist2(aligned_points, target_points);
        [~, idx] = min(distances, [], 2);
        closest_points = target_points(idx, :);
               
        % 计算均方误差 (MSE)
        mean_error = mean(sqrt(sum((aligned_points - closest_points).^2, 2)));
        
        score = mean_error;
    
end

