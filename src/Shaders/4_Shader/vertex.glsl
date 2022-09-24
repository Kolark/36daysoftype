varying vec2 vUv;
uniform float time;

#define OCTAVES   		1		// 7
#define SWITCH_TIME 	60.0		// seconds

float t()               {return (sin(time)+1.0)*0.5;}
float function()        {return mod(t(),4.0);}
bool  multiply_by_F1()  {return mod(t(),8.0)  >= 4.0;}
bool  inversef()         {return mod(t(),16.0) >= 8.0;}
float distance_type()	{return mod(t()/16.0,4.0);}

vec2 hash( vec2 p ){
	p = vec2( dot(p,vec2(127.1,311.7)),dot(p,vec2(269.5,183.3)));
	return fract(sin(p)*43758.5453);
}

float voronoi( in vec2 x ){
	vec2 n = floor( x );
	vec2 f = fract( x );

	float F1 = 8.0;
	float F2 = 8.0;

	for( int j=-1; j<=1; j++ )
		for( int i=-1; i<=1; i++ ){
			vec2 g = vec2(i,j);
			vec2 o = hash( n + g );

			o = 0.5 + 0.41*sin( time + 6.2831*o );
			vec2 r = g - f + o;

		float d = 	distance_type() < 1.0 ? dot(r,r)  :				// euclidean^2
				  	distance_type() < 2.0 ? sqrt(dot(r,r)) :			// euclidean
					distance_type() < 3.0 ? abs(r.x) + abs(r.y) :		// manhattan
					distance_type() < 4.0 ? max(abs(r.x), abs(r.y)) :	// chebyshev
					0.0;

		if( d<F1 ) {
			F2 = F1;
			F1 = d;
		} else if( d<F2 ) {
			F2 = d;
		}
    }

	float c = function() < 1.0 ? F1 :
			  function() < 2.0 ? F2 :
			  function() < 3.0 ? F2-F1 :
			  function() < 4.0 ? (F1+F2)/2.0 :
			  0.0;

	if( multiply_by_F1() )	c *= F1;
	if( inversef() )			c = 1.0 - c;

    return c;
}

float fbm( in vec2 p ){
	float s = 0.0;
	float m = 0.0;
	float a = 0.5;

	for( int i=0; i<OCTAVES; i++ ){
		s += a * voronoi(p);
		m += a;
		a *= 0.5;
		p *= 2.0;
	}
	return s/m;
}

float map(float value, float min1, float max1, float min2, float max2) {
  return min2 + (value - min1) * (max2 - min2) / (max1 - min1);
}

float sinT(float f){
    return sin(time*f);
}
float sinTMap(float f,float min, float max){
    return map(sin(time*f),-1.,1.,min,max);
}

float cosT(float f){
    return cos(time*f);
}
float cosTMap(float f,float min, float max){
    return map(cos(time*f),-1.,1.,min,max);
}
#define PI 3.14159265359
mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

varying float vVar;
void main() {
    vUv = uv;

    vec3 newPos = position;
    vec2 defaultVec = vec2(50.,-75.);

    float n = voronoi(rotate2d(sin(time*0.5)*PI)*(newPos.xz-defaultVec)*0.05);
    vVar = n;
    newPos.y += n*15.;


    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPos, 1.0 );
}