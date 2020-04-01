clear; clc; clf;
dt = 0.02;
p0 = 10; v0 = 0; t0 = 0;  
tmax = 10;
figure
hold on
coef1 = input('Please input a in [0,1]: ');
coef2= input('Please input dk in [0.1,1]: ');
a = coef1(1);dk=coef2(1);
for k =0:dk:1
    p = p0; v = v0; t = t0; M = []; T = [];
    while t < tmax
        v = v - a*dt;
        p = p + k*v*dt;
        if p<0
            p=0;
            v=-v;
        end
        t = t + dt;
        T = [T,t]; % expand T when necessary. This is slow.
        M = [M,p]; % expand M when necessary. This is slow.
    end
    plot(T, M,'LineWidth',3);
    hold on;
    
end
