varying vec2 vUv;
uniform float time;
varying float vDist;
void main() {
    vUv = uv;
    float zPos = -70.;
    vec3 newPos = position;
    float dist = zPos - newPos.z;
    float val = smoothstep(40.,50.,abs(dist));
    newPos.y += mix(0.5,2.25,val)*15.0*sin(time*2.5);
    vDist = val;
    newPos.x += pow(cos(newPos.z*0.05 + time*1.5)*sin(newPos.z*0.05 + time),3.0)*15.0;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}