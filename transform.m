function point = transform(lidarPoint,R,T)

% 点云旋转平移变换  
   for i=1:length(lidarPoint) 
       point(i,:) = R*lidarPoint(i,:)'+T;
   end
   
end