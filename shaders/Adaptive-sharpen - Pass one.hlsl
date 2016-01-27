// $MinimumShaderProfile: ps_3_0

// Copyright (c) 2015-2016, bacondither
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer
//    in this position and unchanged.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHORS ``AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
// OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
// IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
// NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
// THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// First pass, MUST BE PLACED IMMEDIATELY BEFORE THE SECOND PASS IN THE CHAIN

// Adaptive sharpen - version 2016-01-12 - (requires ps >= 3.0)
// Tuned for use post resize, EXPECTS FULL RANGE GAMMA LIGHT

sampler s0 : register(s0);
float2 p1  : register(c1);

//---------------------------------------------------------------------------------
#define w_offset 2.0         // Edge channel offset, must be the same in all passes
//---------------------------------------------------------------------------------

// Get destination pixel values
#define get(x,y)  ( saturate(tex2D(s0, tex + float2(x*(p1[0]), y*(p1[1]))).rgb) )

// Compute diff
#define b_diff(z) ( abs(blur-c[z]) )

float4 main(float2 tex : TEXCOORD0) : COLOR {

	// Get points and clip out of range values (BTB & WTW)
	// [                c9                ]
	// [           c1,  c2,  c3           ]
	// [      c10, c4,  c0,  c5, c11      ]
	// [           c6,  c7,  c8           ]
	// [                c12               ]
	float3 c[13] = { get( 0, 0), get(-1,-1), get( 0,-1), get( 1,-1), get(-1, 0),
	                 get( 1, 0), get(-1, 1), get( 0, 1), get( 1, 1), get( 0,-2),
	                 get(-2, 0), get( 2, 0), get( 0, 2) };

	// Blur, gauss 3x3
	float3 blur   = (2*(c[2]+c[4]+c[5]+c[7]) + (c[1]+c[3]+c[6]+c[8]) + 4*c[0])/16;
	float  blur_Y = (blur.r/3 + blur.g/3 + blur.b/3);

	// Contrast compression, center = 0.5, scaled to 1/3
	float c_comp = saturate(0.266666681f + 0.9*pow(2, (-7.4*blur_Y)));

	// Edge detection
	// Matrix weights
	// [         1/4,        ]
	// [      1,  1,  1      ]
	// [ 1/4, 1,  1,  1, 1/4 ]
	// [      1,  1,  1      ]
	// [         1/4         ]
	float edge = length( b_diff(0) + b_diff(1) + b_diff(2) + b_diff(3)
	                   + b_diff(4) + b_diff(5) + b_diff(6) + b_diff(7) + b_diff(8)
	                   + 0.25*(b_diff(9) + b_diff(10) + b_diff(11) + b_diff(12)) );

	return float4( (tex2D(s0, tex).rgb), (edge*c_comp + w_offset) );
}