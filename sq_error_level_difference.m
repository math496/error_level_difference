%% 
function [ diff ] = sq_error_level_difference( filename )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    % Open image
    orig = imread(filename);
    
    % filename string operations...
    %mod_filename = get_modified_filen(filename, '_mod.' );
    
    %{
    % Save new image as original image with 50% quality
    imwrite( orig, mod_filename, 'Quality', 50);
    % for i = 0..count
    mod_img = [];
    for index = 1:3
        mod_img = imread( mod_filename );
        imwrite( mod_img, mod_filename, 'Quality', 50 );
    end
        % save modified image as newly modified image with 50% quality
        % open newly modified image as modified image
    
    mod_img = imread( mod_filename );
    %}
    
    mod_img = compress_image( orig );
    
    diff = ( orig - mod_img ).^2;
    %mod_filename = get_modified_filen( filename, '_diff.' ); 
    % solve ( original - most modified ).^2
    
    %imwrite( diff, mod_filename );
    
    % save to disk
    % or return value

end

%%
function [ mod_filen ] = get_modified_filen( filename, splice_in )

    mod_filen = strsplit( filename, '.' );
    mod_filen = [ mod_filen(1:end-1), splice_in, mod_filen(end) ];
    mod_filen = strjoin(mod_filen, '');

end
