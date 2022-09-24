varying vec2 vUv;
uniform float time;
varying float vVar;
void main() {
    vUv = uv;
    vec2 defaultVec = vec2(70.,-50.);
    vec3 newPos = position;
    vec2 diff = defaultVec - newPos.xz;
    float x = round((length(diff*(sin(time*2.5)*0.01)))*10.0)/10.0;
    vVar = x;
    newPos.y += pow(x+0.15,3.0)*55.*sin(time*2.5);
    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}