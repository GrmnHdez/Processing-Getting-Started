
//  Codigo tomado de OpenPorcessing !!!
class Spectro
{
  int pal []=new int [128];
  int[] cls;
  float s1, s2;

  Spectro()
  {
    for (int i=0;i<128;i++) 
    {
      s1=sin(i*PI/25);
      s2=sin(i*PI/50+PI/4);
      pal[i]=color(128+s1*128, 128+s2*128, s1*128);
    }

    cls = new int[width*height];
    for (int x = 0; x < width; x++)
    {
      for (int y = 0; y < height; y++)
      {
        cls[x+y*width] = (int)((127.5 + +(127.5 * sin(x / 32.0)))+ (127.5 + +(127.5 * cos(y / 32.0))) + (127.5 + +(127.5 * sin(sqrt((x * x + y * y)) / 32.0)))  ) / 4;
      }
    }
  }

  void dibujarSpectro()
  {
    loadPixels();
    for (int pixelCount = 0; pixelCount < cls.length; pixelCount++)
    {                   
      pixels[pixelCount] =  pal[(cls[pixelCount] + frameCount)&127];
    }
    updatePixels();
  }
}

