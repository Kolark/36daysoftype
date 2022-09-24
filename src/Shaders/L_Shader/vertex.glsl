varying vec2 vUv;
uniform float time;

varying float vR;
varying float vDeg;
varying float vF;
void main() {
    vUv = uv;
    vec3 newPos = position;

    vec2 diff = vec2(75.,-75.) - newPos.xz;

    float r = length(diff);
    float deg = atan(diff.y,diff.x);
    float f = 10. - round(sin(1.*deg + time*3.));

    vR = r;
    vDeg = deg;
    vF = f;

    newPos.y += f*7.5;
    newPos.y -= 80.;
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}