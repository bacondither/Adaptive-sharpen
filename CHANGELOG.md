2015-12-09 - Use a concave sharpening kernel for higher center edge values.
           - For summation of pixels in the laplace kernel use a sRGB gamma approximation.

2015-11-17 - Improved low threshold for sharpening.
           - Linear light used for summation in the laplace kernel.
           - Fixed tanh overflow.

2015-09-23 - Limit low values for the "middle ring" of laplace weights.
           - Misc changes.

2015-08-19 - 2-pass algorithm.
           - Better overshoot contol.
           - Reduced saturation loss on pixels made brighter.

2015-06-25 - Unrolls the sorting loop when compiled with ps 4.0+ (much better performance for ps 4.0+).
           - Added fix for MPDN (alpha channel is always set to one).
           - Style fixes.
2015-05-15 - No real change from the last version, just changed some stupid variable names and comments.

2015-04-05 - First release.