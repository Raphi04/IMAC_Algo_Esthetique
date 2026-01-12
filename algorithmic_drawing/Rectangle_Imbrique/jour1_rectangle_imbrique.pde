// Réglage de base
void setup() {
  size(640, 400); // Taille de la fenêtre
  background(255); // Couleur de l'arrière plan
  frameRate(1); // On cap les FPS à 1
}

void draw() {
  int weight = 0; // Épaisseur du trait
  int number = 0; // Point haut/gauche du rectangle
  
  int x = 640 - 1; // Coordonné X de base
  int y = 400 - 1; // Coordonné Y de base
  
  // Tant que le point haut/gauche du rectangle est inférieur à la prochaine coordonné Y, on continue
  while (number < y) {
    weight = weight + 1; // On augmente l'épaisseur du trait
    number = number + weight + 1; // On décale le point haut/gauche du rectangle
    
    x = x - weight - 10; // On calcule sa taille en X
    y = y - weight - 10; // On calcule sa taille en Y
    
    strokeWeight(weight); // On définit la taille du trait
    stroke(random(0,256), random(0,256), random(0,256)); // On définit aléatoirement la couleur du trait
        
    fill(random(0,256), random(0,256), random(0,256)); // On définit aléatoirement la couleur du fond
        
    rect(number, number, x - number, y - number); // On trace le rectangle
  }
}