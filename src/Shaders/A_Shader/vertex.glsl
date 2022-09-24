varying vec2 vUv;
uniform float time;
void main() {
    vUv = uv;

    vec3 newPos = position;
    newPos.y += sin(time*5.0 + position.z*cos(time*0.25)*0.25)*5.5;

    // newPos.x += cos(time*10.0 + position.y*sin(time*1.5))*0.5;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}