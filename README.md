# Adaptive-sharpen

Adaptive sharpen is an image sharpening shader written in HLSL that can be used by MPC-HC, MPDN or any other software that can use pixel shaders.
The shader tries to sharpen somewhat blurry edges the most, whilst avoiding sharpening near-flat areas and very sharp edges.
This leads to less banding, noise and ringing then a "regular" image sharpener.

It's tuned and designed for post resize. The shader <B>requires gamma light as input</B> and a <B>pixel shader of version 3 or higher</B>.

Settings are stored in the second pass file.
<i>curve_height</i> is the main knob for controlling sharpening strength.

<B>Caution!</B> If the shader passes are added in the wrong order or the alpha channel is truncated, it will return a green screen.

Forum thread - http://forum.doom9.org/showthread.php?t=172131
