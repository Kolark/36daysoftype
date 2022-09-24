varying vec2 vUv;
uniform float time;
void main() {
    vUv = uv;

    vec3 newPos = position;
    newPos.xy += vec2(sin(distance(vec2(0.5),newPos.yz)*cos(time*.5)+ time* 8.),0.0);


    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}