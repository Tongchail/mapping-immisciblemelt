% ====================================================
% Scale bar 辅助函数（放在脚本末尾或单独文件）
% ====================================================
function add_scale_bar(ax, X, Z, bar_length_um)
    bar_length_mm = bar_length_um / 1000;
    x_extent = abs(X(end) - X(1));
    z_extent = abs(Z(end) - Z(1));
    x_max = max(X(1), X(end));
    x_start = x_max - 0.1 * x_extent - bar_length_mm;

    if strcmp(get(ax,'YDir'),'normal')
        z_visual_bottom = min(Z(1), Z(end));
        z_pos = z_visual_bottom + 0.05 * z_extent;
        text_valign = 'bottom';
    else
        z_visual_bottom = max(Z(1), Z(end));
        z_pos = z_visual_bottom - 0.05 * z_extent;
        text_valign = 'bottom';
    end

    hold(ax, 'on');
    line(ax, [x_start, x_start + bar_length_mm], [z_pos, z_pos], ...
        'Color', 'white', 'LineWidth', 3);
    text(ax, x_start + bar_length_mm/2, z_pos, ...
        [num2str(bar_length_um), ' \mum'], ...
        'Color', 'white', ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', text_valign, ...
        'FontSize', 10, 'FontWeight', 'bold');
    hold(ax, 'off');
end