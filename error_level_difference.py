#!/usr/bin/env python

from PIL import Image, ImageChops

# error_level_difference(string, int, int, int)
# filename: Filename of the image
# iterations: Number of iterations to run ELD.
# qualityV: Starting quality value. Diminishes over each iteration
# scale: Scales the pixel values. Makes differing artifacts easier to see.
# 
# ACKNOWLEDGEMENTS: Hany Farid, for his papers and 
#                   research on digital forensics
#
#                   Sungjoo Ha (shurain), for his 
#                   starting code on ELA.
# 
def error_level_difference(filename, iterations = 3, qualityV = 30, scale = 1 ):
    l = filename.split('.');
    if ( len(l) < 2 ):
        print("Not a valid filename")
        return
    newImageName = l[0] + "_temp." + l[1]
    
    image = Image.open(filename)
    image.save( newImageName, quality=qualityV )
    qualityV = qualityV - 20 if qualityV - 20 > 0 else qualityV 
    
    for iter in range(0, iterations-1):
        temp = Image.open( newImageName )
        temp.save( newImageName, quality=qualityV )
        qualityV = qualityV - 20 if qualityV - 20 > 0 else qualityV
    
    temp = Image.open( newImageName )
    
    diff = ImageChops.difference( image, temp )
    d = diff.load()
    
    width, height = diff.size
    
    for w in range( width ):
        for h in range( height ):
            d[ w, h ] = tuple( k*scale for k in d[w,h] )
    
    
    diff.save( l[0] + "_diff." + l[1], quality=100 );
