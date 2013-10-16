uniform mat4 projection;
attribute vec3 position;
attribute vec2 texcoord;
varying vec2 v_texcoord;

void main(){
   v_texcoord = texcoord;
   gl_Position = projection * vec4(position, 1.);
}