varying vec2 vUv;
uniform float time;
void main() {
    vUv = uv;
    vec3 newPos = position;
    vec3 dif = normalize(newPos - vec3(sin(time*5.),cos(time*5.),0));
    vec3 dotCalc = dif*sin(newPos.x*dif.z*(cos(time)*0.5) + time*10.)*4.5;
    
    vec3 finalPos = newPos + dotCalc;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}