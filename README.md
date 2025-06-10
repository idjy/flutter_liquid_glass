# flutter_liquid_glass
attempt at implementing liquid glass specifications in flutter and turning it into a pub package for use in other's projects

Since this is a work in progress, its important to first start with laying out the target and providing resources so that others can contribute. We can assume theres going to be math involved, and possible a need to write custom shaders.
I'd like to layout each individual concept such that it can be implemented incrementally with clear goals. 



### To-Do  (provide examples)

- [ ] Light Refraction - [Refraction in JS](https://www.youtube.com/watch?v=1LGa50gncgg)
  - [ ] Gyroscope changes light angle
  - [ ] prismatic edges 
  - [ ] Distortion of layer below
        
  <img src="https://github.com/user-attachments/assets/0ffb0f8c-ad8a-4a35-90d8-6b1d7e9f3bb0" width="300"/>
- [ ] Blurring
- [ ] Scale transitioning
- [ ] Color transition from transparent glass to solid color
- [ ] energizing touch
- [ ] Gel touch&drag

<img src="https://github.com/user-attachments/assets/1c32e8a3-f766-424b-823b-f7d970222f42" width="300"/>


- [ ] Nuemorphic like effects - these are typically easily done with clever use of inner and outer shadows. putting a lighter inner shadow color facing the light source, and a shadow on the opposite side you get a convex button. Inverting the shadows gives you concave(button press)
- [ ] Gooey Liquid / Surface tension pull effect. Save this for last as i dont think its all that important.

 <img src="https://github.com/user-attachments/assets/d03f71bd-356f-4004-bdff-98fec38fb8c9" width="300"/>



Parameter ideas
- [ ] blurStrength
- [ ] child widget
- [ ] borderRadius
- [ ] frostStrength appears to also determine degree of refraction
- [ ] appears to have a baseColor and animates between (its not simply changing immediately with the background layer)
- [ ] bezelWidth


If you need my immediate attention message me on [X](https://x.com/All4nDev)
