class Land
{
    float x, y, w, h;
    color c;
    color dayLand = color(99, 178, 0);
    color nightLand = color(28, 51, 0);

    Land(float x, float y, float w, float h)
    {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void draw()
    {
        fill(c);
        rect(x, y, w, h);

        land1.c = lerpColor(dayLand, nightLand, sun1.y / height);
    }
}
