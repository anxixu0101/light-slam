function gridMap = drawGridMap(gridMap,grid)
% 将地图中的占据点画出，输出总体的栅格地图
% gridMap 初始化后的栅格地图
% grid 占据栅格的坐标

for i=1:length(grid)
    gridMap(grid(i,1), grid(i,2)) = 0;  % 标记为占据
end
end