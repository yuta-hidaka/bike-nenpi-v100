package bikeNenpi.UTILs;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

public class BinaryToBufferedImage
{
  public BufferedImage Binary2BufferdImg(byte[] imageBinary)
    throws IOException
  {
    BufferedImage img = ImageIO.read(new ByteArrayInputStream(imageBinary));

    int width = img.getWidth();
    int height = img.getHeight();
    BufferedImage bufImage = new BufferedImage(width, height, 1);
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++)
      {
        int c = img.getRGB(x, y);
        int r = r(c);
        int g = g(c);
        int b = b(c);
        int rgb = rgb(r, g, b);
        bufImage.setRGB(x, y, rgb);
      }
    }
    return bufImage;
  }

  public static int a(int c)
  {
    return c >>> 24;
  }

  public static int r(int c)
  {
    return c >> 16 & 0xFF;
  }

  public static int g(int c)
  {
    return c >> 8 & 0xFF;
  }

  public static int b(int c)
  {
    return c & 0xFF;
  }

  public static int rgb(int r, int g, int b)
  {
    return 0xFF000000 | r << 16 | g << 8 | b;
  }

  public static int argb(int a, int r, int g, int b)
  {
    return a << 24 | r << 16 | g << 8 | b;
  }
}
