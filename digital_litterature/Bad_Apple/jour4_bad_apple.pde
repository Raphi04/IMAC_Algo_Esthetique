
import processing.sound.*;

int[][] frames;

SoundFile music;

boolean candraw = false;

int frame = 0;

String lyrics = "NagaretekutokinonakadedemoKedarusagahoragurugurumawatteWatashikarahanarerukokoromoMienaiwasoushiranai?JibunkaraugokukotomonakuTokinosukimaninagasaretsuzuketeShiranaiwamawarinokotonadoWatashiwawatashisoredakeYumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruKonnajibunnimiraiwaaruno?Konnasekainiwatashiwairuno?Imasetsunaino?Imakanashiino?JibunnokotomowakaranaimamaAyumukotosaetsukarerudakeyoHitonokotonadoshirimoshinaiwaKonnawatashimokawarerunonaraMoshikawarerunonarashironinaru?NagaretekutokinonakadedemoKedarusagahoragurugurumawatteWatashikarahanarerukokoromoMienaiwasoushiranai?JibunkaraugokukotomonakuTokinosukimaninagasaretsuzuketeShiranaiwamawarinokotonadoWatashiwawatashisoredakeYumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruMudanajikannimiraiwaaruno?Konnatokoroniwatashiwairuno?WatashinokotowoiitainarabaKotobanisurunonara:rokudenashiKonnatokoroniwatashiwairuno?Konnajikanniwatashiwairuno?KonnawatashimokawarerunonaraMoshikawarerunonarashironinaru?Imayumemiteru?Nanimomitenai?Katarumomudanajibunnokotoba?KanashimunantetsukarerudakeyoNanimokanjizusugosebaiinoTomadoukotobaataeraretemoJibunnokokorotadauwanosoraMoshiwatashikaraugokunonarabaSubetekaerunonarakuronisuruUgokunonarabaugokunonarabaSubetekowasuwasubetekowasuwaKanashimunarabakanashimunarabaWatashinokokoroshirokukawareru?AnatanokotomowatashinokotomoSubetenokotomomadashiranainoOmoimabutawoaketanonarabaSubetekowasunonarakuroninare!";

void setup() {
    size(1200, 900);
    noStroke();
    frameRate(30);
	
	music = new SoundFile(this, "apple.mp3");
    loadCsv();
    music.loop();
    
    println(music.isPlaying(), music.duration());
    
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
}

void loadCsv() {
    Table table = loadTable("apple.csv");

    frames = new int[table.getRowCount()][table.getColumnCount()];

    for (int i = 0; i < table.getRowCount(); i++) {
        TableRow row = table.getRow(i);

        for (int j = 0; j < row.getColumnCount(); j++) {
            frames[i][j] = row.getInt(j);
        }
    }
    candraw = true;
}

void draw() {
    background(255);
  
    if (!candraw){
      fill(0);
      rect(width/2 - 30, height/2 , 30, 100);
      rect(width/2 + 30, height/2 , 30, 100);
    }else{
      
      int lyricsIndex = 0;
      
      for (int i = 0; i < frames[frame].length; i++) {
      	int x = i % 60;
      	int y = i / 60;
      	functions[frames[frame][i]].mDraw(x * tileSize, y * tileSize, lyrics.charAt(lyricsIndex));
      
        lyricsIndex++;
        lyricsIndex = lyricsIndex % lyrics.length();
      }
  
      frame++;
      frame = frame % frames.length;
    };
}

void keyPressed() {
  if(key == ' '){
    candraw = !candraw;
    
    if(!candraw) {
      music.pause();
    } else {
      music.play();
    }
  }
}