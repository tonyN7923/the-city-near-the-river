class Building
{
    float x, y, w, h;
    color c;

    Building(float x, float y, float w, float h, color c)
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
        rect(x, y, w, h);
    }
}
