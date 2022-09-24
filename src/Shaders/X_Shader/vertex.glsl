varying vec2 vUv;
uniform float time;
varying float vVal;
void main() {
    vUv = uv;
    vec2 defaultVec = vec2(50.+cos(time*2.45)*50.,-50.+sin(time*2.45)*50.);
    vec3 newPos = position;

    vec2 diff = defaultVec - newPos.xz;

    float sValue = (sin(length(diff)*0.15 + time*2.5)+1.0)*0.5;
    vVal = sValue;
    float a = 10.;
    newPos.y += sValue*15.;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}