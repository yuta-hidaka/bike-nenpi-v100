package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_BikeInfo;
import bikeNenpi.BEANS.Bean_FCInfo;

public class DAO_Get_FcList {

	public static void main(String[] args) {

        List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
        Bean_FCInfoList = DAO_Get_FcList.FcFind(1,5);

        for(int i=0 ;  i < Bean_FCInfoList.size() ; i++){
        System.out.println(Bean_FCInfoList.get(i).getBike_name());
        System.out.println(Bean_FCInfoList.get(i).getCity_ride());
        System.out.println(Bean_FCInfoList.get(i).getFc());
        System.out.println(Bean_FCInfoList.get(i).getHigh_way_ride());
        System.out.println(Bean_FCInfoList.get(i).getUser_name());


        System.out.println("ue");
        System.out.println(Bean_FCInfoList.get(i).getFc_comment());
        System.out.println(Bean_FCInfoList.get(i).getDate_time());

        System.out.println("\r");
        }

	}
    public static List<Bean_FCInfo> FcFindbyUserId(int user_id,int findPoint){


        List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
           Connection connection =null;
           PreparedStatement preparedStatement = null;
           ResultSet resultSet = null;
//
//           double mostFc = 0;
//           String mostFcUser = null;
//

           try{
               //DBへ接続します。
               connection = dbManager.getConnection();
               //SQL文の準備
               //SQL文が動作するかをoracleで確認しましょう。
               String sql =
                       "SELECT * FROM bike_table INNER JOIN fc_table "
                       + "ON fc_table.bike_id = bike_table.bike_id LEFT OUTER JOIN user_table "
                       + "ON user_table.user_id = fc_table.user_id WHERE user_table.user_id=? "
                       + "ORDER BY fc_table.fc_id DESC limit "+findPoint+" ,5";

               //ステートメントを作成する。
               preparedStatement =
                       connection.prepareStatement(sql);

               //値のバインド
	            preparedStatement.setInt(1,user_id );



               //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
               resultSet = preparedStatement.executeQuery();



               //ここでDBから接続したデータをリストに格納していきます。
               while (resultSet.next()) {
            		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();

               	Bean_FCInfo.setBike_id(resultSet.getInt("bike_id"));
               	Bean_FCInfo.setBike_name(resultSet.getString("bike_name"));
               	Bean_FCInfo.setModel_year(resultSet.getInt("model_year"));

               	Bean_FCInfo.setFc_id(resultSet.getInt("fc_id"));
               	Bean_FCInfo.setFc(resultSet.getDouble("fc"));
               	Bean_FCInfo.setFc_good(resultSet.getInt("fc_good"));
               	Bean_FCInfo.setFuel(resultSet.getInt("fuel"));

               	Bean_FCInfo.setUser_id(resultSet.getInt("user_id"));
               	Bean_FCInfo.setUser_name(resultSet.getString("user_name"));

               	Bean_FCInfo.setCity_ride(resultSet.getInt("city_ride"));
               	Bean_FCInfo.setHigh_way_ride(resultSet.getInt("high_way_ride"));

               	Bean_FCInfo.setFc_comment(resultSet.getString("fc_comment"));
               	Bean_FCInfo.setDate_time(resultSet.getString("fc_regist_time"));

               	Bean_FCInfo.setRegist_time(resultSet.getString("fc_regist_time"));
               	Bean_FCInfo.setUbikePhotPass(resultSet.getString("phot_pass"));

//               	if(resultSet.getDouble("fc") >= mostFc){
//               		mostFc = resultSet.getDouble("fc");
//               		mostFcUser = resultSet.getString("user_name");
//               	}

               	Bean_FCInfoList.add(Bean_FCInfo);
               }

           }catch(Exception e){
               e.printStackTrace();
           }finally{
               dbManager.close(resultSet);
               dbManager.close(preparedStatement);
               dbManager.close(connection);
           }

//	        System.out.println("ここでパスワードを取得しました。"+pass);

           //リストに格納されたミュージシャンたちを戻り値に設定します。
           return Bean_FCInfoList;
       }
    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static List<Bean_FCInfo> FcFind(int bike_id,int findPoint){


         List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
//
//            double mostFc = 0;
//            String mostFcUser = null;
//

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        "SELECT * FROM bike_table INNER JOIN fc_table "
                        + "ON fc_table.bike_id = bike_table.bike_id LEFT OUTER JOIN user_table "
                        + "ON user_table.user_id = fc_table.user_id WHERE bike_table.bike_id=? "
                        + "ORDER BY fc_table.fc_id DESC limit  ?  ,5";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,bike_id );
	            preparedStatement.setInt(2,findPoint );


                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {
             		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();

                	Bean_FCInfo.setBike_id(resultSet.getInt("bike_id"));
                	Bean_FCInfo.setBike_name(resultSet.getString("bike_name"));
                	Bean_FCInfo.setModel_year(resultSet.getInt("model_year"));

                	Bean_FCInfo.setFc_id(resultSet.getInt("fc_id"));
                	Bean_FCInfo.setFc(resultSet.getDouble("fc"));
                	Bean_FCInfo.setFc_good(resultSet.getInt("fc_good"));
                	Bean_FCInfo.setFuel(resultSet.getInt("fuel"));

                	Bean_FCInfo.setUser_id(resultSet.getInt("user_id"));
                	Bean_FCInfo.setUser_name(resultSet.getString("user_name"));

                	Bean_FCInfo.setCity_ride(resultSet.getInt("city_ride"));
                	Bean_FCInfo.setHigh_way_ride(resultSet.getInt("high_way_ride"));

                	Bean_FCInfo.setFc_comment(resultSet.getString("fc_comment"));
                	Bean_FCInfo.setDate_time(resultSet.getString("fc_regist_time"));

                	Bean_FCInfo.setRegist_time(resultSet.getString("fc_regist_time"));
                	Bean_FCInfo.setUbikePhotPass(resultSet.getString("phot_pass"));

//                	if(resultSet.getDouble("fc") >= mostFc){
//                		mostFc = resultSet.getDouble("fc");
//                		mostFcUser = resultSet.getString("user_name");
//                	}

                	Bean_FCInfoList.add(Bean_FCInfo);
                }

            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

//	        System.out.println("ここでパスワードを取得しました。"+pass);

            //リストに格納されたミュージシャンたちを戻り値に設定します。
            return Bean_FCInfoList;
        }

     public static Bean_BikeInfo GetMostAveFc(int bike_id){

  		Bean_BikeInfo Info = new Bean_BikeInfo();


            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
//
//            double mostFc = 0;
//            String mostFcUser = null;
//

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                String sql =
                        "SELECT fc_max,fc_ave,fc_max_user_name,fc_update_date FROM bike_table WHERE bike_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,bike_id );



                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {


                	Info.setFc_max(resultSet.getDouble("fc_max"));
                	Info.setFc_ave(resultSet.getDouble("fc_ave"));
                	Info.setFc_update_date(resultSet.getString("fc_update_date"));
                	Info.setFc_max_user_name(resultSet.getString("fc_max_user_name"));
                	Info.setBike_id(bike_id);


                }

            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }


            return Info;

     }


     public static List<Bean_FCInfo> FcFindDate(int bike_id, int user_id,String date,int model_year){


         List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
//
//            double mostFc = 0;
//            String mostFcUser = null;
//

            try{
            	System.out.println(date);
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        "SELECT * FROM bike_table INNER JOIN fc_table "
                        + "ON fc_table.bike_id = bike_table.bike_id LEFT OUTER JOIN user_table "
                        + "ON user_table.user_id = fc_table.user_id "
                        + "WHERE bike_table.bike_id=?  AND fc_table.fc_regist_time <= ? AND fc_table.user_id = ? AND fc_table.model_year=? "
                        + "ORDER BY fc_table.fc_regist_time ASC limit 20";


                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,bike_id );
	            preparedStatement.setString(2,date );
	            preparedStatement.setInt(3,user_id );
	            preparedStatement.setInt(4,model_year);



                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {
             		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();

                	Bean_FCInfo.setBike_id(resultSet.getInt("bike_id"));
                	Bean_FCInfo.setBike_name(resultSet.getString("bike_name"));
                	Bean_FCInfo.setModel_year(resultSet.getInt("model_year"));

                	Bean_FCInfo.setFc_id(resultSet.getInt("fc_id"));
                	Bean_FCInfo.setFc(resultSet.getDouble("fc"));
                	Bean_FCInfo.setFc_good(resultSet.getInt("fc_good"));
                	Bean_FCInfo.setFuel(resultSet.getInt("fuel"));

                	Bean_FCInfo.setUser_id(resultSet.getInt("user_id"));
                	Bean_FCInfo.setUser_name(resultSet.getString("user_name"));

                	Bean_FCInfo.setCity_ride(resultSet.getInt("city_ride"));
                	Bean_FCInfo.setHigh_way_ride(resultSet.getInt("high_way_ride"));

                	Bean_FCInfo.setFc_comment(resultSet.getString("fc_comment"));
                	Bean_FCInfo.setDate_time(resultSet.getString("fc_regist_time"));

                	Bean_FCInfo.setRegist_time(resultSet.getString("fc_regist_time"));
                	Bean_FCInfo.setUbikePhotPass(resultSet.getString("phot_pass"));

//                	if(resultSet.getDouble("fc") >= mostFc){
//                		mostFc = resultSet.getDouble("fc");
//                		mostFcUser = resultSet.getString("user_name");
//                	}

                	Bean_FCInfoList.add(Bean_FCInfo);
                }

            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

//	        System.out.println("ここでパスワードを取得しました。"+pass);

            //リストに格納されたミュージシャンたちを戻り値に設定します。
            return Bean_FCInfoList;
        }




     public static void updateFcGood(int fc_id , int fc_good){

    	 Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
//
//            double mostFc = 0;
//            String mostFcUser = null;
//

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                String sql =
                        "UPDATE fc_table "
                        + "SET fc_good = ? "
                        + "WHERE fc_id = ? ";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,fc_good );
	            preparedStatement.setInt(2,fc_id );




                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。

            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

//	        System.out.println("ここでパスワードを取得しました。"+pass);

            //リストに格納されたミュージシャンたちを戻り値に設定します。

     }


     public static void deleteFc(int fc_id){

            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        "DELETE FROM fc_table WHERE fc_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,fc_id );



                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。



            }catch(Exception e){
                e.printStackTrace();
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

//	        System.out.println("ここでパスワードを取得しました。"+pass);

            //リストに格納されたミュージシャンたちを戻り値に設定します。

        }


}