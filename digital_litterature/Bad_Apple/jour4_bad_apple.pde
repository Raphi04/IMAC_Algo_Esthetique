
import processing.sound.*; // Bibliothèque sound

int[][] frames; // Les frames de l'animation

SoundFile music; // Variable contenant la musique

boolean candraw = false; // Variable de pause

int frame = 0; // On commance à la frame 0

// Les paroles de la musique
String lyrics = "NagaretekutokinonakadedemoKedarusagahoragurugurumawatteWatashikarahanarerukokoromoMienaiwasoushiranai?JibunkaraugokukotomonakuTokinosukimaninagasaretsuzuketeShiranaiwamawarinokotonadoWatashiwawatashisoredakeYumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruKonnajibunnimiraiwaaruno?Konnasekainiwatashiwairuno?Imasetsunaino?Imakanashiino?JibunnokotomowakaranaimamaAyumukotosaetsukarerudakeyoHitonokotonadoshirimoshinaiwaKonnawatashimokawarerunonaraMoshikawarerunonarashironinaru?NagaretekutokinonakadedemoKedarusagahoragurugurumawatteWatashikarahanarerukokoromoMienaiwasoushiranai?JibunkaraugokukotomonakuTokinosukimaninagasaretsuzuketeShiranaiwamawarinokotonadoWatashiwawatashisoredakeYumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruMudanajikannimiraiwaaruno?Konnatokoroniwatashiwairuno?WatashinokotowoiitainarabaKotobanisurunonara:rokudenashiKonnatokoroniwatashiwairuno?Konnajikanniwatashiwairuno?KonnawatashimokawarerunonaraMoshikawarerunonarashironinaru?Imayumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruUgokunonarabaugokunonarabaSubetekowasuwasubetekowasuwaKanashimunarabakanashimunarabaWatashinokokoroshirokukawareru?AnatanokotomowatashinokotomoSubetenokotomomadashiranainoOmoimabutawoaketanonarabaSubetekowasunonarakuroninare!";

// Paramètres initiaux
void setup() {
    size(1200, 900); // Taille de la fenêtre
    noStroke(); // On retire les bordures
    frameRate(30); // On set le framerate à 30
	
	music = new SoundFile(this, "apple.mp3"); // On récupère le fichier de la musique
    loadCsv(); // On exécute la fonction qui récupère les frames de l'animation
    music.loop(); // On boucle la musique
        
    rectMode(CENTER); // On set le mode de disposition du rectangle
    textAlign(CENTER, CENTER); // On set l'alignement du texte
}

// Fonction qui récupère les frames
void loadCsv() {
    Table table = loadTable("apple.csv"); // On charge le fichier

    frames = new int[table.getRowCount()][table.getColumnCount()]; // On récupère les colonnes et les lignes

    // On récupère les données des frames et on les mets dans la variable les stockants
    for (int i = 0; i < table.getRowCount(); i++) {
        TableRow row = table.getRow(i);

        for (int j = 0; j < row.getColumnCount(); j++) {
            frames[i][j] = row.getInt(j);
        }
    }

    // On dessine maintenant que c'est récupérer
    candraw = true;
}

void draw() {
    background(255); // On reset le background
  
    // Si on est en pause, on affiche rien et deux rectangle pour faire un symbole pause
    if (!candraw){
      fill(0);
      rect(width/2 - 30, height/2 , 30, 100);
      rect(width/2 + 30, height/2 , 30, 100);
    }else{
      
      // Variable de l'index de la lettres des paroles actuelles
      int lyricsIndex = 0;
      
      // Pour chaque frame, on exécute la fonction qui permet de dessiner la case correspondante
      for (int i = 0; i < frames[frame].length; i++) {
      	int x = i % 60;
      	int y = i / 60;
      	functions[frames[frame][i]].mDraw(x * tileSize, y * tileSize, lyrics.charAt(lyricsIndex));
      
        // On incrémente pour passer à la lettre suivante
        lyricsIndex++;
        lyricsIndex = lyricsIndex % lyrics.length(); // On bloucle les paroles
      }
  
      //On passe à la frame suivante
      frame++;
      frame = frame % frames.length; // On boucle l'animation
    };
}

// Fonction de mise en pause
void keyPressed() {
  if(key == ' '){
    candraw = !candraw;
    
    // On met la musique en pause
    if(!candraw) {
      music.pause();
    } else {
      music.play();
    }
  }
}