class Moon
{
    float x, y, w, h;
    color c;

    Moon(float x, float y, float w, float h, color c)
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

        float t = millis() / (1500 * PI);
        float funcX = width * (1 + cos(t - PI));
        float funcY = height * (1 + sin(t - PI));

        x = lerp(x, funcX, 1);
        y = lerp(y, funcY, 1);
    }

    void mousePressed()
    {
        if(Math.pow(mouseX - x, 2) + Math.pow(mouseY - y, 2) <= Math.pow((w / 2), 2))
        {
        }
    }
}
