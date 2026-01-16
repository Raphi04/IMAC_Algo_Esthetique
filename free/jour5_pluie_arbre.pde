// Librairie pour la musique
import processing.sound.*;

Amplitude amp;
SoundFile music;

// Définition de la classe des gouttes d'eau
class RainDrop {
  int x;
  int y;
  
  RainDrop(int x, int y){
    this.x = x;
    this.y = y;
  }
}

int rainDropSize = 5; // Taille des gouttes
int numberOfHit; // Nombre de coup que se prend l'arbre

int treeBaseSize = 20; // Taille de base de l'arbre
float currentTreeSize = 20; // Taille actuel de l'arbre

ArrayList<RainDrop> rainDrops = new ArrayList<RainDrop>(); // Tableau contenant toutes les gouttes de pluies

// Paramètres initiaux
void setup() {
  size(640, 480); // Taille du canva
  strokeWeight(5); // Largeur de l'arbre
  
  frameRate(60); // FPS
  
  // Configuration du music player
  music = new SoundFile(this, "nothing_else_matter.mp3");
  music.loop();

  amp = new Amplitude(this);
  amp.input(music);
}

void draw() {
  background(60); // Fond du canva
   
  displayRainDrop(); // Affiche les gouttes d'eau;
  
  float branchAngle = map(amp.analyze(), 0, 0.5f, radians(10), radians(45)); // Calcul de l'angle en fonction de l'amplitude de la musique
  
  // Création de l'arbre dractale
  pushMatrix();
  translate(width/2, height);
  drawBranch(treeBaseSize, branchAngle);
  getCurrentTreeSize();
  popMatrix();
  
  generateRainDrop(); // Création des gouttes
  collisionWithTree(); // Collision avec la hitbox de la fractale
}

// Fonction de génération des gouttes
void generateRainDrop(){
  RainDrop newRainDrop = new RainDrop(Math.round((random(0, width + 1)) + random(-6, 6)), -50);
  rainDrops.add(newRainDrop);
}

// Fonction d'affichage des gouttes
void displayRainDrop(){
  for(int i = 0; i < rainDrops.size(); i++) {
    RainDrop currentRainDrop = rainDrops.get(i);
    fill (0, 255, 255);
    noStroke();
    triangle(currentRainDrop.x - rainDropSize / 2, currentRainDrop.y, currentRainDrop.x + rainDropSize / 2, currentRainDrop.y, currentRainDrop.x, currentRainDrop.y - rainDropSize);
    circle(currentRainDrop.x, currentRainDrop.y, rainDropSize);
  }
}

// Fonction de génération de la fractale
void drawBranch(float size, float angle) {
  stroke(0, 255, 0);
  line(0, 0, 0, -size);  
  
  translate(0, -size);
  
  if (size > 10) {
    pushMatrix();
    rotate(angle);
    drawBranch(size * 0.67f, angle);
    popMatrix();

    pushMatrix();
    rotate(-angle);
    drawBranch(size * 0.67f, angle);
    popMatrix();
  }
}

// Fonction de calcul de la taille actuel de l'arbre
void getCurrentTreeSize() {
  float size = treeBaseSize;
  currentTreeSize = size;
  
  while (size > 10) {
    size = size * 0.67f;
    currentTreeSize += size;
  }
}

// Fonction de collision avec l'arbre
void collisionWithTree(){
  for(int i = 0; i < rainDrops.size(); i++) {
    if(rainDrops.get(i).y > height){
      rainDrops.remove(i);
    } else {
      if(rainDrops.get(i).x > width / 2 - treeBaseSize && rainDrops.get(i).x < width / 2 + treeBaseSize){
        if(rainDrops.get(i).y > height - currentTreeSize && rainDrops.get(i).y < height) {
          if(numberOfHit == treeBaseSize && treeBaseSize < 150) {
            treeBaseSize += 5;
            numberOfHit = 0;
          } else {
            rainDrops.remove(i);
            numberOfHit++;
          }
        }
      }
      
      rainDrops.get(i).y += 15;
    }
  }
}
