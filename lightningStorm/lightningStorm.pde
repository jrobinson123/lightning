

lightningStorm ls;
void setup(){
  size(500,500);
  ls = new lightningStorm();
}
  

void draw(){
  background(25, 93, 194);
  stroke(148, 246, 255, 100);
  ls.show();
}
