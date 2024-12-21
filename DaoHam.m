function [dx]=DaoHam(fx,xi,yi,x,key,h)
%Khởi tạo thông số
if xi == 0 | yi == 0
    xi=x-3*h:h:x+3*h;
    yi=fx(xi);
end

%Chạy ct
switch(key)
    case 'Trung Tâm_Oh^2'
        dx=DaoHamCenterdOh2(xi,yi,x);
    case 'Lùi_Oh^2'
        dx=DaoHamBackwardOh2(xi,yi,x);
    case 'Tiến_Oh^2'
        dx=DaoHamForwardOh2(xi,yi,x);
    case 'Tiến_Oh'
        dx=DaoHamForwardOh(xi,yi,x);
    case 'Lùi_Oh'
        dx=DaoHamBackwardOh(xi,yi,x);
    otherwise
        dx = NaN;
end
    
function [dx]=DaoHamBackwardOh2(xi,yi,x)
h=xi(2)-xi(1);
n=(x-xi(1))/h+1;
n=cast(n,'uint16');%Vị trí của số cần tìm đạo hàm=x
dx=(yi(n-2)-4*yi(n-1)+3*yi(n))/(2*h);
end

function [dx]=DaoHamCenterdOh2(xi,yi,x)
h=xi(2)-xi(1);
n=(x-xi(1))/h+1;
n=cast(n,'uint16');%Vị trí của số cần tìm đạo hàm=x
dx=(-1*yi(n-1)+yi(n+1))/(2*h);
end

function [dx]=DaoHamForwardOh(xi,yi,x)
h=xi(2)-xi(1);
n=(x-xi(1))/h+1;
n=cast(n,'uint16');%Vị trí của số cần tìm đạo hàm=x
dx=(-1*yi(n)+yi(n+1))/h;
end

function [dx]=DaoHamBackwardOh(xi,yi,x)
h=xi(2)-xi(1);
n=(x-xi(1))/h+1;
n=cast(n,'uint16');%Vị trí của số cần tìm đạo hàm=x
dx=(-1*yi(n-1)+yi(n))/h;
end

function [dx]=DaoHamForwardOh2(xi,yi,x)
h=xi(2)-xi(1);
n=(x-xi(1))/h+1;
n=cast(n,'uint16');%Vị trí của số cần tìm đạo hàm=x
dx=(-3*yi(n)+4*yi(n+1)-yi(n+2))/(2*h);
end
end