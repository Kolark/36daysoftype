
uniform float time;
varying vec2 vUv;
varying float vB;
void main() {
    vec2 newUv = vUv;
    vec3 defColor = vec3(length(vec2((sin(time)+1.0)*0.5,(cos(time)+1.0)*0.5) - newUv));
    vec3 defColor2 = vec3(newUv.x,((sin((newUv.x)*12.5))+1.0)*0.5,newUv.y);
    gl_FragColor = vec4(mix(defColor,defColor2,vB),1.0);
}