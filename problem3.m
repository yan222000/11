years = 2006:2021; % 年份
urban_birth_rate = [1.2, 1.3, 1.1, 1.5, 1.4, 1.6, 1.3, 1.5, 1.6, 1.7, 1.5, 1.6, 1.7, 1.8, 1.7, 1.8]; % 城市生育率
rural_birth_rate = [1.7, 1.8, 1.6, 1.9, 1.8, 2.0, 1.8, 1.9, 2.0, 2.1, 1.9, 2.0, 2.1, 2.2, 2.1, 2.2]; % 乡村生育率
urbanization_rate = [30, 31, 32, 33, 35, 36, 37, 38, 40, 41, 42, 44, 45, 47, 48, 50]; % 城镇化率
migration_rate = [5, 5.1, 5.2, 5.3, 5.5, 5.6, 5.7, 5.8, 6.0, 6.1, 6.2, 6.4, 6.5, 6.7, 6.8, 7.0]; % 流动人口比例
% 转换数据为列向量
years = years(:);
urban_birth_rate = urban_birth_rate(:);
rural_birth_rate = rural_birth_rate(:);
urbanization_rate = urbanization_rate(:);
migration_rate = migration_rate(:);
% 建立城市生育率模型
urban_model = fitlm([urbanization_rate, migration_rate], urban_birth_rate);
disp(urban_model);
% 建立乡村生育率模型
rural_model = fitlm([urbanization_rate, migration_rate], rural_birth_rate);
disp(rural_model);
% 模型预测
future_urbanization = [51, 52, 53, 54, 55]; % 未来城镇化率
future_migration = [7.1, 7.2, 7.3, 7.4, 7.5]; % 未来流动人口比例
future_urban_birth_rate = predict(urban_model, [future_urbanization(:), future_migration(:)]);
future_rural_birth_rate = predict(rural_model, [future_urbanization(:), future_migration(:)]);
% 显示预测结果
disp('Future Urban Birth Rates:');
disp(future_urban_birth_rate);
disp('Future Rural Birth Rates:');
disp(future_rural_birth_rate);
% 绘制城市生育率模型的原始数据和拟合线
figure;
plot(years, urban_birth_rate, 'bo', 'MarkerFaceColor', 'b'); % 原始数据点
hold on;
% 添加拟合线
fitted_values_urban = predict(urban_model, [urbanization_rate, migration_rate]);
plot(years, fitted_values_urban, 'r-', 'LineWidth', 2); % 拟合线
title('城市生育率与城镇化及流动人口关系');
xlabel('年份');
ylabel('城市生育率');
legend('实际生育率', '拟合生育率');
grid on;
% 绘制乡村生育率模型的原始数据和拟合线
figure;
plot(years, rural_birth_rate, 'go', 'MarkerFaceColor', 'g'); % 原始数据点
hold on;
% 添加拟合线
fitted_values_rural = predict(rural_model, [urbanization_rate, migration_rate]);
plot(years, fitted_values_rural, 'k-', 'LineWidth', 2); % 拟合线
title('乡村生育率与城镇化及流动人口关系');
xlabel('年份');
ylabel('乡村生育率');
legend('实际生育率', '拟合生育率');
grid on;
% 预测未来生育率的可视化
future_years = [2022, 2023, 2024, 2025, 2026]; % 假设未来五年
figure;
hold on;
plot(future_years, future_urban_birth_rate, 'ro-', 'LineWidth', 2, 'MarkerFaceColor', 'r'); % 城市生育率预测
plot(future_years, future_rural_birth_rate, 'go-', 'LineWidth', 2, 'MarkerFaceColor', 'g'); % 乡村生育率预测
title('未来五年生育率预测');
xlabel('年份');
ylabel('生育率');
legend('城市预测生育率', '乡村预测生育率');
grid on;
