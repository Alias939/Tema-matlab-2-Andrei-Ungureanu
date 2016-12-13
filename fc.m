function [ functia ] = fc( t,f0,fi,A,T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



%functia = sawtooth(2*pi*f0*t + fi, 0.5);
l = length(t);
for i = 1:l
if mod(t(i),T) < T/5 
    functia(i) = 1;
else
    functia(i) = 0;
end
end

end

