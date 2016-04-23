%% returns the deltaRow x deltaCol block matrix starting from the row x col
%  position
function [ returnBlock ] = getBlock( A, row, deltaRow, col, deltaCol )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    returnBlock = A( row:(row+deltaRow-1), col:(col+deltaCol-1), : );
    

end

