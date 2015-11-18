//created by Stephen Lindberg 16.11.2015
//enjoy!

PGraphics fbo;
PShader frag;

int stepSize = 5;

void setup(){
  size(256,256,P3D);
  
  fbo = createGraphics(width,height,P3D);
  fbo.beginDraw();
  fbo.stroke(255);
  fbo.strokeWeight(4);
  fbo.fill(0,0);
  fbo.background(0);
  fbo.endDraw();
  
  
  frag = loadShader("frag.glsl");
}

void draw(){
  for(int i = 0; i < height; i+=stepSize){
    fbo.beginDraw();
    
    fbo.background(0);
    
    pushMatrix();
    fbo.translate(width/2,height/2);
    
    //transformation of frame
    fbo.rotateX((float)frameCount * PI/180 * 3);
    
    //transformation of mid-frame iteration (slit-scan difference)
    float j = frameCount * PI/180 + float(i)/200;
    fbo.rotateY((float)j);
    
    fbo.box(96);
    
    fbo.endDraw();
    
    popMatrix();
    
    frag.set("yy",(float)i);
    frag.set("tex",fbo);
    shader(frag);
    rect(0,0,width,height);
    resetShader();
  }
}