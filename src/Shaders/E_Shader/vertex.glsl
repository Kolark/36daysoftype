varying vec2 vUv;
varying vec2 vDiff;
uniform float time;
void main() {
    vUv = uv;
    vec3 newPos = position;
    newPos -= vec3(50.,0.0,-50.);
    newPos*= 1.5;

    vec2 diff = newPos.xz - vec2(75.,-35.);
    vDiff = diff;
    vec3 finalPos = newPos;
    float smoothl = 15.;
    float value = smoothstep(length(diff)-smoothl,length(diff)+smoothl,90. + sin(time)*45.);
    finalPos.y += sin(value*15.)*15.;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(finalPos, 1.0 );
}