package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_BikeInfo;

public class DAO_Get_MakerList {

	public static void main(String[] args) {

   	 List<Bean_BikeInfo> List = new ArrayList<>();
        List = DAO_Get_MakerList.Get_MakerByCountryId(1);

        for(int i=0 ;  i < List.size() ; i++){

        System.out.println(List.get(i).getCountry_id());
        System.out.println(List.get(i).getCountry_name());
        System.out.println(List.get(i).getMaker_id());
        System.out.println(List.get(i).getMaker_name_jp());


        System.out.println(i);
        }

	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static List<Bean_BikeInfo> Get_Maker(){

    	 List<Bean_BikeInfo> List = new ArrayList<>();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        "SELECT * FROM maker_table INNER JOIN country_table "
                        + "ON maker_table.country_id = country_table.country_id ORDER BY maker_table.country_id ASC";

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
                	Info.setMaker_name_jp(resultSet.getString("maker_name_jp"));
                	Info.setMaker_id(resultSet.getInt("maker_id"));

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


     public static List<Bean_BikeInfo> Get_MakerByCountryId(int country_id){

    	 List<Bean_BikeInfo> List = new ArrayList<>();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        "SELECT * FROM maker_table INNER JOIN country_table "
                        + "ON maker_table.country_id = country_table.country_id WHERE maker_table.country_id=? "
                        + "ORDER BY maker_table.country_id ASC";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

	            preparedStatement.setInt(1,country_id );

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();

                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {
             		Bean_BikeInfo Info = new Bean_BikeInfo();

                	Info.setCountry_id(resultSet.getInt("country_id"));
                	Info.setCountry_name(resultSet.getString("country"));
                	Info.setMaker_name_jp(resultSet.getString("maker_name_jp"));
                	Info.setMaker_id(resultSet.getInt("maker_id"));

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