
uniform float time;
varying vec2 vUv;
void main() {
    vec2 newUv = vUv;
    float dist = distance(newUv,vec2(0));
    float a = abs(sin(dist*2.5+time));
    float b = abs(cos(dist*1.5+time));
    float c = (cos(time)+1.0)/2.0;
    vec3 finalColor = vec3(a,b,c);
    gl_FragColor = vec4(finalColor,1.0);
}