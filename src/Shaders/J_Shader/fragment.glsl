
uniform float time;
varying vec2 vUv;

varying float vYValue;
varying float vxValue;
varying float vsValue;
void main() {
    vec2 newUv = vUv;
    vec3 color1 = vec3(vYValue,vxValue,newUv.x*newUv.y);
    vec3 color2 = vec3(length(vec2(0.5,0.5)-newUv));
    vec3 finalColor = mix(color1,color2,vsValue);
    gl_FragColor = vec4(finalColor,1.0);
}