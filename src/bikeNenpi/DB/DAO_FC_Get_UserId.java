package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_FCInfo;

public class DAO_FC_Get_UserId {

//	public static void main(String[] args) {
//		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();
//        List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
//        Bean_FCInfoList = DAO_FC_Get_UserId.FC_Get_UserId(2);
//
//        for(int i=0 ;  i < Bean_FCInfoList.size() ; i++){
//        System.out.println(Bean_FCInfoList.get(i).getBike_name());
//        System.out.println(Bean_FCInfoList.get(i).getCity_ride());
//        System.out.println(Bean_FCInfoList.get(i).getFc());
//        System.out.println(Bean_FCInfoList.get(i).getHigh_way_ride());
//        System.out.println(Bean_FCInfoList.get(i).getUser_name());
//        System.out.println(Bean_FCInfoList.get(i).getFc_comment());
//        System.out.println(Bean_FCInfoList.get(i).getDate_time());
//
//        System.out.println("\r");
//        }
//
//	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static List<Bean_FCInfo> FC_Get_UserId(int user_id){


    	 System.out.println("userIDからFC");

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
                        + "ON user_table.user_id = fc_table.user_id WHERE user_table.user_id=?";

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

                	Bean_FCInfo.setBike_name(resultSet.getString("bike_name"));
                	Bean_FCInfo.setFc(resultSet.getDouble("fc"));
                	Bean_FCInfo.setUser_name(resultSet.getString("user_name"));
                	Bean_FCInfo.setCity_ride(resultSet.getInt("city_ride"));
                	Bean_FCInfo.setHigh_way_ride(resultSet.getInt("high_way_ride"));
                	Bean_FCInfo.setFc_comment(resultSet.getString("fc_comment"));
                	Bean_FCInfo.setDate_time(resultSet.getString("date_time"));

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
}