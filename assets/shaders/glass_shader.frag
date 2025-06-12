#version 460 core

#include<flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform sampler2D uTexture;

out vec4 fragColor;

void main(){
    vec2 uv=FlutterFragCoord().xy/uSize;
    
    // Create refraction distortion
    float centerDist=distance(uv,vec2(.5,.5));
    
    // Calculate distortion based on distance from center
    vec2 distortion=(uv-vec2(.5))*centerDist*.1;
    
    // Add noise-based distortion for glass texture
    float noise1=sin(uv.x*15.+uv.y*10.)*.02;
    float noise2=cos(uv.y*12.+uv.x*8.)*.015;
    
    vec2 distortedUV=uv+distortion+vec2(noise1,noise2);
    
    // Clamp UV to avoid sampling outside bounds
    distortedUV=clamp(distortedUV,0.,1.);
    
    // Sample the backdrop with distortion
    vec4 backdrop=texture(uTexture,distortedUV);
    
    // Apply glass tint
    vec3 glassTint=mix(
        vec3(.9,.95,1.),// Light blue-white tint
        vec3(.8,.85,.95),// Slightly darker tint
        centerDist*.5
    );
    
    // Combine backdrop with glass effect
    vec3 finalColor=backdrop.rgb*glassTint;
    
    // Glass opacity - more transparent in center
    float alpha=mix(.8,.95,centerDist*.3);
    
    fragColor=vec4(finalColor,alpha);
}