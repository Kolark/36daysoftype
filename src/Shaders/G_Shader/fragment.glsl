
uniform float time;
varying vec2 vUv;
varying float vR;
varying float vDeg;
varying float vF;

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
    vec3 color1 = vec3(newUv.y*vR*0.05,(vF+1.0)*0.5,newUv.y);
    vec3 color2 = rgb2hsb(color1);
    color2.r += vDeg*0.5;
    vec3 color3 = hsb2rgb(color2);
    color3.r *= (sin(newUv.y)+1.)*0.5*0.75;

    gl_FragColor = vec4(color3.xzy,1.0);
}