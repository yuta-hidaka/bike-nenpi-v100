package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_BikeInfo;

public class DAO_Get_CountryList {

	public static void main(String[] args) {

   	 List<Bean_BikeInfo> List = new ArrayList<>();
        List = DAO_Get_CountryList.Get_Country();

        for(int i=0 ;  i < List.size() ; i++){

        System.out.println(List.get(i).getCountry_id());
        System.out.println(List.get(i).getCountry_name());

        System.out.println(i);
        }

	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static List<Bean_BikeInfo> Get_Country(){


    	 List<Bean_BikeInfo> List = new ArrayList<>();
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
                        "SELECT * FROM country_table ORDER BY country_id ASC";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);




                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {
             		Bean_BikeInfo Info = new Bean_BikeInfo();

                	Info.setCountry_id(resultSet.getInt("country_id"));
                	Info.setCountry_name(resultSet.getString("country"));



//                	if(resultSet.getDouble("fc") >= mostFc){
//                		mostFc = resultSet.getDouble("fc");
//                		mostFcUser = resultSet.getString("user_name");
//                	}

                	List.add(Info);
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
            return List;
        }
}