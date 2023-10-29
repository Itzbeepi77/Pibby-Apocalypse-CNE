#pragma header
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

uniform int invert; // 0 means no original color 1 means invert
void mainImage(){
vec2 uv = openfl_TextureCoordv.xy;

vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
    vec4 color = texture(iChannel0, fragCoord.xy/iResolution.xy);
    if(invert == 0) {
        fragColor = color;
    } else {
    fragColor = vec4(flixel_texture2D(iChannel0,uv).a-color.rgb,flixel_texture2D(iChannel0,uv).a);
    }
}