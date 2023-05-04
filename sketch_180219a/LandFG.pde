class LandFG
{
    float x, y, w, h;
    color c;
    color dayLandFG = color(99, 180, 0);
    color nightLandFG = color(20, 70, 0);

    LandFG(float x, float y, float w, float h)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.c = c;
    }

    void draw()
    {
        fill(c);
        ellipse(x, y, w, h);

        for(LandFG l : landFGs)
        {
            l.c = lerpColor(dayLandFG, nightLandFG, sun1.y / height);
        }
    }
}
