%% Scales delta matrix from uint8 to double precision.
%  for all d_i, 0 <= d_i <= 1
%  Equation 4 in Farid, Exposing Digital Forgeries...
function [ delta ] = normalize_sq_diff( delta )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    delta = im2double(delta);

end

