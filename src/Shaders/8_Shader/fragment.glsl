
uniform float time;
varying vec2 vUv;

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

varying float vA;
varying float vB;
varying float vM;

void main() {
    vec2 newUv = vUv;
    vec3 colorA = vec3(max(0.5,vA)*newUv.x,max(vB,0.5)*newUv.y,0.15);
    vec3 colorHSB = rgb2hsb(colorA);
    colorHSB.b *= (sin(newUv.x + newUv.y)+1.0)*0.5;
    colorHSB.r += 0.15;
    vec3 colorB = hsb2rgb(colorHSB);
    gl_FragColor = vec4(mix(colorA,colorB,vM),1.0);
}