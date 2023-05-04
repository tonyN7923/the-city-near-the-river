class Boat
{
    float x, y;
    color nightSail = color(150);
    color nightMast = color(74, 47, 23);
    color nightBoat = color(82, 51, 1);
    color daySail = color(255);
    color dayMast = color(114, 74, 37);
    color dayBoat = color(130, 82, 1);
    
    Boat(float x, float y)
    {
        this.x = x;
        this.y = y;
    }
  
    void draw()
    {
        fill(lerpColor(daySail, nightSail, sun1.y / height));
        triangle(x + 35, y - 15, x + 70, y - 50, x + 70, y - 15);
      
        fill(lerpColor(dayMast, nightMast, sun1.y / height));
        rect(x + 70, y - 50, 10, 65);
      
        fill(lerpColor(dayBoat, nightBoat, sun1.y / height));
        quad(x, y, x + 25, y + 25, x + 75, y + 25, x + 100, y);
    }
}