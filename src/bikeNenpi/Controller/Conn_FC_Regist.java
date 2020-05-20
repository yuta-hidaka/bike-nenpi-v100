/*     */ package bikeNenpi.Controller;
/*     */ import java.awt.image.BufferedImage;
/*     */ import java.io.FileOutputStream;
/*     */ import java.io.IOException;
/*     */ import java.io.OutputStream;
/*     */ import java.text.DateFormat;
import java.text.ParseException;
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.List;

/*     */ import javax.imageio.ImageIO;
/*     */ import javax.servlet.RequestDispatcher;
/*     */ import javax.servlet.ServletContext;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.annotation.WebServlet;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;

/*     */ import org.apache.tomcat.util.codec.binary.Base64;

/*     */
/*     */ import bikeNenpi.BEANS.Bean_BikeInfo;
/*     */ import bikeNenpi.BEANS.Bean_FCInfo;
/*     */ import bikeNenpi.DB.DAO_FC_Regist;
/*     */ import bikeNenpi.DB.DAO_Get_BikeList;
/*     */ import bikeNenpi.DB.DAO_Get_CountryList;
import bikeNenpi.DB.DAO_Get_FcList;
/*     */ import bikeNenpi.DB.DAO_Get_MakerList;
/*     */ import bikeNenpi.UTILs.BinaryToBufferedImage;
/*     */
/*     */
/*     */
/*     */
/*     */
/*     */
/*     */
/*     */ @WebServlet({"/FC_Regist"})
/*     */ public class Conn_FC_Regist
/*     */   extends HttpServlet
/*     */ {
/*     */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
 request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

/*  51 */     List<Bean_BikeInfo> CountryList = new ArrayList<Bean_BikeInfo>();
/*     */
/*  53 */     DateFormat format = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss.SSS");
/*  54 */     String date = format.format(new Date());
/*  55 */     date = date.replaceAll("/", "");
/*  56 */     date = date.replaceAll(":", "");
/*  57 */     date = date.replaceAll("\\.", "");
/*     */
/*     */
/*  60 */     String Uphot_base64 = request.getParameter("Uphot_base64") == null ? "" : request.getParameter("Uphot_base64");
/*  61 */     //String BackUp_Uphot_base64 = request.getParameter("BackUp_Uphot_base64") == null ? "" : request.getParameter("BackUp_Uphot_base64");
/*     */
/*     */
/*  65 */     double fc = Double.parseDouble(request.getParameter("fc") == null ? "0" : request.getParameter("fc"));
/*  66 */     String comment = request.getParameter("comment") == null ? "" : request.getParameter("comment");
/*  67 */     System.out.println(request.getParameter("city_ride"));
/*  68 */     int city_ride = Integer.parseInt(request.getParameter("city_ride") == null ? "50" : request.getParameter("city_ride"));
/*  69 */     System.out.println("testaa");
/*  70 */     int high_way_ride = Integer.parseInt(request.getParameter("high_way_ride") == null ? "50" : request.getParameter("high_way_ride"));
/*  71 */     int model_year = Integer.parseInt(request.getParameter("model_year") == null ? "0" : request.getParameter("model_year"));
/*  72 */     System.out.println("kik");
/*  73 */     int user_id = Integer.parseInt(request.getParameter("user_id") == null ? "0" : request.getParameter("user_id"));
/*  74 */     int bike_id = Integer.parseInt(request.getParameter("bike_id") == null ? "0" : request.getParameter("bike_id"));
/*  75 */     String user_name = request.getParameter("user_name") == null ? "ゲスト" : request.getParameter("user_name");
/*  76 */     String bike_name = request.getParameter("bike_name") == null ? "test" : request.getParameter("bike_name");
System.out.println("kik");
if(Integer.parseInt(request.getParameter("fc_regist_process_flg")) == 1){
	System.out.println("kikif");
user_id = Integer.parseInt(request.getParameter("user_id2") == null ? "0" : request.getParameter("user_id2"));
user_name = request.getParameter("user_name2") == null ? "ゲスト" : request.getParameter("user_name2");
}
/*     */System.out.println("kik");
/*  85 */     String setUbikePhotPass = request.getParameter("bike_name") == null ? "\\bikeNenpi\\img\\NoPhot2.png" : request.getParameter("setUbikePhotPass");
/*     */System.out.println("kik");
/*  87 */     int fuel = Integer.parseInt(request.getParameter("fuel") == null ? "0" : request.getParameter("fuel"));
/*     */System.out.println("kik");
/*     */
/*  90 */     Bean_FCInfo FCInfo = new Bean_FCInfo();
/*  91 */     FCInfo.setFc(fc);
/*  92 */     FCInfo.setFc_comment(comment);
/*  93 */     FCInfo.setCity_ride(city_ride);
/*  94 */     FCInfo.setHigh_way_ride(high_way_ride);
/*  95 */     FCInfo.setModel_year(model_year);
/*  96 */     FCInfo.setUser_id(user_id);
/*  97 */     FCInfo.setBike_id(bike_id);
/*  98 */     FCInfo.setBike_name(bike_name);
/*  99 */     FCInfo.setUser_name(user_name);
/*     */
/* 101 */     FCInfo.setUbikePhotPass(setUbikePhotPass);
/* 102 */     FCInfo.setFuel(fuel);
/*     */
System.out.println("userNAme"+user_name);
System.out.println("userID:::"+user_id);
System.out.println("fc:::"+fc);
System.out.println("fc:::"+high_way_ride);
System.out.println("fc:::"+model_year);
/*     */
/*     */
/* 106 */     FCInfo.setBcupUbikePhotPass("null");
/* 107 */     FCInfo.setUbikePhotPass("null");
/*     */
/* 109 */     String fileName = bike_id+"_"+ date + ".jpg";
///* 110 */     String fileName2 = bike_name + date + "_bcup.jpg";


/*     */System.out.println(request.getParameter("fc_regist_process_flg"));
/* 123 */     switch (Integer.parseInt(request.getParameter("fc_regist_process_flg")))
/*     */     {
/*     */     case 1:


	if(Uphot_base64 == null || Uphot_base64.isEmpty() || Uphot_base64.equals("0")){
		FCInfo.setUbikePhotPass("\\bikeNenpi\\img\\NoPhot2.png");

	}else{
		ServletContext servletContext = getServletConfig().getServletContext();
		String uploadPath = servletContext.getRealPath("/") + "img/";
		System.out.println(uploadPath);

		byte[] imageBinary = Base64.decodeBase64(Uphot_base64);
		BinaryToBufferedImage BToBI = new BinaryToBufferedImage();
		BufferedImage bufImage = BToBI.Binary2BufferdImg(imageBinary);


		FCInfo.setUbikePhotPass("/bikeNenpi/img/" + fileName);

		OutputStream out = new FileOutputStream(uploadPath + fileName);
		ImageIO.write(bufImage, "jpg", out);

		System.out.println(uploadPath + fileName);

	}

				//平均燃費と最高燃費の書き換え
				Bean_BikeInfo MaxAveFcInfo = new Bean_BikeInfo();
				MaxAveFcInfo = DAO_Get_FcList.GetMostAveFc(FCInfo.getBike_id());
				Double ave = MaxAveFcInfo.getFc_ave();
				Double max = MaxAveFcInfo.getFc_max();


				DateFormat f = new SimpleDateFormat("yyyy/MM");
				String ThisMonth = f.format(new Date());
				String rMonth = MaxAveFcInfo.getFc_update_date() == null  ?  ThisMonth  : MaxAveFcInfo.getFc_update_date() ;
				Date g = null;
				Date h = null;

	try {
		g = f.parse(rMonth );
		h =  f.parse(ThisMonth);
		rMonth = f.format(g);
		System.out.println("kokoko2");
	} catch (ParseException e) {
		e.printStackTrace();

	}

				//平均燃費の算出
				if(ave == null || ave == 0.0 || ave.isNaN() ){
					MaxAveFcInfo.setFc_ave(FCInfo.getFc());
				}else{
					MaxAveFcInfo.setFc_ave((ave + FCInfo.getFc())/2);
				}

				//一か月以内の最高燃費の算出・比較。
				if(g.equals(h)){
					if(max == null || max == 0.0 || max.isNaN() || max <= FCInfo.getFc() || ThisMonth==""){
						MaxAveFcInfo.setFc_max(FCInfo.getFc());
						MaxAveFcInfo.setFc_max_user_name(FCInfo.getUser_name());
					}else{
								}
				}else{
					MaxAveFcInfo.setFc_max(FCInfo.getFc());
					MaxAveFcInfo.setFc_max_user_name(FCInfo.getUser_name());
				}



				//最高燃費・平均燃費の登録
				DAO_FC_Regist.FcMaxAveRegist(MaxAveFcInfo);
/*     */
/* 159 */       DAO_FC_Regist.FcRegist(FCInfo);
/*     */
/* 184 */       request.setAttribute("bike_id", FCInfo.getBike_id());
/* 161 */       RequestDispatcher dispatcher1 =
/* 162 */         request.getRequestDispatcher("/contents/FcRegist/fc_regist_complete.jsp");
/* 163 */       dispatcher1.forward(request, response);
/*     */
/*     */
/* 166 */       break;
/*     */
/*     */
/*     */
/*     */     case 2:
/*     */       break;
/*     */
/*     */
/*     */
/*     */
/*     */     case 3:
/* 177 */       DAO_FC_Regist.FcRegist(FCInfo);
/* 178 */       break;
/*     */
/*     */
/*     */     case 4:
/* 182 */       CountryList = DAO_Get_MakerList.Get_Maker();
/*     */
/* 184 */       request.setAttribute("list", CountryList);
/* 185 */       RequestDispatcher dispatcher4 =
/* 186 */         request.getRequestDispatcher("/contents/FcRegist/find_with_maker.jsp");
/* 187 */       dispatcher4.forward(request, response);
/*     */
/* 189 */       break;
/*     */
/*     */
/*     */     case 5:
/* 193 */       CountryList = DAO_Get_CountryList.Get_Country();
/*     */
/* 195 */       request.setAttribute("list", CountryList);
/* 196 */       RequestDispatcher dispatcher5 =
/* 197 */         request.getRequestDispatcher("/contents/FcRegist/find_with_country.jsp");
/* 198 */       dispatcher5.forward(request, response);
/*     */
/* 200 */       break;
/*     */
/*     */
/*     */     case 6:
/* 204 */       System.out.println(Integer.parseInt(request.getParameter("country_id")));
/* 205 */       CountryList = DAO_Get_MakerList.Get_MakerByCountryId(Integer.parseInt(request.getParameter("country_id")));
/*     */
/* 207 */       request.setAttribute("list", CountryList);
/* 208 */       RequestDispatcher dispatcher6 =
/* 209 */         request.getRequestDispatcher("/contents/FcRegist/find_with_country2.jsp");
/* 210 */       dispatcher6.forward(request, response);
/*     */
/* 212 */       break;
/*     */
/*     */
/*     */     case 7:
/* 216 */       CountryList = DAO_Get_BikeList.Get_BikeByMakerId(Integer.parseInt(request.getParameter("maker_id")));
/* 217 */       request.setAttribute("list", CountryList);
/* 218 */       RequestDispatcher dispatcher7 =
/* 219 */         request.getRequestDispatcher("/contents/FcRegist/find_with_bike.jsp");
/* 220 */       dispatcher7.forward(request, response);
/*     */
/* 222 */       break;
/*     */
/*     */
/*     */     case 8:
/* 226 */       Bean_BikeInfo Bean_BikeInfo = new Bean_BikeInfo();
/* 226 */
/* 227 */       Bean_BikeInfo.setBike_id(Integer.parseInt(request.getParameter("bike_id")));
/* 228 */       Bean_BikeInfo.setBike_name(request.getParameter("bike_name"));


/*     */
/* 230 */       request.setAttribute("list", Bean_BikeInfo);
/* 231 */       RequestDispatcher dispatcher8 =
/* 232 */         request.getRequestDispatcher("/contents/FcRegist/fc_regist.jsp");
/* 233 */       dispatcher8.forward(request, response);
/*     */     }
/*     */   }

/*     */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {

 request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

/*  51 */     List<Bean_BikeInfo> CountryList = new ArrayList<Bean_BikeInfo>();
/*     */
/*  53 */     DateFormat format = new SimpleDateFormat("yyyy/MM/dd/hh:mm:ss.SSS");
/*  54 */     String date = format.format(new Date());
/*  55 */     date = date.replaceAll("/", "");
/*  56 */     date = date.replaceAll(":", "");
/*  57 */     date = date.replaceAll("\\.", "");
/*     */
/*     */
/*  60 */     String Uphot_base64 = request.getParameter("Uphot_base64") == null ? "" : request.getParameter("Uphot_base64");
/*  61 */     //String BackUp_Uphot_base64 = request.getParameter("BackUp_Uphot_base64") == null ? "" : request.getParameter("BackUp_Uphot_base64");
/*     */
/*     */
/*  65 */     double fc = Double.parseDouble(request.getParameter("fc") == null ? "0" : request.getParameter("fc"));
/*  66 */     String comment = request.getParameter("comment") == null ? "" : request.getParameter("comment");
/*  67 */     System.out.println(request.getParameter("city_ride"));
/*  68 */     int city_ride = Integer.parseInt(request.getParameter("city_ride") == null ? "50" : request.getParameter("city_ride"));
/*  69 */     System.out.println("testaa");
/*  70 */     int high_way_ride = Integer.parseInt(request.getParameter("high_way_ride") == null ? "50" : request.getParameter("high_way_ride"));
/*  71 */     int model_year = Integer.parseInt(request.getParameter("model_year") == null ? "0" : request.getParameter("model_year"));
/*  72 */     System.out.println("kik");
/*  73 */     int user_id = Integer.parseInt(request.getParameter("user_id") == null ? "0" : request.getParameter("user_id"));
/*  74 */     int bike_id = Integer.parseInt(request.getParameter("bike_id") == null ? "0" : request.getParameter("bike_id"));
/*  75 */     String user_name = request.getParameter("user_name") == null ? "ゲスト" : request.getParameter("user_name");
/*  76 */     String bike_name = request.getParameter("bike_name") == null ? "test" : request.getParameter("bike_name");
System.out.println("kik");
if(Integer.parseInt(request.getParameter("fc_regist_process_flg")) == 1){
	System.out.println("kikif");
user_id = Integer.parseInt(request.getParameter("user_id2") == null ? "0" : request.getParameter("user_id2"));
user_name = request.getParameter("user_name2") == null ? "ゲスト" : request.getParameter("user_name2");
}
/*     */System.out.println("kik");
/*  85 */     String setUbikePhotPass = request.getParameter("bike_name") == null ? "\\bikeNenpi\\img\\NoPhot2.png" : request.getParameter("setUbikePhotPass");
/*     */System.out.println("kik");
/*  87 */     int fuel = Integer.parseInt(request.getParameter("fuel") == null ? "0" : request.getParameter("fuel"));
/*     */System.out.println("kik");
/*     */
/*  90 */     Bean_FCInfo FCInfo = new Bean_FCInfo();
/*  91 */     FCInfo.setFc(fc);
/*  92 */     FCInfo.setFc_comment(comment);
/*  93 */     FCInfo.setCity_ride(city_ride);
/*  94 */     FCInfo.setHigh_way_ride(high_way_ride);
/*  95 */     FCInfo.setModel_year(model_year);
/*  96 */     FCInfo.setUser_id(user_id);
/*  97 */     FCInfo.setBike_id(bike_id);
/*  98 */     FCInfo.setBike_name(bike_name);
/*  99 */     FCInfo.setUser_name(user_name);
/*     */
/* 101 */     FCInfo.setUbikePhotPass(setUbikePhotPass);
/* 102 */     FCInfo.setFuel(fuel);
/*     */
System.out.println("userNAme"+user_name);
System.out.println("userID:::"+user_id);
System.out.println("fc:::"+fc);
System.out.println("fc:::"+high_way_ride);
System.out.println("fc:::"+model_year);
/*     */
/*     */
/* 106 */     FCInfo.setBcupUbikePhotPass("null");
/* 107 */     FCInfo.setUbikePhotPass("null");
/*     */
/* 109 */     String fileName = bike_id+"_"+ date + ".jpg";
///* 110 */     String fileName2 = bike_name + date + "_bcup.jpg";


/*     */System.out.println(request.getParameter("fc_regist_process_flg"));
/* 123 */     switch (Integer.parseInt(request.getParameter("fc_regist_process_flg")))
/*     */     {
/*     */     case 1:


	if(Uphot_base64 == null || Uphot_base64.isEmpty() || Uphot_base64.equals("0")){
		FCInfo.setUbikePhotPass("\\bikeNenpi\\img\\NoPhot2.png");

	}else{
		ServletContext servletContext = getServletConfig().getServletContext();
		String uploadPath = servletContext.getRealPath("/") + "img/ubike/";
		System.out.println(uploadPath);

		byte[] imageBinary = Base64.decodeBase64(Uphot_base64);
		BinaryToBufferedImage BToBI = new BinaryToBufferedImage();
		BufferedImage bufImage = BToBI.Binary2BufferdImg(imageBinary);


		FCInfo.setUbikePhotPass("/bikeNenpi/img/ubike/" + fileName);

		OutputStream out = new FileOutputStream(uploadPath + fileName);
		ImageIO.write(bufImage, "jpg", out);

		System.out.println(uploadPath + fileName);

	}

				//平均燃費と最高燃費の書き換え
				Bean_BikeInfo MaxAveFcInfo = new Bean_BikeInfo();
				MaxAveFcInfo = DAO_Get_FcList.GetMostAveFc(FCInfo.getBike_id());
				Double ave = MaxAveFcInfo.getFc_ave();
				Double max = MaxAveFcInfo.getFc_max();


				DateFormat f = new SimpleDateFormat("yyyy/MM");
				String ThisMonth = f.format(new Date());
				String rMonth = MaxAveFcInfo.getFc_update_date() == null  ?  ThisMonth  : MaxAveFcInfo.getFc_update_date() ;
				Date g = null;
				Date h = null;

	try {
		g = f.parse(rMonth );
		h =  f.parse(ThisMonth);
		rMonth = f.format(g);
		System.out.println("kokoko2");
	} catch (ParseException e) {
		e.printStackTrace();

	}

				//平均燃費の算出
				if(ave == null || ave == 0.0 || ave.isNaN() ){
					MaxAveFcInfo.setFc_ave(FCInfo.getFc());
				}else{
					MaxAveFcInfo.setFc_ave((ave + FCInfo.getFc())/2);
				}

				//一か月以内の最高燃費の算出・比較。
				if(g.equals(h)){
					if(max == null || max == 0.0 || max.isNaN() || max <= FCInfo.getFc() || ThisMonth==""){
						MaxAveFcInfo.setFc_max(FCInfo.getFc());
						MaxAveFcInfo.setFc_max_user_name(FCInfo.getUser_name());
					}else{
								}
				}else{
					MaxAveFcInfo.setFc_max(FCInfo.getFc());
					MaxAveFcInfo.setFc_max_user_name(FCInfo.getUser_name());
				}



				//最高燃費・平均燃費の登録
				DAO_FC_Regist.FcMaxAveRegist(MaxAveFcInfo);
/*     */
/* 159 */       DAO_FC_Regist.FcRegist(FCInfo);
/*     */
/* 184 */       request.setAttribute("bike_id", FCInfo.getBike_id());
/* 161 */       RequestDispatcher dispatcher1 =
/* 162 */         request.getRequestDispatcher("/contents/FcRegist/fc_regist_complete.jsp");
/* 163 */       dispatcher1.forward(request, response);
/*     */
/*     */
/* 166 */       break;
/*     */
/*     */
/*     */
/*     */     case 2:
/*     */       break;
/*     */
/*     */
/*     */
/*     */
/*     */     case 3:
/* 177 */       DAO_FC_Regist.FcRegist(FCInfo);
/* 178 */       break;
/*     */
/*     */
/*     */     case 4:
/* 182 */       CountryList = DAO_Get_MakerList.Get_Maker();
/*     */
/* 184 */       request.setAttribute("list", CountryList);
/* 185 */       RequestDispatcher dispatcher4 =
/* 186 */         request.getRequestDispatcher("/contents/FcRegist/find_with_maker.jsp");
/* 187 */       dispatcher4.forward(request, response);
/*     */
/* 189 */       break;
/*     */
/*     */
/*     */     case 5:
/* 193 */       CountryList = DAO_Get_CountryList.Get_Country();
/*     */
/* 195 */       request.setAttribute("list", CountryList);
/* 196 */       RequestDispatcher dispatcher5 =
/* 197 */         request.getRequestDispatcher("/contents/FcRegist/find_with_country.jsp");
/* 198 */       dispatcher5.forward(request, response);
/*     */
/* 200 */       break;
/*     */
/*     */
/*     */     case 6:
/* 204 */       System.out.println(Integer.parseInt(request.getParameter("country_id")));
/* 205 */       CountryList = DAO_Get_MakerList.Get_MakerByCountryId(Integer.parseInt(request.getParameter("country_id")));
/*     */
/* 207 */       request.setAttribute("list", CountryList);
/* 208 */       RequestDispatcher dispatcher6 =
/* 209 */         request.getRequestDispatcher("/contents/FcRegist/find_with_country2.jsp");
/* 210 */       dispatcher6.forward(request, response);
/*     */
/* 212 */       break;
/*     */
/*     */
/*     */     case 7:
/* 216 */       CountryList = DAO_Get_BikeList.Get_BikeByMakerId(Integer.parseInt(request.getParameter("maker_id")));
/* 217 */       request.setAttribute("list", CountryList);
/* 218 */       RequestDispatcher dispatcher7 =
/* 219 */         request.getRequestDispatcher("/contents/FcRegist/find_with_bike.jsp");
/* 220 */       dispatcher7.forward(request, response);
/*     */
/* 222 */       break;
/*     */
/*     */
/*     */     case 8:
/* 226 */       Bean_BikeInfo Bean_BikeInfo = new Bean_BikeInfo();
/* 226 */
/* 227 */       Bean_BikeInfo.setBike_id(Integer.parseInt(request.getParameter("bike_id")));
/* 228 */       Bean_BikeInfo.setBike_name(request.getParameter("bike_name"));


/*     */
/* 230 */       request.setAttribute("list", Bean_BikeInfo);
/* 231 */       RequestDispatcher dispatcher8 =
/* 232 */         request.getRequestDispatcher("/contents/FcRegist/fc_regist.jsp");
/* 233 */       dispatcher8.forward(request, response);
/*     */     }
/*     */   }

/*     */ }


