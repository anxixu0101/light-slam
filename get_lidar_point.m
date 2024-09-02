function laserPoint = get_lidar_point(laser_data,point_index)
first_data = laser_data{point_index};
num_points = length(first_data.Ranges);
% 计算每个雷达点的坐标
for i = 1:num_points
    angle = first_data(1).AngleMin + (i - 1) * first_data(1).AngleIncrement;

    if (first_data(1).Ranges(i) * cos(angle) ~= inf && first_data(1).Ranges(i) * cos(angle)~= -inf) ...
             && (first_data(1).Ranges(i) * sin(angle)~= inf ...
             && first_data(1).Ranges(i) * sin(angle)~= -inf )...
             
         if point_index == 1
             ref_x(i)=first_data(1).Ranges(i) * cos(angle);
             ref_y(i)=first_data(1).Ranges(i) * sin(angle);
    end
         
    x_coords(i) = first_data(1).Ranges(i) * cos(angle);
    y_coords(i) = first_data(1).Ranges(i) * sin(angle);
    end
end

laser_point =[x_coords;y_coords];
laserPoint = laser_point';
end