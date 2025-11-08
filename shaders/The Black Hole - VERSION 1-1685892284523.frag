// Author: HowDeepIsYourLove
// Title:The Black Hole - VERSION 1.0

#ifdef GL_ES
precision mediump float;
#endif

float PI = 3.14159265359;

uniform vec2 u_resolution;
uniform float u_time;

//vec2 scale = vec2(0.0);

float intensity = 0.5;
float glow_intensity = 2.;

vec2 normalizedCoordinates(vec2 fragCoords){
    return fragCoords / u_resolution.xy;
}

float circle(float radius, vec2 st){
    float circleCenter = length(st);
    return 1.-smoothstep(radius-0.001,radius-0.001,circleCenter);
}
float glow(vec2 st, float scale){
    scale = 0.1;
    float dist = length(st) - scale;
    return .005/dist;
}

float Ellipse(vec2 position) {
  vec2 ellipseCenter = vec2(0., 0.);
  vec2 ellipseSize = vec2(0.250,0.030);

  vec2 normalizedPos = (position - ellipseCenter) / ellipseSize;
  return length(normalizedPos) - 1.;
}

void main() {
    vec2 st = normalizedCoordinates(gl_FragCoord.xy);
    st -= 0.5;
    
    float ellipse = Ellipse(st);
    
    vec3 finalColor = mix(vec3(0.0),
                          vec3(1.0)*(glow(st,.2)*glow_intensity),
                          circle(.2,st)*(glow(st,.2)*glow_intensity))
                          + mix(vec3(0.985,0.811,0.078)*.20, 
                          vec3(0.985,0.786,0.002)*glow(st,.2), smoothstep(.280, 1.678, ellipse)/intensity)
                          + circle(.25,st)*glow(st,.2)*.5;
    
    gl_FragColor = vec4(finalColor,1.0);
}