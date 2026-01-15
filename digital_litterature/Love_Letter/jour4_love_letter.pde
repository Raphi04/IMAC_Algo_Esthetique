String[] first = {"Darling", "Dear", "Honey", "Jewel"};
String[] second = {"duck", "love", "moppet", "sweetheart"};

String[] adjectives = {
  "adorable", "magnifique", "stupide", "anxieux", "ardent",
  "cupide", "beau", "brulant", "stoïque", "moche",
  "curieux", "perfide", "dévoué", "charmant", "perséverant",
  "triste", "énervé", "colérique", "mignon", "acharné",
  "petit", "grand", "gros", "maigre", "malade",
  "sain", "fixé", "collé", "doux", "dur",
  "attachant"
};

String[] nouns = {
  "pelle", "couteau", "gourde", "voiture", "chaise",
  "stylo", "table", "hamburger", "cable", "tableau",
  "frite", "pâte", "prise", "drone", "arme",
  "épée", "guerre", "maladie", "rhume", "vin",
  "raisin", "cerise", "pomme", "ananas", "steak",
  "viande", "agneau", "roi", "soleil"
};

String[] adverbs = {
  "passionnément", "affectueusement", "longuement", "rapidement", "lentement",
  "couremment", "", "curiseusement", "impatient", "tendrement",
  "cordialement",
};

String[] verbs = {
  "aimer", "manger", "s'inquiter pour", "dormir", "s'accrocher à",
  "désirer", "courrir", "espérer que", "lié", "manger",
};

String maybe(String[] words){
  if (Math.round(random(2)) == 1) {
    return " " + words[int(random(words.length))];
  }
  return "";
}

String longer(){
  return " Mon"
       + maybe(adjectives)
       + " "
       + nouns[int(random(nouns.length))]
       + maybe(adverbs)
       + " "
       + verbs[int(random(verbs.length))]
       + " ton"
       + maybe(adjectives)
       + " "
       + nouns[int(random(nouns.length))]
       + ".";
}

String shorter(){
  return " " + adjectives[int(random(adjectives.length))] + " " + nouns[int(random(nouns.length))] + ".";
}

String body(){
  String text = "";
  boolean you_are = false;

  for (int i = 0; i < 5; i++){
    String type;
    if (Math.round(random(2)) == 1) {
      type = "longer";
    } else {
      type = "shorter";
    }

    if (type.equals("longer")) {
      text += longer();
      you_are = false;
    } else {
      if (you_are) {
        text = text.substring(0, text.length() - 1) + ": mon" + shorter();
      } else {
        text += " Tu es mon" + shorter();
        you_are = true;
      }
    }
  }

  return text;
}



String letter(){
  String text = first[int(random(first.length))] + " " + second[int(random(second.length))] + "\n\n"
              + body() + "\n\n"
              + "                            Bien à vous " + adverbs[int(random(adverbs.length))] + "\n\n"
              + "                                  M.U.C." + "\n";

  return text;
}

void draw() {
  println(letter());
  delay(15000);
}
