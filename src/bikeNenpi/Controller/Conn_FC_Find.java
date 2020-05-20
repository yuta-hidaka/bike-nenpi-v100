 package bikeNenpi.Controller;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bikeNenpi.BEANS.Bean_BikeInfo;
import bikeNenpi.BEANS.Bean_FCInfo;
import bikeNenpi.DB.DAO_Get_BikeList;
import bikeNenpi.DB.DAO_Get_CountryList;
import bikeNenpi.DB.DAO_Get_MakerList;

@WebServlet({"/FC_Find"})
public class Conn_FC_Find
  extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url;
    RequestDispatcher dispatcher7, dispatcher6, dispatcher5, dispatcher4, dispatcher1;
    List<Bean_BikeInfo> CountryList = new ArrayList<Bean_BikeInfo>();
    List<Bean_FCInfo> FcList = new ArrayList<Bean_FCInfo>();

    DateFormat format = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss.SSS");
    String date = format.format(new Date());
    date = date.replaceAll("/", "");
    date = date.replaceAll(":", "");
    date = date.replaceAll("\\.", "");


    String Uphot_base64 = (request.getParameter("Uphot_base64") == null) ? "" : request.getParameter("Uphot_base64");
    String BackUp_Uphot_base64 = (request.getParameter("BackUp_Uphot_base64") == null) ? "" : request.getParameter("BackUp_Uphot_base64");

    System.out.println("test");

    double fc = Double.parseDouble((request.getParameter("fc") == null) ? "0" : request.getParameter("fc"));
    String comment = (request.getParameter("comment") == null) ? "" : request.getParameter("comment");
    System.out.println(request.getParameter("city_ride"));
    int city_ride = Integer.parseInt((request.getParameter("city_ride") == null) ? "50" : request.getParameter("city_ride"));
    System.out.println("testaa");
    int high_way_ride = Integer.parseInt((request.getParameter("high_way_ride") == null) ? "50" : request.getParameter("high_way_ride"));
    int model_year = Integer.parseInt((request.getParameter("model_year") == null) ? "0" : request.getParameter("model_year"));
    System.out.println("testaa");
    int user_id = Integer.parseInt((request.getParameter("user_id") == null) ? "0" : request.getParameter("user_id"));
    int bike_id = Integer.parseInt((request.getParameter("bike_id") == null) ? "0" : request.getParameter("bike_id"));
    String user_name = (request.getParameter("user_name") == null) ? "" : request.getParameter("user_name");
    String bike_name = (request.getParameter("bike_name") == null) ? "test" : request.getParameter("bike_name");


    System.out.println(user_id);
    System.out.println(bike_name);


    System.out.println("test");

    String setUbikePhotPass = (request.getParameter("bike_name") == null) ? "\\bikeNenpi\\img\\NoPhot2.png" : request.getParameter("setUbikePhotPass");

    int fuel = Integer.parseInt((request.getParameter("fuel") == null) ? "0" : request.getParameter("fuel"));


    Bean_FCInfo FCInfo = new Bean_FCInfo();
    FCInfo.setFc(fc);
    FCInfo.setFc_comment(comment);
    FCInfo.setCity_ride(city_ride);
    FCInfo.setHigh_way_ride(high_way_ride);
    FCInfo.setModel_year(model_year);
    FCInfo.setUser_id(user_id);
    FCInfo.setBike_id(bike_id);
    FCInfo.setBike_name(bike_name);
    FCInfo.setUser_name(user_name);

    FCInfo.setUbikePhotPass(setUbikePhotPass);
    FCInfo.setFuel(fuel);



    FCInfo.setBcupUbikePhotPass("null");
    FCInfo.setUbikePhotPass("null");

    String fileName = String.valueOf(bike_name) + date + ".jpg";
    String fileName2 = String.valueOf(bike_name) + date + "_bcup.jpg";
    System.out.println(date);









    System.out.println(Integer.parseInt(request.getParameter("fc_find_process_flg")));

    switch (Integer.parseInt(request.getParameter("fc_find_process_flg"))) {


      case 1:
        dispatcher1 =
          request.getRequestDispatcher("/contents/FcFind/fc_regist_complete.jsp");
        dispatcher1.forward(request, response);
        break;



      case 2:
 	System.out.println("OK:"+Integer.parseInt(request.getParameter("bike_id")));
 	System.out.println("OK:"+Integer.parseInt(request.getParameter("model_year")));

 	ArrayList<String> list = new ArrayList<String>();
 	list.add(request.getParameter("bike_id"));
 	list.add(request.getParameter("model_year"));


 	 request.setAttribute("list", list);
        RequestDispatcher dispatcher2 =
        		request.getRequestDispatcher("/contents/account/history_fc_graph.jsp");
        dispatcher2.forward(request, response);
        break;


      case 4:
        CountryList = DAO_Get_MakerList.Get_Maker();

        request.setAttribute("list", CountryList);
        dispatcher4 =
          request.getRequestDispatcher("/contents/FcFind/find_with_maker.jsp");
        dispatcher4.forward(request, response);
        break;



      case 5:
        CountryList = DAO_Get_CountryList.Get_Country();

        request.setAttribute("list", CountryList);
        dispatcher5 =
          request.getRequestDispatcher("/contents/FcFind/find_with_country.jsp");
        dispatcher5.forward(request, response);
        break;



      case 6:
        System.out.println(Integer.parseInt(request.getParameter("country_id")));
        CountryList = DAO_Get_MakerList.Get_MakerByCountryId(Integer.parseInt(request.getParameter("country_id")));

        request.setAttribute("list", CountryList);
        dispatcher6 =
          request.getRequestDispatcher("/contents/FcFind/find_with_country2.jsp");
        dispatcher6.forward(request, response);
        break;



      case 7:
        CountryList = DAO_Get_BikeList.Get_BikeByMakerId(Integer.parseInt(request.getParameter("maker_id")));
        request.setAttribute("list", CountryList);
        dispatcher7 =
          request.getRequestDispatcher("/contents/FcFind/find_with_bike.jsp");
        dispatcher7.forward(request, response);
        break;





      case 8:
        System.out.println(Integer.parseInt(request.getParameter("bike_id")));
        url = "/bikeNenpi/contents/bike/" + request.getParameter("bike_id") + ".jsp";


        response.sendRedirect(url);
        break;
    }
  }
}
