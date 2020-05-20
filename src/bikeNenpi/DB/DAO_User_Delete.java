package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

public class DAO_User_Delete {

	public static void main(String[] args) {


	}


    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static void UserDelete(int user_id){

         Calendar calendar = Calendar.getInstance();
         String str = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(calendar.getTime());
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                		"UPDATE user_table SET mail_add = ?,user_name = ?,password = ? WHERE user_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド

                preparedStatement.setString(1,UUID.randomUUID().toString()+str);
	            preparedStatement.setString(2,"退会ユーザー");
	            preparedStatement.setString(3,UUID.randomUUID().toString()+str);
	            preparedStatement.setInt(4,user_id);

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                preparedStatement.executeUpdate();


            }catch(Exception e){
            	System.out.println("削除失敗");
            	System.out.println(e);
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

        }

     public static List<String> GetPhotPass(int user_id){
    	 List<String> List = new ArrayList<>();

    	 String photPass = "";
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                		"SELECT phot_pass FROM fc_table WHERE user_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1,user_id);

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {

                	List.add(resultSet.getString("phot_pass"));


                }


            }catch(Exception e){
            	System.out.println("削除失敗");
            	System.out.println(e);
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

            return List;
        }

     public static void DeletePhotPass(int user_id){

    	 String photPass = "";
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                		"UPDATE fc_table SET phot_pass=? WHERE user_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
                preparedStatement.setString(1,"\\bikeNenpi\\img\\NoPhot2.png");
	            preparedStatement.setInt(2,user_id);

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                preparedStatement.executeUpdate();



                //ここでDBから接続したデータをリストに格納していきます。



            }catch(Exception e){
            	System.out.println("削除失敗");
            	System.out.println(e);
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

        }

}