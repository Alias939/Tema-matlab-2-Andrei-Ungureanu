function [ functia ] = fc( t,f0,fi,A,T )

l = length(t);
for i = 1:l
if mod(t(i),T) < T/5 
    functia(i) = 1;
else
    functia(i) = 0;
end
end

end

