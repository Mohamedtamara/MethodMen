    float targetX = mouseX;
    float dx = targetX - x;
    x+= dx;
    float targetY = mouseY;
    float dy = targetY - y;
    y+= dy;
    fill(col);
    ellipse(x, y, 17, 17);
