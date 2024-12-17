function x = checkx(x)
global mu0min mu0max
%%
if x(:,1)<=mu0min
    x(:,1)=mu0min;
end
if mu0max<=x(:,1)
    x(:,1)=mu0max;
end
%%
if x(:,2)<=0
    x(:,2)=0;
end
if 1<=x(:,2)
    x(:,2)=1;
end
%%
if x(:,3)<=0
    x(:,3)=0;
end
if 1<=x(:,3)
    x(:,3)=1;
end
%%
if x(:,4)<=0
    x(:,4)=0;
end
if 1<=x(:,4)
    x(:,4)=1;
end
%%
if x(:,5)<=0
    x(:,5)=0;
end
if 1<=x(:,5)
    x(:,5)=0.6;
end
end