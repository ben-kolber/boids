ArrayList <Boid> boids; 
void setup(){
  size(1240,800);
  boids = new ArrayList<Boid>(); 
}

void draw(){
  background(255); 
  stroke(0); 
  strokeWeight(2);
  fill(0);  
  for (Boid boid : boids){
    boid.display();
    boid.move();
    boid.seperation(boids);
    //boid.alignment(boids);
    boid.borders(); 
  }
}

  void mouseDragged(){
    Boid b = new Boid(mouseX,mouseY); 
    boids.add(b); 
  }
