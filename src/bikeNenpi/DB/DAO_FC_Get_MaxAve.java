package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bikeNenpi.BEANS.Bean_FCInfo;

public class DAO_FC_Get_MaxAve {

	public static void main(String[] args) {



	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static Bean_FCInfo FC_Get_MaxAve(int bike_id){

  		Bean_FCInfo Bean_FCInfo = new Bean_FCInfo();

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
                        "SELECT fc_max,fc_ave,fc_max_user_name,bike_name,bike_id FROM bike_table  WHERE bike_id=?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);
                //値のバインド
	            preparedStatement.setInt(1,bike_id );

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();


                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {

                	Bean_FCInfo.setBike_name(resultSet.getString("bike_name"));
                	Bean_FCInfo.setBike_id(resultSet.getInt("bike_id"));
                	Bean_FCInfo.setUser_name(resultSet.getString("fc_max_user_name"));
                	Bean_FCInfo.setMax_fc(resultSet.getDouble("fc_max"));
                	Bean_FCInfo.setAve_fc(resultSet.getDouble("fc_ave"));

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
            System.out.println(Bean_FCInfo.getMax_fc());
            return Bean_FCInfo;
        }
}