
function[gridMap]= grid_map(mapWidth,mapHeight,resolution,lidarPoint)

% mapWidth   地图宽度 (单位: 米)
% mapHeight  地图高度 (单位: 米)
% resolution  每米的栅格数 (resolution)

% 计算栅格地图的大小 (单位: 栅格)
gridSizeX = mapWidth * resolution;
gridSizeY = mapHeight * resolution;

% 初始化栅格地图 (全1表示空闲，0表示占据)
gridMap = ones(gridSizeY, gridSizeX);


% 将笛卡尔坐标转换为栅格坐标
gridCoordinates = ones(size(lidarPoint));
originX = mapWidth / 2;  % 假设地图中心是 (0, 0) 对应的世界坐标原点
originY = mapHeight / 2;

grid =descart2grid(lidarPoint,originX,originY,resolution);
for i=1:length(grid)
    gridMap(grid(i,1), grid(i,2)) = 0;  % 标记为占据
end

%     % 确保栅格坐标在地图范围内
%     if gridX >= 1 && gridX <= gridSizeX && gridY >= 1 && gridY <= gridSizeY
%         gridCoordinates(i, :) = [gridX, gridY];
%         gridMap(gridY, gridX) = 1;  % 标记为占据
%     end



end




