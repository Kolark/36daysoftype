
uniform float time;
varying vec2 vUv;
varying vec3 vStepValue;

vec3 rgb2hsb( in vec3 c ){
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz),
                 vec4(c.gb, K.xy),
                 step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r),
                 vec4(c.r, p.yzx),
                 step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)),
                d / (q.x + e),
                q.x);
}

//  Function from Iñigo Quiles
//  https://www.shadertoy.com/view/MsS3Wc
vec3 hsb2rgb( in vec3 c ){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0),
                             6.0)-3.0)-1.0,
                     0.0,
                     1.0 );
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}


void main() {
    vec2 newUv = vUv;
    vec3 color1 = vec3(newUv.yx,1.0);
    vec3 rgbColor1 = hsb2rgb(color1);
    float a = (sin((vStepValue.x+newUv.y) *2.0)+1.0)/2.0;

    float positiveSine = ((sin(time*5.0)+1.0)/2.0);


    vec3 finalColor = vec3(mod(rgbColor1.xy,positiveSine*5.0),smoothstep(0.25,0.75,a));
    gl_FragColor = vec4(finalColor,1.0);
}