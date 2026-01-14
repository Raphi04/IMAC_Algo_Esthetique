float taille = 800;  // Taille du grand triangle
int maxIteration = 1;   // Profondeur de la fractale

// Liste des couleurs disponibles
color rouge = color(255, 0, 0);
color vert = color(0, 255, 0);
color bleu = color(0, 0, 255);
color jaune = color(255, 255, 0);
color violet = color(255, 0, 255);
color cyan = color(0, 255, 255);

// Couleur du triangle
color triangleColor = jaune;

// Paramètre initial
void setup() {
  size(800, 800);
  background(0);
  stroke(0);
  strokeWeight(2);
}

void draw(){
  background(0);
  drawTriangle(width/2, height/2 + taille/2, taille, maxIteration);
}

// Fonction de dessin du triangle
void drawTriangle(float x, float y, float taille, int iteration) {
  
  if(iteration == 0) return; // Fonction d'arret
  
  if(iteration == 1) {
    fill(triangleColor);
  } else {
    fill(0);
  }
  
  float h = taille * sqrt(3) / 2; // Hauteur du triangle
  
  // Coordonnées des sommets du triangle parent
  float x1 = x - taille/2;
  float y1 = y;
  
  float x2 = x + taille/2;
  float y2 = y;
  
  float x3 = x;
  float y3 = y - h;
  
  // Dessiner le triangle parent
  triangle(x1, y1, x2, y2, x3, y3);
  
  // Taille et hauteur des triangles enfants
  float taillePetite = taille / 2;
  float hPetite = h / 2;
  
  // Triangle inférieur gauche
  drawTriangle(x1 + taillePetite/2, y1, taillePetite, iteration - 1);
  
  // Triangle inférieur droit
  drawTriangle(x2 - taillePetite/2, y2, taillePetite, iteration - 1);
  
  // Triangle supérieur
  drawTriangle(x1 + taillePetite, y1 - hPetite, taillePetite, iteration - 1);
}

// Ajouter / Retirer des itérations
void keyPressed() {
  if(key == '+') {
    if(maxIteration < 8) {
      maxIteration++;
    }
  }
  
  if(key == '-') {
    if(maxIteration > 1) {
      maxIteration--;
    }
  }
}

// Changer la couleur au click
void mousePressed(){
  int randomColor = Math.round(random(0, 5));
  
  switch(randomColor) {
    case 0:
      triangleColor = rouge;
      break;
    
    case 1:
      triangleColor = vert;
      break;
      
    case 2:
      triangleColor = bleu;
      break;
      
    case 3:
      triangleColor = jaune;
      break;
      
    case 4:
      triangleColor = violet;
      break;
      
    case 5:
      triangleColor = cyan;
      break;
  }    
}
