function y=Constrain(x,x_min,x_max)
if x>x_max
    y=x_max;
elseif x<x_min
    y=x_min;
else
    y=x;
end
end


    
    
        