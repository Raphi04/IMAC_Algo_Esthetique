// Paramètres de l'animation
final float tileSize = 20;
final color white = #ffffff;
final color black = #000000;
final float hTileSize = tileSize/2;

interface marchingDraw {
    void mDraw(float x, float y, char letter);
}

// Liste des fonctions qui permettent de dessiner chaque case
marchingDraw[] functions = {
    (float x, float y, char letter) -> { // case 00
      fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },
    
    (float x, float y, char letter) -> { // case 01
      fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 02
      fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 03
    	fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 04
    	fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 05
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 06
    	fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> {  // case 07
    	fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> {  // case 08
      fill(white);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 09
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 10
    	fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 11
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 12
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 13
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 01
      fill(black);
      textSize(tileSize);
      text(letter, x, y);
    },

    (float x, float y, char letter) -> { // case 15
    	fill(black);
      textSize(tileSize);
    	text(letter, x, y);
    },
};
