
uniform float time;
varying vec3 vNormal;
varying vec2 vUv;
void main() {
    vec2 newUv = vUv;
    vec3 color = abs(vNormal);
    float l = dot(vNormal,vec3(cos(time*1.25)*sin(time*2.5),cos(time),sin(time)));
    // color.xy *= newUv;
    color.z = cos(newUv.x*5. + time);
    vec3 finalColor = color*sin(l*15.);

    gl_FragColor = vec4(finalColor,1.0);
}