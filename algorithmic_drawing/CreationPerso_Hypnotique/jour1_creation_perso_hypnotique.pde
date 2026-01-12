float rotation = 0; // Permet d'initier la variable qui va faire tourner les formes

// Réglage de base
void setup() {
  size(800, 800); // Taille de la fenêtre
  rectMode(CENTER); // On définit le centre du rectangle commme son origine
  frameRate(60); // On cap les FPS à 60
}

// On dessine 60 fois par seconde
void draw(){
  background(0); // On efface tout et on redessine
  
  float size = 780; // Taille du premier cercle

  stroke(255); // On définit la couleur du contour comme étant du blanc
  strokeWeight(3); // La largeur du contour vaut 3
  
  translate(400, 400); // On déplace l'origine du programme au milieu de la fenêtre
  
  // On dessine 12 formes
  for(int i = 0 ; i < 13; i++){
    stroke(0); // On définit la couleur du contour comme étant du noir

    //Si on est sur un nombre pair, on dessine un cercle avec un fond blanc
    if(i % 2 == 0) {
      fill(255);
      ellipse(0, 0, size - 2, size - 2);
    //Si on est sur un nombre impair, on dessine un carré avec un fond noir
    } else {
      fill(0);
      size = size / sqrt(2) - 2;     // Formule permettant de trouver la taille du carré en sachant que sa diagonale est égale au diamètre du cercle
      rotate(((PI / 4) + rotation) % (2 * PI)); // Rotation des carrées
      rect(0, 0, size, size);
    }
  }
  
  rotation = rotation + 0.005; // On augmente la valeur de rotation pour pouvoir le faire tourner à chaque nouveau draw
}