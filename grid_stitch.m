
function grid = grid_stitch(gridMap,lidarPoint,originX,originY,resolution,...
                           gridSizeX,gridSizeY)
%% 实现雷达点云和栅格地图进行拼接
% lidarPoint: 经过最佳RT变化后的雷达点云
% gridMap: 原栅格地图
gridPosition =find_occ(gridMap);
lidar2Grid= descart2grid(lidarPoint,originX,originY,resolution,gridSizeX,gridSizeY);
grid=[gridPosition;lidar2Grid];

end

function gridPosition =find_occ(gridMap)
%% 找到栅格地图中占据的坐标
[row,col] = find(gridMap == 0);
gridPosition=[row,col];
end