# Adaptive-sharpen

Adaptive sharpen is an image sharpening shader written in HLSL that can be used by MPC-HC or MPDN and other software that can use pixel shaders. The shader tries to sharpen somewhat blurry edges the most, whilst avoiding sharpening near-flat areas and very sharp edges. This leads to less banding, noise and ringing then a "regular" image sharpener.

It's tuned and designed for post resize and wants gamma light as input.

Settings are stored in the second pass file.
<i>curve_height</i> is the main knob for controlling sharpening strength.
 
Forum thread - http://forum.doom9.org/showthread.php?t=172131
