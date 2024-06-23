years = [2006:2021];  % 年份数据
birth_population = [9820, 9869, 9918, 9967, 10800, 10922, 10932, 11039, 11102, 11217, 11370, 11377, 11444, 11486, 11526, 11533];  % 出生人口数据（万人）
% 转换数据为列向量
years = years(:);
birth_population = birth_population(:);
% 构建线性模型
mdl = fitlm(years, birth_population);
% 预测未来10年的出生人口
future_years = (2022:2031)';
future_births = predict(mdl, future_years);
% 绘制数据和预测结果
figure;
hold on;
plot(years, birth_population, 'bo-', 'LineWidth', 2, 'MarkerSize', 8);
plot(future_years, future_births, 'ro--', 'LineWidth', 2, 'MarkerSize', 8);
xlabel('年份');
ylabel('出生人口数 (万人)');
title('出生人口预测');
legend('历史数据', '预测数据', 'Location', 'NorthWest');
grid on;
% 输出预测值和模型评估指标
disp('预测的未来10年出生人口：');
disp(array2table([future_years, future_births], 'VariableNames', {'Year', 'PredictedBirths'}));
% 显示模型的拟合质量指标
disp(['R-squared: ', num2str(mdl.Rsquared.Ordinary)]);
disp(['均方根误差: ', num2str(mdl.均方根误差)]);
% 显示线性回归线和方程
b = mdl.Coefficients.Estimate;
str = sprintf('y = %.2fx + %.2f', b(2), b(1));
text(2015, 10000, str, 'FontSize', 12, 'Color', 'black');
