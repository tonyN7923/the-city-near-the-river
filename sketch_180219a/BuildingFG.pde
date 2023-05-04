class BuildingFG
{
    float x, y, w, h;
    color c;
    
    Window windows1[] = new Window[100];
    Window windows2[] = new Window[100];
    color windowLightsOn = color(200);
    color windowDayRefl = color(135, 206, 250);
    
    int bfgcol1 = 2;
    int bfgrow1 = 8;
    int bfgcol2 = 3;
    int bfgrow2 = 8;
    int windowSize = -5;
    float windowsOffset1, windowsOffset2;
    
    
    BuildingFG(float x, float y, float w, float h, color c)
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
        
        windowsOffset1 = (bfgcol1 * windowSize + w / bfgcol1) / 4;
        windowsOffset2 = (bfgcol2 * windowSize + w / bfgcol2) / 4;

        
        if(w <= -bfgw1 && w >= -(bfgw1 + bfgw2) / 2) //if smaller than average range of random width
        {
            for(int c = 0; c < bfgcol1; c++) //columns of type 1 buildings
            {
                for(int r = 0; r < bfgrow1; r++) //rows of type 1 buildings
                {
                    windows1[r] = new Window(x + (w / bfgcol1) * c + windowsOffset1, y + (h / bfgrow1) * r, windowSize, windowSize, windowLightsOn);
                    if(sun1.y < height / 3)
                    {
                        windows1[r].c = lerpColor(windowLightsOn, windowDayRefl, moon1.y / height);
                    }
                    windows1[r].draw();
                }
            }
        }
        else if(w < -(bfgw1 + bfgw2) / 2 && w >= -bfgw2) //if larger than average range of random width
        {
            for(int c = 0; c < bfgcol2; c++) //columns of type 2 buildings
            {
                for(int r = 0; r < bfgrow2; r++) //rows of type 2 buildings
                {
                    windows2[r] = new Window(x + (w / bfgcol2) * c + windowsOffset2, y + (h / bfgrow2) * r, windowSize, windowSize, windowLightsOn);
                    if(sun1.y < height / 3)
                    {
                        windows2[r].c = lerpColor(windowLightsOn, windowDayRefl, moon1.y / height);
                    }
                    windows2[r].draw();
                }
            }
        }
    }
}