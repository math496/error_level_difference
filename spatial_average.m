%% Returns spatial average of matrix with n x n block size
function [ res ] = spatial_average( img_diff, sqBlockSize )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    
    h = fspecial( 'average', sqBlockSize );
    
    res = imfilter( img_diff, h );
    
end

