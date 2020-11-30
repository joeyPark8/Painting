int lColor, lWeight;
color c;
PFont font;
PImage icon;

int type;

boolean eraser;

void setup() {
  size(1000, 800);
  //fullScreen();
  background(255);
  
  lWeight = 5;
  lColor = 0;

  type = 0;
  
  eraser = false;
  
  font = loadFont("ArialRoundedMTBold-48.vlw");
  icon = loadImage("neptune.png");

  surface.setIcon(icon);
}

void draw() {
  //new paper
  if (keyPressed) {
    if (key == 'w') {
      background(255);
      delay(100);
    }
  }
  
  //draw button 
  fill(#BFBFBF); 
  stroke(0); 
  strokeWeight(1);
  rect(0, 0, 75, 75);
  fill(#BFBFBF); 
  stroke(0);
  rect(0, 75, 75, 75);
  fill(#BFBFBF); 
  stroke(0);
  rect(0, 150, 75, 75);
  fill(c); 
  stroke(0);
  rect(0, 225, 75, 75);
  fill(#BFBFBF); 
  stroke(0);
  rect(0, 325, 75, 75);
  
  //keyboard event
  if (keyPressed) {
    switch(key) {
    case 'c': 
      lColor+=1; 
      delay(100); 
      break;
    case 's': 
      lWeight+=1; 
      delay(100); 
      break;
    case 'd': 
      lWeight-=1; 
      delay(100); 
      break;
    case 'e':
      noStroke(); 
      fill(c);
      if (type == 0) {
        ellipse(mouseX, mouseY, 100, 100);
      } else if (type == 1) {
        triangle(mouseX, mouseY, mouseX-50, mouseY + 100, mouseX+50, mouseY + 100);
      } else if (type == 2) {
        rect(mouseX, mouseY, 100, 100);
      } else if(type >= 3) {
        type = 0;
      }
      delay(100); 
      break;
    case 'q':
      if (eraser != true) eraser = true;
      else eraser = false;
      delay(100);
      break;
    }
  }
  lWeight = constrain(lWeight, 1, 50);
  //pen color
  if (lColor == 0) {
    stroke(0);
    c = color(0);
  } else if (lColor == 1) {
    c = color(#E81A1A);
    stroke(#E81A1A);
    delay(100);
  } else if (lColor == 2) {
    c = color(#E8B81A);
    stroke(#E8B81A);
    delay(100);
  } else if (lColor == 3) {
    c = color(#6ADE28);
    stroke(#6ADE28);
    delay(100);
  } else if (lColor == 4) {
    c = color(#20A0E3);
    stroke(#20A0E3);
    delay(100);
  } else if (lColor == 5) {
    c = color(#2058E3);
    stroke(#2058E3);
    delay(100);
  } else if (lColor == 6) {
    c = color(#8F2DE0);
    stroke(#8F2DE0);
    delay(100);
  } else if (lColor == 7) {
    lColor = 0;
    delay(100);
  }
  
  //eraser
  if (eraser == true) {
    fill(255); noStroke();
    rect(mouseX, mouseY, 50, 50);
  }
  
  strokeWeight(lWeight);
  if (mousePressed) {
    cursor(CROSS);
    line(pmouseX, pmouseY, mouseX, mouseY);
    //if button pressed
    if (mouseX > 0 && mouseX < 75 && mouseY > 0 && mouseY < 75) {
      background(255);
    } else if (mouseX > 0 && mouseX < 75 && mouseY > 75 && mouseY < 150) {
      lWeight+=1; 
      delay(100);
    } else if (mouseX > 0 && mouseX < 75 && mouseY > 150 && mouseY < 225) {
      lWeight-=1; 
      delay(100);
    } else if (mouseX > 0 && mouseX < 75 && mouseY > 225 && mouseY < 300) {
      lColor+=1; 
      delay(100);
    } else if (mouseX > 0 && mouseX < 75 && mouseY > 325 && mouseY < 400) {
      type += 1;
      delay(100);
    }
  }
  //if just cursor is on the button
  if (mouseX > 0 && mouseX < 75 && mouseY > 0 && mouseY < 75) {
    fill(255); //#E86FEA
    textSize(15);
    text("clear all", mouseX, mouseY);
    cursor(HAND);
  } else if (mouseX > 0 && mouseX < 75 && mouseY > 75 && mouseY < 150) {
    fill(255); //#E86FEA
    textSize(15);
    text("thicker", mouseX, mouseY);
    cursor(HAND);
  } else if (mouseX > 0 && mouseX < 75 && mouseY > 150 && mouseY < 225) {
    fill(255); //#E86FEA
    textSize(15);
    text("thinner", mouseX, mouseY);
    cursor(HAND);
  } else if (mouseX > 0 && mouseX < 75 && mouseY > 225 && mouseY < 300) {
    fill(255); //#E86FEA
    textSize(15);
    text("color", mouseX, mouseY);
    cursor(HAND);
  } else if (mouseX > 0 && mouseX < 75 && mouseY > 325 && mouseY < 400) {
    fill(255); //#E86FEA
    textSize(15);
    text("type", mouseX, mouseY);
    cursor(HAND);
  } else cursor(CROSS);
  
  /*
  textFont(font); 
  textSize(30); 
  fill(#EDC830);
  text("made by ", 10, 775); //#6989DE #EDC830
  fill(#6989DE);
  text("SEMIN", 140, 775);
  */
  
  println("fps: " + frameRate);
}
