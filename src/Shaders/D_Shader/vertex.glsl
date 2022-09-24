varying vec2 vUv;
varying vec3 vStepValue;
uniform float time;

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

void main() {
    vUv = uv;

    vec3 newPos = position;

    float pos = (sin(time*10.0)+1.0)/2.0;

    vec3 diff = normalize(newPos - vec3(0.0));

    vec3 stepValue = vec3(map(sin(time*1.5),-1.0,1.0,0.0,1.0));
    vStepValue = stepValue;
    diff = step(stepValue,diff);
    vec3 finalPos = newPos + diff*sin(time*3.5)*50.;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( finalPos, 1.0 );
}