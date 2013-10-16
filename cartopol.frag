#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;

#define PI 3.141592653589793

varying vec4 vertTexCoord;

void main(){
  float scale = 5.0;
  float aspect = 1.0;
  vec2 rads = vec2(PI * 2., PI);
  vec2 pnt = (vertTexCoord.st - .5) * vec2(scale, scale * aspect);

  float x2y2 = pnt.x * pnt.x + pnt.y * pnt.y;
  vec3 sphere_pnt = vec3(2. * pnt, x2y2 - 1.) / (x2y2 + 1.);

  //sphere_pnt *= transform;


  float r = length(sphere_pnt);
  float lon = atan(sphere_pnt.y, sphere_pnt.x);
  float lat = acos(sphere_pnt.z / r);

  gl_FragColor = texture2D(texture, vec2(lon, lat) / rads);
}
