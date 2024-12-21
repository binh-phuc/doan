function KQ = FuncTichPhan(x, y, fx, N, a, b, pp)

    switch (pp)
        case '1'  % Quy tac hinh thang
            if isempty(x) || isempty(y) || any(isnan(x)) || any(isnan(y))  % N?u không có b?ng d? li?u
                h = (b - a) / N;
                x_vals = a:h:b;
                KQ = (h / 2) * (fx(a) + fx(b) + 2 * sum(fx(x_vals(2:end-1))));
            else  % N?u có b?ng d? li?u
                n = length(x) - 1;
                h = (x(end) - x(1)) / n;
                KQ = (h / 2) * (2 * sum(y) - y(1) - y(end));
            end

        case '2' % Quy tắc 1/3 Simpson
            if isempty(x) || isempty(y) 
                if mod(N, 2) ~= 0
                    N = N + 1;
                end
                h = (b - a) / N;
                x_vals = a + (0:N) * h;
                fx_vals = fx(x_vals);
                KQ = (h / 3) * (fx_vals(1) + fx_vals(end) + 4 * sum(fx_vals(2:2:N)) + 2 * sum(fx_vals(3:2:N-1)));
            else  % N?u có b?ng d? li?u
                n = length(x) - 1;
                h = (x(end) - x(1)) / n;
                KQ = (h / 3) * (y(1) + y(end) + 4 * sum(y(2:2:end)) + 2 * sum(y(3:2:end-1)));
            end

        case '3' % Quy t?c 3/8 Simpson
            if isempty(x) || isempty(y)  % N?u không có b?ng d? li?u
                if mod(N, 3) ~= 0
                    N = N + 3 - mod(N, 3);
                end
                h = (b - a) / N;
                x_vals = a:h:b;
                fx_vals = fx(x_vals);
                KQ = (3 * h / 8) * (fx_vals(1) + fx_vals(end) + ...
                    3 * sum(fx_vals(2:3:end)) + ...
                    3 * sum(fx_vals(3:3:end-1)) + ...
                    2 * sum(fx_vals(4:3:end-2)));
            else  % N?u có b?ng d? li?u
                n = length(x) - 1;
                h = (x(end) - x(1)) / n;
                KQ = (3 * h / 8) * (y(1) + y(end) + 3 * sum(y(2:3:end)) + ...
                    3 * sum(y(3:3:end-1)) + 2 * sum(y(4:3:end-2)));
            end
    end
end