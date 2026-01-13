// Création du type pour les cases
class Case {
    int value; // Valeur de la case (vivante/morte)
    color fillColor; // Couleur de la case
    
    Case(int value,  color fillColor) {
        this.value = value;
        this.fillColor = fillColor;
    }
}

int tailleCellule = 10; // Taille des cellule

Case[][] grille;

boolean isPaused = true; // Flag permettant d'activer la pause

// Paramètre initiaux
void setup(){
  size(640, 640); // Taille du Canva
  background(255); // Fond blanc
  noStroke(); // Désactivation des bordures
  frameRate(60); // Images par secondes
  
 grille = new Case[width/tailleCellule][height/tailleCellule]; // Définition de la grille
  
 // Remplissage de la grille avec des cases vides (blanches)
 for(int x = 0; x < width/tailleCellule; x++) {
   for(int y = 0; y < height/tailleCellule; y++){
     grille[x][y] = new Case(2, color(255, 255, 255));
   }
 }
}

void draw(){
  
  // Si on est pas en mode pause, on active l'algorithme d'effacement
  if(!isPaused) {
    drawGrid(); // On dessine la grille
  
     // On parcours le tableau et on applique pour chaque case, une des règles aléatoirement
     for(int x = 0; x < width/tailleCellule; x++) {
       for(int y = 0; y < height/tailleCellule; y++){
         float random = random(0,2);
         
         switch(Math.round(random)) {
           case 0:
             additionVoisinHorizontaux(x, y);
             break;
             
           case 1:
             additionVoisinHaut(x, y);
             break;
             
           case 2:
             additionVoisinBasDroite(x, y);
             break;
         }
       }
     }
  }
  
  // Si on est en pause, on affiche un texte l'indiquant
  else {    
    fill(255);
    stroke(0);         
    strokeWeight(1);
    rect(10, 10, 120, 30, 8);
    
    fill(0);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Pause activé", 10 + 120/2, 10 + 30/2);
  }
}

// Si on appuie sur espace, on active le mode pause
void keyPressed() {
  if (key == ' ') {
    isPaused = !isPaused;
    
    if(isPaused == true) {
      frameRate(60);
    } else {
      frameRate(15);
    }
  }
}

// Si on bouge avec la souris, on ajoute une case à la grille
void mouseDragged() {
    int x = mouseX / tailleCellule;
    int y = mouseY / tailleCellule;
  
    if (x >= 0 && x < width / tailleCellule && y >= 0 && y < height / tailleCellule) {
        grille[x][y] = new Case(1, color(0, 0, 0));
    }
    drawGrid();
}

// Fonction pour dessiner la grille
void drawGrid(){
  noStroke();
  background(255);
  
  for(int x = 0; x < width/tailleCellule; x++) {
   for(int y = 0; y < height/tailleCellule; y++){
       fill(grille[x][y].fillColor); 
       rect(x*tailleCellule, y*tailleCellule, tailleCellule, tailleCellule);
     }
   }
}

// Regle 1
void additionVoisinHorizontaux(int x, int y) {
   if((y - 1) != -1 && (y + 1) != height/tailleCellule && grille[x][y].value == 1) {
     int additionVoisinHorizontaux = grille[x][y - 1].value + grille[x][y + 1].value;
     
     if(additionVoisinHorizontaux % 2 == 0) {
       grille[x][y] = new Case(0, color(255, 255, 255));
     } else {
       grille[x][y] = new Case(1, color(220, 0, 0));
       grille[x][y + 1] = new Case(0, color(255, 255, 255));
     }
   } 
}

// Regle 2
void additionVoisinHaut(int x, int y) {
   if((x - 1) != -1 && (x + 1) != width/tailleCellule && grille[x][y].value == 1) {
     int additionVoisinHaut = grille[x][y].value + grille[x - 1][y].value;
     
     if(additionVoisinHaut % 2 == 1) {
       grille[x + 1][y] = new Case(1, color(0, 220, 0));
     } else {
       grille[x - 1][y] = new Case(0, color(255, 255, 255));
       grille[x][y] = new Case(0, color(255, 255, 255));
     }
   } else {
      grille[x][y] = new Case(0, color(255, 255, 255));
   }
}

// Regle 3
void additionVoisinBasDroite(int x, int y) {
   if((x + 1) != width/tailleCellule && (y + 1) != height/tailleCellule) {
     int additionVoisinBasDroite = grille[x][y].value + grille[x + 1][y + 1].value;
     
     if(additionVoisinBasDroite % 2 == 1) {
       grille[x + 1][y + 1] = new Case(1, color(0, 0, 220));
     } else {
       grille[x + 1][y + 1] = new Case(0, color(255, 255, 255));
     }
   }
}
