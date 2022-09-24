
uniform float time;
varying vec2 vUv;
varying float vVar;

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

float sinT(float f){
    return sin(time*f);
}
float sinTMap(float f,float min, float max){
    return map(sin(time*f),-1.,1.,min,max);
}

float cosT(float f){
    return cos(time*f);
}
float cosTMap(float f,float min, float max){
    return map(cos(time*f),-1.,1.,min,max);
}

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
    float a = sinTMap(1.0,0.0,1.0);
    float a2 = sinTMap(1.5,0.0,1.0);
    float b = cosTMap(1.0,0.0,1.0);
    float b2 = cosTMap(1.35,0.0,1.0);
    vec2 defaultVec1 = vec2(a,b);
    vec2 defaultVec2 = vec2(b,a);
    vec2 defaultVec3 = vec2(-a2,b2);

    vec3 colorA = vec3(length(newUv-defaultVec1),length(newUv-defaultVec2),length(newUv-defaultVec3));

    vec3 colorHSB = hsb2rgb(colorA);

    colorHSB.r += vVar;

    vec3 colorB = hsb2rgb(colorHSB);

    // vec3 colorA = vec3();
    gl_FragColor = vec4(mix(colorA,colorB,vVar),1.0);
}