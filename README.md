# Introduction
Implementation of the Boids algorithm in Processing based on the work of Craig Reynolds

## Structure 
Boids is a simulation of a distributed behavoiral model, depicting a 'flock of birds' which can keep away from each other, follow a leader as well as 'flock' together. 

Each Boid is a particle within the particle system. Each particle has a particular behavior, in this case 'move', 'seperate' and 'allign' are the three behaviors. 

Move is a movement in a random direction with a random velocity and no acceleration. Seperate is the act of noticing other Boids in the vicinity and maintaining a distance from them. Allign in the act of adjusting velocity and direction based on a Boid in the vicinity of another. These three behaviors together will generate a type of flock of Boids. 

## Run 
Open in Processing, and run. Click the mouse and drag it across the screen. 

## Acknowledgments
Flocks, Herds, and Schools: A Distributed Behavioral Model  - Craig W. Reynolds
The Coding Train : Shiffman 
