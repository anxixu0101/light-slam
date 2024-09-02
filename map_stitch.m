%% 形成地图
function [map_matrix] = map_stitch(rotate,transform,point,map)
% 点云拼接成地图函数
% rotate: 旋转矩阵    3*3
% transform: 平移矩阵  3*1
% point:  待拼接的点云 N*3
% map:    拼接后形成的地图 N*3
for i=1:length(point)
    after_rotate(i,:) = rotate*point(i,:)'; %将点云旋转后加入地图
    after_rotate(i,:)= after_rotate(i,:)+transform(1,:);   
end
    map=[map;after_rotate];
    map_matrix = map;

end
