package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_FCInfo;

public class DAO_FC_Get_BikeId {

	public static void main(String[] args) {

double K = 100.00;
for(int i = 0 ; i < 2000*12 ;i++){

	K = K*1.0001;

}

System.out.println("3000回取引後は"+K);


	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static List<Bean_FCInfo> FC_Get_BikeId(int bike_id){


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
                        + "ON user_table.user_id = fc_table.user_id WHERE bike_table.bike_id=?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,bike_id );



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