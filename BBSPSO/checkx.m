function x = checkx(x,ulim,llim,nop,dim)
for i=1:nop
    for j=1:dim
        if (x(i,j)<llim)
            x(i,j)=llim;
        end
        if (x(i,j)>ulim)
            x(i,j)=ulim;
        end
    end
end
end