class Boid{ 
  PVector location; 
  boolean isClose;
  PVector velocity; 
  PVector acceleration; 
  float maxSpeed; 
  float maxForce;
  float r;
  float x;
  float y; 
  
  public Boid(float x, float y){
   r=6;
   this.x=x; 
   this.y=y; 
   location = new PVector(x,y); 
   velocity = new PVector(random(-5,5),random(-5,5)); 
   acceleration = new PVector(0,0); 
   maxSpeed = 5;
   maxForce = 0.5; 
  }
  
  void display(){
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    strokeWeight(2);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    //fill(500);
    //stroke(100);
    //ellipse(0,0,r*10,r*10);
    popMatrix();
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void move(){
    velocity = velocity.add(acceleration); 
    velocity.limit(maxSpeed); 
    location = location.add(velocity); 
    acceleration.mult(0); 
}

  PVector seek(PVector attract){
    //Direction of target
    PVector direction = PVector.sub(attract, location); 
    
    // Slowing down while approaching a target
    if (direction.mag()<100){
      float m = map(direction.mag(),0,100,0,maxSpeed);
      direction.setMag(m);
    }else{  
      direction.setMag(maxSpeed); 
    }
    //Direction minue velocity
    PVector steer = PVector.sub(direction,velocity); 
    steer.limit(maxForce); 
    return steer; 
  }
  
  //Average velocity of all nearby boids
  void alignment(ArrayList<Boid> boids){
    int counter = 0;
    PVector sum = new PVector(0,0); 
    for (Boid other : boids){
      float d = PVector.dist(location,other.location);  
      if (d > 0 && d < 40){
        //line(location.x, location.y, other.location.x, other.location.y);
        sum.add(other.velocity); 
        counter++;
      }
    }
    if (counter > 0){
      sum.div(counter); 
      sum.setMag(maxSpeed); 
      PVector align = PVector.sub(sum, velocity); 
      align.limit(maxForce);
      applyForce(align); 
      }  
    }
    
  void seperation(ArrayList<Boid> boids){
    float desiredDistance = r*4;
    int counter = 0; 
    PVector sum = new PVector(); 
    for (Boid other : boids){
      float d = PVector.dist(location,other.location);
      if (d > 0 && d < desiredDistance){
         PVector diff = PVector.sub(location,other.location);
         diff.normalize();
         diff.div(d);
         sum.add(diff);
         counter++;
      } 
    }
    if (counter > 0){
      sum.div(counter);
      sum.normalize();
      sum.setMag(maxSpeed); 
      PVector align = PVector.sub(sum, velocity); 
      align.limit(maxForce);
      applyForce(align); 
      }
  }
  
  //Return to other side of screen once hits border 
  void borders(){
    if (location.x < -r) 
      location.x = width+r;
    if (location.y < -r) 
      location.y = height+r;
    if (location.x > width+r) 
      location.x = -r;
    if (location.y > height+r) 
      location.y = -r;
  }
}
