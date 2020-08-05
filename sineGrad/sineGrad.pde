import controlP5.*;
ControlP5 slider;

float r,g,b;
float angle;

float r_amp, g_amp, b_amp;
float r_freq, g_freq, b_freq;
float r_phase,g_phase,b_phase;
float r_offset,g_offset,b_offset;
void setup(){
  size(600, 400);
  
  r_amp=g_amp=b_amp=1;
  r_freq=g_freq=b_freq=1;
  r_phase=1;g_phase=2;b_phase=3;
  r_offset=g_offset=b_offset=0;
  
  slider = new ControlP5(this);
  slider.addSlider("r_amp",0,3,1,0,300,150,10);
  slider.addSlider("r_freq",0,10,1,0,320,150,10);
  slider.addSlider("r_phase",0,10,0,0,340,150,10);
  slider.addSlider("r_offset",-2,2,0,0,360,150,10);
  
  slider.addSlider("g_amp",0,3,1,200,300,150,10);
  slider.addSlider("g_freq",0,10,1,200,320,150,10);
  slider.addSlider("g_phase",0,10,1,200,340,150,10);
  slider.addSlider("g_offset",-2,2,0,200,360,150,10);
  
  slider.addSlider("b_amp",0,3,1,400,300,150,10);
  slider.addSlider("b_freq",0,10,1,400,320,150,10);
  slider.addSlider("b_phase",0,10,2,400,340,150,10);
  slider.addSlider("b_offset",-2,2,0,400,360,150,10);
}

void draw(){
  background(100);
  for(int i = 0; i < width; i++){
    angle = map(i, 0, width, 0, TAU);
    r = constrain(map(sin(angle*r_freq+r_phase)*r_amp+r_offset, -1, 1, 0, 1),0,1) * 255;
    g = constrain(map(sin(angle*g_freq+g_phase)*g_amp+g_offset, -1, 1, 0, 1),0,1) * 255;
    b = constrain(map(sin(angle*b_freq+b_phase)*b_amp+b_offset, -1, 1, 0, 1),0,1) * 255;
    stroke(r,g,b);
    line(i,0,i,50);
    
    noStroke();
    fill(255,0,0);
    circle(i,-r/2+250,5);
    fill(0,255,0);
    circle(i,-g/2+250,5);
    fill(0,0,255);
    circle(i,-b/2+250,5);
  }
}
