package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class dbManager
{
  private static final String DRIVER = "org.mariadb.jdbc.Driver";
  private static final String URL = "jdbc:mariadb://localhost/bike_nenpi";
  private static final String USER_NAME = "root";
  private static final String PASSWORD = "souldout322";

  public static Connection getConnection()
    throws ClassNotFoundException, SQLException
  {
    Class.forName("org.mariadb.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost/bike_nenpi", "root", "souldout322");

		DateFormat format = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss.SSS");
		String date = format.format(new Date());
    System.out.println("DBに接続中...");
    System.out.println(date);

    return conn;
  }

  public static void close(Connection connection)
  {
    if (connection != null) {
      try
      {
        connection.close();
 		DateFormat format = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss.SSS");
 		String date = format.format(new Date());
        System.out.println("DB接続終了");
        System.out.println(date);
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
    }
  }

  public static void close(PreparedStatement preparedStatement)
  {
    if (preparedStatement != null) {
      try
      {
        preparedStatement.close();
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
    }
  }

  public static void close(ResultSet resultSet)
  {
    if (resultSet != null) {
      try
      {
        resultSet.close();
      }
      catch (SQLException e)
      {
        e.printStackTrace();
      }
    }
  }
}
