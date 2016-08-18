int check() {
  switch(dirWalker) {
  case 0:
    if (level[yWalker-1][xWalker] == ' ') {
      yWalker--; 
      return 0;
    }
    if (level[yWalker][xWalker-1] == ' ') {
      xWalker--; 
      return 1;
    }
    if (level[yWalker][xWalker+1] == ' ') {
      xWalker++; 
      return 3;
    }
    if (level[yWalker+1][xWalker] == ' ') {
      yWalker++; 
      return 2;
    }
    break;
  case 1:
    if (level[yWalker][xWalker-1] == ' ') {
      xWalker--; 
      return 1;
    }
    if (level[yWalker+1][xWalker] == ' ') {
      yWalker++; 
      return 2;
    }
    if (level[yWalker-1][xWalker] == ' ') {
      yWalker--; 
      return 0;
    }
    if (level[yWalker][xWalker+1] == ' ') {
      xWalker++; 
      return 3;
    }
    break;
  case 2:
    //println(yWalker);
    //println(xWalker);
    if (level[yWalker+1][xWalker] == ' ') {
      yWalker++; 
      return 2;
    }
    if (level[yWalker][xWalker+1] == ' ') {
      xWalker++; 
      return 3;
    }
    if (level[yWalker][xWalker-1] == ' ') {
      xWalker--; 
      return 1;
    }
    if (level[yWalker-1][xWalker] == ' ') {
      yWalker--; 
      return 0;
    }
    break;
  case 3:
    if (level[yWalker][xWalker+1] == ' ') {
      xWalker++; 
      return 3;
    }
    if (level[yWalker-1][xWalker] == ' ') {
      yWalker--; 
      return 0;
    }
    if (level[yWalker+1][xWalker] == ' ') {
      yWalker++; 
      return 2;
    }
    if (level[yWalker][xWalker-1] == ' ') {
      xWalker--;  //<>// //<>//
      return 1;
    }
    break;
  }
  return 0;
}
void drawWalker() {
  image(imgWalker, xWalker*30, yWalker*30);
}