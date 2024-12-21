function g = auto_convert_fx_to_gx(f_sym, alpha)
    if nargin < 2
        alpha = 0.1; % Giá trị alpha mặc định
    end
    syms x;
    % Chuyển f(x) thành g(x)
    g_sym = x - alpha * f_sym; % Biểu diễn g(x) = x - alpha*f(x)

    % Tính đạo hàm g'(x)
    dg_sym = diff(g_sym, x);

    % Chuyển g(x) sang dạng function handle
    g = matlabFunction(g_sym);
end