// This is an empty Processing sketch with support for Fadecandy.

OPC opc;

int ellipseRadius = 50;

color c1, c2;
int delta = 60;

void setup()
{
  size(400, 400, P2D);
  opc = new OPC(this, "127.0.0.1", 7890);

  // LED mapping
  opc.ledStrip(0, 60, width/2, height/5, width / 70.0, 0, false);
  opc.ledStrip(64, 60, width/2, height/5 * 2, width / 70.0, 0, false);
  opc.ledStrip(64 * 2, 60, width/2, height/5 * 3, width / 70.0, 0, false);
  opc.ledStrip(64 * 3, 60, width/2, height/5 * 4, width / 70.0, 0, false);
}

void draw()
{
  colorMode(HSB);

  c1 = color(frameCount, 100, 100);
  c2 = color(frameCount + delta, 100, 100);

  // draw a gradient from c1 to c2 across the screen
  for (int x = 0; x < width; x++) {
    float inter = map(x, 0, width, 0, 1);

    float hue = lerp(frameCount, frameCount + delta, inter);
    color c = color(hue % 256, 100, 100);

    //color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(x, 0, x, height);
  }
}
