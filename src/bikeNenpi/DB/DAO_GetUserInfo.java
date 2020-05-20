package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bikeNenpi.BEANS.Bean_UserInfo;

public class DAO_GetUserInfo {

	public static void main(String[] args) {
		 Bean_UserInfo UserInfoBean = new Bean_UserInfo();
		 UserInfoBean = DAO_GetUserInfo.UserInfoGet("yuta322@gmail.com", "test123");
		 System.out.println(UserInfoBean.getBirthday());
	}


    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static Bean_UserInfo UserInfoGet(String mail_add,String password ){

    	 System.out.println("DAO");

    	 System.out.println("mail:"+mail_add);
    	 System.out.println("pass:"+password);


 Bean_UserInfo UserInfoBean = new Bean_UserInfo();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        " SELECT * FROM user_table WHERE mail_add=?";


                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setString(1, mail_add );
/*	            preparedStatement.setString(2, password);*/

                //SQL文の実行。検索のときはExecuteQUERI、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {

                	UserInfoBean.setUser_id(resultSet.getInt("user_id"));
                	UserInfoBean.setMail_add(resultSet.getString("mail_add"));
                	UserInfoBean.setUser_name(resultSet.getString("user_name"));
                	UserInfoBean.setPassword(resultSet.getString("password"));
                	UserInfoBean.setBirthday(resultSet.getString("birthday"));

                	UserInfoBean.setGender(resultSet.getInt("gender"));
                	UserInfoBean.setUbike1(resultSet.getString("ubike1"));
                	UserInfoBean.setUbike2(resultSet.getString("ubike2"));
                	UserInfoBean.setLogin_date(resultSet.getString("login_date"));
                	UserInfoBean.setLogin_flg(resultSet.getInt("login_flg"));
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
            return UserInfoBean;
        }

     public static Bean_UserInfo UserInfoGetByBirthday(String mail_add,String birthday ){

    	 System.out.println("DAO");

    	 System.out.println("mail:"+mail_add);
    	 System.out.println("pass:"+birthday);


 Bean_UserInfo UserInfoBean = new Bean_UserInfo();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        " SELECT * FROM user_table WHERE mail_add=?";


                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setString(1, mail_add );
/*	            preparedStatement.setString(2, birthday);*/

                //SQL文の実行。検索のときはExecuteQUERI、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {

                	UserInfoBean.setUser_id(resultSet.getInt("user_id"));
                	UserInfoBean.setMail_add(resultSet.getString("mail_add"));
                	UserInfoBean.setUser_name(resultSet.getString("user_name"));
                	UserInfoBean.setPassword(resultSet.getString("password"));
                	UserInfoBean.setBirthday(resultSet.getString("birthday"));

                	UserInfoBean.setGender(resultSet.getInt("gender"));
                	UserInfoBean.setUbike1(resultSet.getString("ubike1"));
                	UserInfoBean.setUbike2(resultSet.getString("ubike2"));

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
            return UserInfoBean;
        }


     public static Bean_UserInfo UserInfoGetByUserId(int user_id){

    	 System.out.println("DAO");


 Bean_UserInfo UserInfoBean = new Bean_UserInfo();
            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                        " SELECT * FROM user_table WHERE user_id=?";


                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setInt(1, user_id);
/*	            preparedStatement.setString(2, birthday);*/

                //SQL文の実行。検索のときはExecuteQUERI、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {

                	System.out.println("uName:"+resultSet.getString("user_name"));
                	UserInfoBean.setUser_id(resultSet.getInt("user_id"));
                	UserInfoBean.setMail_add(resultSet.getString("mail_add"));
                	UserInfoBean.setUser_name(resultSet.getString("user_name"));
                	UserInfoBean.setPassword(resultSet.getString("password"));
                	UserInfoBean.setBirthday(resultSet.getString("birthday"));

                	UserInfoBean.setGender(resultSet.getInt("gender"));
                	UserInfoBean.setUbike1(resultSet.getString("ubike1"));
                	UserInfoBean.setUbike2(resultSet.getString("ubike2"));

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
            return UserInfoBean;
        }

}