package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import bikeNenpi.BEANS.Bean_BikeInfo;
import bikeNenpi.BEANS.Bean_FCInfo;

public class DAO_FC_Regist {

	public static void main(String[] args) {

        Calendar calendar = Calendar.getInstance();
        System.out.println(calendar.getTime());

        String str = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(calendar.getTime());
        Random rnd = new Random();
        System.out.println("test");
		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();




		Bean_FCInfo.setFc(rnd.nextInt(30)+Math.random());
		Bean_FCInfo.setModel_year(1994);
		Bean_FCInfo.setCity_ride(40);
		Bean_FCInfo.setHigh_way_ride(50);
		Bean_FCInfo.setFc_comment("テストい感じ");
		Bean_FCInfo.setBike_id(1);
		Bean_FCInfo.setUser_id(1);


        Bean_FCInfo.setFc_good(23);
        Bean_FCInfo.setFuel(1);
        Bean_FCInfo.setUbikePhotPass("testPass");

		Bean_FCInfo.setDate_time(str);
		DAO_FC_Regist.FcRegist(Bean_FCInfo);

	}


    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static void FcRegist(Bean_FCInfo Bean_FCInfo){

 		DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
 		String date = format.format(new Date());
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                String sql =
                		"INSERT INTO fc_table(fc_id,fc,model_year,city_ride,high_way_ride,fc_comment,bike_id,user_id,"
                		+ "fc_good,fuel,phot_pass,fc_regist_time ,update_time)"
                		+ "VALUES(NEXTVAL(seq_fc_id),?,?,?,?,?,?,?,?,?,?,?,?)";


                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド

	            preparedStatement.setDouble(1, Bean_FCInfo.getFc());
	            preparedStatement.setInt(2, Bean_FCInfo.getModel_year());
	            preparedStatement.setInt(3, Bean_FCInfo.getCity_ride());
	            preparedStatement.setInt(4, Bean_FCInfo.getHigh_way_ride());
	            preparedStatement.setString(5, Bean_FCInfo.getFc_comment());

	            preparedStatement.setInt(6, Bean_FCInfo.getBike_id());
	            preparedStatement.setInt(7, Bean_FCInfo.getUser_id());


	            preparedStatement.setInt(8, Bean_FCInfo.getFc_good());
	            preparedStatement.setInt(9, Bean_FCInfo.getFuel());
	            preparedStatement.setString(10, Bean_FCInfo.getUbikePhotPass());
	            preparedStatement.setString(11, date);
	            preparedStatement.setString(12, date);


                //SQL文の実行。検索のときはExecuteQUERI、更新削除などのときはUPDATE。
                preparedStatement.executeUpdate();


            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

        }

     public static void FcMaxAveRegist(Bean_BikeInfo Info){

    	 System.out.println("FcMaxAveRegist");

 		DateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
 		String date = format.format(new Date());
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                String sql =
                		"UPDATE bike_table SET fc_max=? ,fc_ave=?,fc_max_user_name=?,fc_update_date=?"
                		+ " WHERE bike_id = ?";




                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド

	            preparedStatement.setDouble(1, Info.getFc_max() );
	            preparedStatement.setDouble(2, Info.getFc_ave() );
	            preparedStatement.setString(3, Info.getFc_max_user_name() );
	            preparedStatement.setString(4, date );
	            preparedStatement.setInt(5, Info.getBike_id());



                //SQL文の実行。検索のときはExecuteQUERI、更新削除などのときはUPDATE。
                preparedStatement.executeUpdate();


            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

        }


}