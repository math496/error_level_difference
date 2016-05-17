function [ result, ksres ] = farid( filen, tol )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    
    imgDiff = sq_error_level_difference( filen );
    
    imgDiff = normalize_sq_diff( spatial_average( imgDiff, 64 ) );
    
    % ks test returns entires:
    %   1 if cdf1 and cdf2 from different distrubutions
    %   0 if we can't say cdf1 and cdf2 are from different dist.
    ksres = perform_kstest( imgDiff, 8, 8 );
    
    % Return 1 if sliced, 0 otherwise
    result = sum(sum(sum( ksres ) ) )/numel(ksres) >= tol;
    
    
end

