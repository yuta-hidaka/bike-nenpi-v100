package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import bikeNenpi.BEANS.Bean_UserInfo;

public class DAO_User_Update {
//
//	public static void main(String[] args) {
//
//        Calendar calendar = Calendar.getInstance();
//        System.out.println(calendar.getTime());
//
//        Bean_UserInfo Bean_UserInfo = new Bean_UserInfo();
//
//        Bean_UserInfo.setMail_add("yyyy@gggg");
//        Bean_UserInfo.setPassword("admin");
//        Bean_UserInfo.setUser_name("ぼっちゃん");
//        Bean_UserInfo.setUbike1("kla");
//        Bean_UserInfo.setUbike2("ninja1000");
//        Bean_UserInfo.setBirthday("2019/10/22");
//        Bean_UserInfo.setGender(1);
//        Bean_UserInfo.setUser_id(1);
//
//
//        DAO_User_Update.UserUpdate(Bean_UserInfo);
//	}



    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static void UserUpdate(Bean_UserInfo UserInfo){

            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            DateFormat format = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
            String date = format.format(new Date());

            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                		"UPDATE user_table SET mail_add = ?,user_name = ?,password = ?,birthday = ?,gender = ?,ubike1 = ?,ubike2 = ?,login_date = ? ,login_flg = ? "
                		+ "WHERE user_id = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド


                System.out.println(UserInfo.getMail_add() );
                System.out.println(UserInfo.getUbike1() );
	            preparedStatement.setString(1,UserInfo.getMail_add() );
	            preparedStatement.setString(2,UserInfo.getUser_name());
	            preparedStatement.setString(3,UserInfo.getPassword());
	            preparedStatement.setString(4,UserInfo.getBirthday());
	            preparedStatement.setInt(5,UserInfo.getGender());
	            preparedStatement.setString(6,UserInfo.getUbike1());
	            preparedStatement.setString(7,UserInfo.getUbike2());
	            preparedStatement.setInt(10,UserInfo.getUser_id());
	            preparedStatement.setString(8,date);
	            preparedStatement.setInt(9,UserInfo.getLogin_flg());

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                preparedStatement.executeUpdate();


            }catch(Exception e){
            	System.out.println(e);
            }finally{
                dbManager.close(resultSet);
                dbManager.close(preparedStatement);
                dbManager.close(connection);
            }

        }

     public static void LoginFlg(int login_flg,String mail){

         Connection connection =null;
         PreparedStatement preparedStatement = null;
         ResultSet resultSet = null;

         DateFormat format = new SimpleDateFormat("yyyy/MM/dd/HH:mm");
         String date = format.format(new Date());

         try{
             //DBへ接続します。
             connection = dbManager.getConnection();
             //SQL文の準備
             //SQL文が動作するかをoracleで確認しましょう。
             String sql =
             		"UPDATE user_table SET login_date = ? ,login_flg = ? WHERE mail_add = ?";

             //ステートメントを作成する。
             preparedStatement =
                     connection.prepareStatement(sql);

             //値のバインド


	            preparedStatement.setString(1,date);
	            preparedStatement.setInt(2,login_flg);
	            preparedStatement.setString(3,mail);

             //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
             preparedStatement.executeUpdate();


         }catch(Exception e){

         }finally{
             dbManager.close(resultSet);
             dbManager.close(preparedStatement);
             dbManager.close(connection);
         }

     }

}