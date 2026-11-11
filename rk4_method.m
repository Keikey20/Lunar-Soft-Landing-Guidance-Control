function [t,x,others] =rk4_method(ufunc,t0,x0,time,paramat)
%%altitude%%
rf = paramat.rf;
%%Numerical integration%%
t(1) = t0;
x(:,1) = x0;
h = 0.01;
%%RK4%%
for b=1:time/h
        t(b+1)=t(b)+h;
        k1=ufunc(t(b),x(:,b),paramat,b);
        k2=ufunc(t(b)+h/2,x(:,b)+h*k1/2,paramat,b);
        k3=ufunc(t(b)+h/2,x(:,b)+h*k2/2,paramat,b);
        k4=ufunc(t(b)+h,x(:,b)+h*k3,paramat,b);
        x(:,b+1)=x(:,b)+h*(k1+2*k2+2*k3+k4)/6;
        [dx(:,b),others(:,b)]=ufunc(t(b),x(:,b),paramat,b);
        dylast=others(1:2,end);
        assignin('base',"dylast",dylast);
            Judgment_criteria = x(4,b);
        if Judgment_criteria - rf < 0
            break
        end
end
%%stop%%
toc
