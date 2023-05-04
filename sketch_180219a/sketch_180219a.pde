//AET Creative Coding Spring 2018
//Tony Nguyen
//Challenge 5

Building buildings[] = new Building[50];
BuildingFG buildingsFG[] = new BuildingFG[20];
Sun sun1;
Moon moon1;
Water water1;
Land land1;
LandFG landFGs[] = new LandFG[4];
Boat boats[] = new Boat[1];
color daySky = color(135, 206, 250);
color nightSky = color(19, 24, 98);
color dayBuilding = color(150);
color nightBuilding = color(20);
color dayBuildingFG = color(160);
color nightBuildingFG = color(30);

int bw1 = 50;
int bw2 = 70;
int bfgw1 = 50;
int bfgw2 = 70;
int bh1 = 150;
int bh2 = 350;
int bfgh1 = 150;
int bfgh2 = 200;

boolean quakeActive = false;
boolean starsActive = false;

void setup()
{
    fullScreen();
    noStroke();

    sun1 = new Sun(width / 2, 0, 200, 200, color(255, 255, 0));
    moon1 = new Moon(width / 2, height, 100, 100, color(254, 252, 215));
    water1 = new Water(-width, height / 2, 3 * width, height / 2);
    land1 = new Land(-width, height / 2, 3 * width, 50);

    for(int b = 0; b < buildings.length; b++) //background buildings
    {
        buildings[b] = new Building(random(width), height / 2, -random(bw1, bw2), -random(bh1, bh2), dayBuilding);
    }

    for(int b = 0; b < buildingsFG.length; b++) //foreground buildings
    {
        buildingsFG[b] = new BuildingFG(random(width), height / 2, -random(bfgw1, bfgw2), -random(bfgh1, bfgh2), dayBuildingFG);
    }

    for(int l = 0; l < landFGs.length; l++)
    {
        landFGs[l] = new LandFG((width / (l + 1)) + 2 * l, height, width / 2, height / 4);
    }
    
    for(int b = 0; b < boats.length; b++)
    {
        boats[b] = new Boat(water1.w, random(water1.h + height / 4, height - water1.h / 2));
    }
}

void draw()
{
    background(lerpColor(daySky, nightSky, sun1.y / height));
    
    if(starsActive)
    {
        stars();
        if(sun1.y < height / 2)
        {
            starsActive = false;
        }
    }

    sun1.draw();
    moon1.draw();
    water1.draw();
    land1.draw();

    for(Building b : buildings)
    {
        b.draw();
        b.c = lerpColor(dayBuilding, nightBuilding, sun1.y / height);
    }

    for(BuildingFG b : buildingsFG)
    {
        b.draw();
        b.c = lerpColor(dayBuildingFG, nightBuildingFG, sun1.y / height);
    }

    for(LandFG l : landFGs)
    {
        l.draw();
    }
    
    for(Boat b : boats)
    {
        b.x--;
        b.draw();
    }
    
    if(quakeActive)
    {
        tremble();
        if(frameCount % 180 == 0)
        {
            quakeActive = false;
        }
    }
}

void stars()
{
    for(int i = 0; i < 50; i++)
    {
        fill(255);
        ellipse(random(width), random(height / 2), 2, 2);
    }
}

void tremble()
{
    float trembleX = random(-10, 10);
    water1.x += trembleX;
    land1.x += trembleX;
    for(Building b : buildings)
    {
        b.x += trembleX;
    }
    for(BuildingFG b : buildingsFG)
    {
        b.x += trembleX;
    }
    for(LandFG l : landFGs)
    {
        l.x += trembleX;
    }
    for(Boat b : boats)
    {
        b.x += trembleX;
    }
}

void keyPressed()
{
    switch(keyCode)
    {
        case 81: //Q
            quakeActive = true;
            break;
        case 83: //S
            starsActive = true;
            break;
    }
}