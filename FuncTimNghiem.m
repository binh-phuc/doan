function [n, x] = FuncTimNghiem(fx, fp, a, b, es, pp)
    % Kiểm tra khoảng đầu vào
    if a >= b
        error('a phải nhỏ hơn b');
    end

    % Khởi tạo số lần lặp
    n = 0;
    
    switch(pp)
        case 1
            % Phương pháp chia đôi
            while (1)
                c = (a + b) / 2; 
                n = n + 1;
                if fx(c) * fx(a) < 0 
                    b = c; 
                else
                    a = c;
                end
                if b - a < es
                    x = (a + b) / 2;
                    break;
                end
            end

        case 2
            x0 = (a + b) / 2; 
            while (1)
                x1 = fp(x0); 
                n = n + 1;
                if abs(x1 - x0) < es 
                    x = x1;
                    break; 
                end
                x0 = x1;
            end

        case 3
            syms x_sym;
            dfx = matlabFunction(diff(fx(x_sym), x_sym)); 
            x0 = (a + b) / 2;
            while (1)
                if dfx(x0) == 0
                    error('Đạo hàm bằng 0, không thể tiếp tục.');
                end
                x1 = x0 - fx(x0) / dfx(x0);
                n = n + 1; 
                if abs(x1 - x0) < es
                    x = x1;
                    break; 
                end
                x0 = x1; 
            end

        otherwise
            error('Phương pháp không hợp lệ');
    end
end
