function result = FuncNoiSuy(xa, ya, pp)
    if(length(xa) ~= length(ya))
        fprintf('x và y BẮT BUỘC phải cùng độ dài');
    end

    syms x;

    switch(pp)
        case 1
            n = length(xa);
            d = ya;
            for i = 1:n
                for j = 1:i-1
                d(i) = (d(j) - d(i))/(xa(j) - xa(i));
                end
            end
            result = d(n);
            for i = n-1:-1:1
                result = result * (x - xa(i)) + d(i);
            end

        case 2
            n = length(xa);
            sum = 0;
            for i = 1:n
                product = ya(i);
                for j = 1:n
                    if i ~= j
                        product = product * (x - xa(j))/(xa(i) - xa(j));
                    end
                end
                sum = sum + product;
            end
            result = sum;                                           
    end 
end