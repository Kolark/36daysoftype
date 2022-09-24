
uniform float time;
varying vec2 vUv;
varying vec2 vDiff;
void main() {
    vec2 newUv = vUv;
    newUv -= vec2(0.5,0.5);

    float stValue = (sin(time)+1.0)*0.5;
    float v1 = smoothstep(stValue-0.15,stValue+0.15,length(newUv));
    float v2 = (sin(length(newUv)*10.*cos(time*1.5)+time)+1.0)*0.5;
    gl_FragColor = vec4(vec3(v1,v2,mod(0.5,vUv.x)),1.0);
}