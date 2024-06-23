years = [2006:2021]';  % 年份数据，作为自变量
birth_population = [9820, 9869, 9918, 9967, 10800, 10922, 10932, 11039, 11102, 11217, 11370, 11377, 11444, 11486, 11526, 11533]';  % 出生人口数据，作为因变量
% 构建线性模型
mdl = fitlm(years, birth_population);
% 模型拟合结果和统计指标
disp(mdl);
% 绘制残差图以检查残差的分布和异方差性
figure;
plotResiduals(mdl, 'fitted');
title('残差图');
% 绘制Q-Q图检查残差的正态分布
figure;
qqplot(mdl.Residuals.Raw);
title('残差的Q-Q图');
% 模型的统计性能指标
disp(['R-squared: ', num2str(mdl.Rsquared.Ordinary)]);
disp(['Adjusted R-squared: ', num2str(mdl.Rsquared.Adjusted)]);
disp(['均方根误差: ', num2str(mdl.均方根误差)]);
% 潜在的模型改进
% 对因变量进行对数变换尝试改进模型
mdl_improved = fitlm(years, log(birth_population));
disp(mdl_improved);
disp(['Improved 均方根误差: ', num2str(mdl_improved.均方根误差)]);
% 绘制改进后的模型残差图
figure;
plotResiduals(mdl_improved, 'fitted');
title('改进后的残差图');
% 绘制改进模型的Q-Q图
figure;
qqplot(mdl_improved.Residuals.Raw);
title('改进后的残差的Q-Q图');
