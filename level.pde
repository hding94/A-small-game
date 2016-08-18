void loadLevel() {
  String lines[] = loadStrings("level.txt");  //LoadStrings(String) returns a String[]
  maxW = 0;
  for (String l : lines) { 
    if (l.length() > maxW)
      maxW = l.length();
  }
  level = new char[lines.length][maxW];
  originLevel = new char[lines.length][maxW];

  int h = 0;
  for (String l : lines) {
    int w = 0;
    for (char c : l.toCharArray()) {
      level[h][w] = c;
      originLevel[h][w] = c;
      if (c == '@') {
        playerW = w;
        playerH = h;
      }
      w++;
    }
    h++;
  }
}
void drawLevel() {
  int xPart = width/maxW;
  int yPart = height/level.length;
  int ih = 0;
  for (char[] row : level) {
    int iw = 0;
    for (char c : row) {
      switch(c) {
        case('#'): //wall
        image(imgWall, iw*xPart, ih*yPart);
        break;
        case('$'): //crate
        image(imgCrate, iw*xPart, ih*yPart);
        break;
        case('.'): //bed
        image(imgBed, iw*xPart, ih*yPart);
      }
      iw++;
    }
    ih++;
  }
}