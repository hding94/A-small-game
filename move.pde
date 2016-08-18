void keyPressed() {
  keyHold = true;
}

void keyReleased() {
  keyHold = false;
}

void Movement() {
  if (keyHold && key == CODED) {
    switch(keyCode) {
    case UP:
      handleMove(UP);
      break;
    case DOWN:
      handleMove(DOWN);
      break;
    case LEFT:
      handleMove(LEFT);
      break;
    case RIGHT:
      handleMove(RIGHT);
      break;
    }
    keyHold = false;
  }
}
char playerIsInFront(int dir) {
  try {
    switch(dir) {
    case UP:
      return level[playerH-1][playerW];
    case DOWN:
      return level[playerH+1][playerW];
    case LEFT:
      return level[playerH][playerW-1];
    case RIGHT:
      return level[playerH][playerW+1];
    }
  }
  catch(Exception e) {
  }
  return ' ';
}

boolean boxPushed(int dir) {
  try {
    switch(dir) {
    case UP:
      {
        char c = level[playerH-2][playerW];
        return c == ' ' || c == '.';
      }
    case DOWN:
      {
        char c = level[playerH+2][playerW];
        return c == ' ' || c == '.';
      }
    case LEFT:
      {
        char c = level[playerH][playerW-2];
        return c == ' ' || c == '.';
      }
    case RIGHT:
      {
        char c = level[playerH][playerW+2];
        return c == ' ' || c == '.';
      }
    }
  }
  catch(Exception e) {
  }
  return false;
}

void handleMove(int dir) {
  switch(dir) {
  case UP:
    if (playerIsInFront(UP) == TYPE_EMPTY) {
      playerH--;
    } else if ((playerIsInFront(UP) == TYPE_BOX && boxPushed(UP))) {
      playerH--;
      level[playerH-1][playerW] = level[playerH][playerW]; //push box
      level[playerH][playerW] = originLevel[playerH][playerW] == '.' ? '.' : ' ';
    }
    break;
  case DOWN:
    if (playerIsInFront(DOWN) == TYPE_EMPTY) {
      playerH++;
    } else if (playerIsInFront(DOWN) == TYPE_BOX && boxPushed(DOWN)) {
      playerH++;
      level[playerH+1][playerW] = level[playerH][playerW]; //push box
      level[playerH][playerW] = originLevel[playerH][playerW] == '.' ? '.' : ' ';
    }
    break;
  case LEFT:
    if (playerIsInFront(LEFT) == TYPE_EMPTY ) {
      playerW--;
    } else if (playerIsInFront(LEFT) == TYPE_BOX && boxPushed(LEFT)) {
      playerW--;
      level[playerH][playerW-1] = level[playerH][playerW]; //push box
      level[playerH][playerW] = originLevel[playerH][playerW] == '.' ? '.' : ' ';
    }            
    break;
  case RIGHT:
    if (playerIsInFront(RIGHT) == TYPE_EMPTY) {
      playerW++;
    } else if (playerIsInFront(RIGHT) == TYPE_BOX && boxPushed(RIGHT)) {
      playerW++;
      level[playerH][playerW+1] = level[playerH][playerW]; //push box
      level[playerH][playerW] = originLevel[playerH][playerW] == '.' ? '.' : ' ';
    }      
    break;
  }
}