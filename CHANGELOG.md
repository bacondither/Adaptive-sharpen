## 2017-12-30
- Cosmetic changes and minor improvements.


## 2017-11-01
- Small improvement for anti-ringing.
- Tweaks and minor changes.


## 2017-04-11
- Use compression instead of clipping for nmax_scale & nmin_scale.
- Tweaked saturation compensation.


## 2017-01-22
- Replaced the algorithm for saturation compensation.


## 2016-12-07
- Changed how saturation is compensated for when brightness is altered.
- Misc tweaks.


## 2016-09-24
- Updated edge-detection weights, slightly better for high-frequency content.
- Minor tweaks.


## 2016-07-10
- Replaced lerp used for overshoot compression with a weighted power mean, reduces some ringing.
- Corrected minor error in the custom smoothstep function.
- Slightly improved weighting for nmax & nmin.
- Tweaked some parameters.


## 2016-01-12
- Faster sorting algorithm.


## 2016-01-07
- Fixed compiler warning X3571 and handle a possible divide by zero.


## 2015-12-09
- Use a concave sharpening kernel for higher center edge values.
- For summation of pixels in the laplace kernel use a sRGB gamma approximation.


## 2015-11-17
- Improved low threshold for sharpening.
- Linear light used for summation in the laplace kernel.
- Fixed tanh overflow.


## 2015-09-23
- Limit low values for the "middle ring" of laplace weights.
- Misc changes.


## 2015-08-19
- 2-pass algorithm.
- Better overshoot control.
- Reduced saturation loss on pixels made brighter.


## 2015-06-25
- Unrolls the sorting loop when compiled with ps 4.0+ (much better performance for ps 4.0+).
- Added fix for MPDN (alpha channel is always set to one).
- Style fixes.


## 2015-05-15
- No real change from the last version, just changed some stupid variable names and comments.


## 2015-04-05
- First release.
