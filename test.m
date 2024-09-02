% 清理环境
clear;
clc;

% 读取rosbag文件
bag = rosbag('museum.bag'); % 请将 'path_to_your_bag_file.bag' 替换为实际文件路径

% 选择话题
topic = select(bag, 'Topic', '/horizontal_laser_2d');

% 提取消息
msgs = readMessages(topic, 'DataFormat', 'struct');

% 初始化数组来存储读取的数据
numMessages = length(msgs);
allRanges = cell(numMessages, 1);
allIntensities = cell(numMessages, 1);
timeStamps = zeros(numMessages, 1);

% 读取每一条消息
for i = 1:numMessages
    % 提取雷达数据的范围和强度
    allRanges{i} = msgs{i}.Ranges;
    allIntensities{i} = msgs{i}.Intensities;
    
    % 获取时间戳
    timeStamps(i) = bag.MessageList{i, 2};  % 获取时间戳
end

% 示例: 打印第一个消息的范围和强度
disp('第一个消息的范围:');
disp(allRanges{1});

disp('第一个消息的强度:');
disp(allIntensities{1});

disp('时间戳:');
disp(timeStamps(1));

% 你可以在这里添加进一步的数据处理和分析

