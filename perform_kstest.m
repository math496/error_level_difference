function [ ksResults ] = perform_kstest( img, deltaRow, deltaCol )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    %deltaCol = 8;
    %deltaRow = 8;
    
    index = 1; jindex = 1;
    
    rowIndex = 1;
    
    [ rowSize, colSize, colorSize ] = size(img);
    ksResults = zeros( rowSize/deltaRow, colSize/deltaCol, colorSize );
    
    % Iterating across the rows... we'll fix on one set of rows
    while (rowIndex + deltaRow) <= rowSize
        
        colIndex = 1;
        jindex = 1;
        % Iterating across one row, we'll iterate over a set of columns
        while colIndex <= colSize
            
            block1 = getBlock( img, rowIndex, deltaRow, colIndex, deltaCol);
            block2 = getBlock( img, rowIndex+deltaRow, deltaRow, colIndex, deltaCol );
            
            % We have 2 blocks of rows and cols, iterate over their 
            % sub matrices.. 
            for colorIndex = 1:3
                
                [ count1, ~ ] = imhist( block1( :, :, colorIndex ) );
                [ count2, ~ ] = imhist( block2( :, :, colorIndex ) );
                
                cdf1 = cumsum( count1 ) / sum( count1 );
                cdf2 = cumsum( count2 ) / sum( count2 );
                
                ksResults( index, jindex, colorIndex ) = ...
                    kstest2( cdf1, cdf2, 'Alpha', 0.05 );
                
            end
            
            colIndex = colIndex + deltaCol;
            jindex = jindex + 1;
            
        end
        
        rowIndex = rowIndex + deltaRow;
        index = index + 1;
        
    end

end

