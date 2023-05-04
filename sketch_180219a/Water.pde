class Water
{
    float x, y, w, h;
    color c;
    color dayWater = color(64, 164, 223);
    color nightWater = color(15, 56, 81);

    Water(float x, float y, float w, float h)
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

        water1.c = lerpColor(dayWater, nightWater, sun1.y / height);
    }
}
