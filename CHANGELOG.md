<B>2015-12-09</B> 
- Use a concave sharpening kernel for higher center edge values.
- For summation of pixels in the laplace kernel use a sRGB gamma approximation.


<B>2015-11-17</B> 
- Improved low threshold for sharpening.
- Linear light used for summation in the laplace kernel.
- Fixed tanh overflow.


<B>2015-09-23</B> 
- Limit low values for the "middle ring" of laplace weights.
- Misc changes.


<B>2015-08-19</B> 
- 2-pass algorithm.
- Better overshoot contol.
- Reduced saturation loss on pixels made brighter.


<B>2015-06-25</B> 
- Unrolls the sorting loop when compiled with ps 4.0+ (much better performance for ps 4.0+).
- Added fix for MPDN (alpha channel is always set to one).
- Style fixes.


<B>2015-05-15</B> 
- No real change from the last version, just changed some stupid variable names and comments.


<B>2015-04-05</B> 
- First release.
