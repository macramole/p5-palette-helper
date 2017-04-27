PaletteHelper palettes;

void setup() {
    size(800,400);
    palettes = new PaletteHelper("palettes2.json");

    noStroke();
    // noLoop();

    drawAll();
}

void draw() {

}

void drawAll() {
    drawPalette();
    drawSamplePoints();
    drawHelp();
}

void drawPalette() {
    background(0);

    pushMatrix();
    translate(5,5);
    for ( int i = 0 ; i < palettes.countColors() ; i++ ) {
        fill( palettes.getColor(i) );
        float currentWidth = 100 * palettes.getWeightNormalized(i);

        rect( 0, 0, currentWidth, 60 );
        translate( currentWidth + 5, 0 );/* */
    }
    popMatrix();
}
void drawSamplePoints() {
    pushMatrix();
    int currentX = 0;
    int cantFilas = 0;
    translate( 10, 100 );
    for ( int i = 0 ; i < 1944 ; i++ ) {
        fill( palettes.getColor() );
        ellipse(0,0,10,10);

        currentX += 11;

        if ( currentX > width - 11 ) {
            currentX = 0;
            cantFilas++;
            popMatrix();
            pushMatrix();
            translate(10, 100 + cantFilas * 11);
        } else {
            translate( 11, 0 );
        }

    }
    popMatrix();
}

void drawHelp() {
    fill(255);
    text("click: next palette", width - 120 ,20);
}

void mouseClicked() {
    palettes.next();
    drawAll();
}
