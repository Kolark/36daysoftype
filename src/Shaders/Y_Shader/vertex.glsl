varying vec2 vUv;
uniform float time;

varying float vDisplace;
void main() {
    vUv = uv;
    vec3 defaultVec = vec3(50.+sin(time*2.5)*25.,0.,-50. + cos(time*2.5)*25.);
    vec3 newPos = position;
    vec3 diff = defaultVec - newPos;
    float disp = smoothstep(20.,60.,length(diff))*sin(time);
    vDisplace = disp;
    newPos+= normalize(diff)*25.0*disp;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}