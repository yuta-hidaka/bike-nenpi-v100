package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bikeNenpi.BEANS.Bean_UserInfo;

public class DAO_GetBikeId {

	public static void main(String[] args) {
		 Bean_UserInfo UserInfoBean = new Bean_UserInfo();
		 UserInfoBean = DAO_GetBikeId.UserInfoGet("yuta322@gmail.com", "test123");
		 System.out.println(UserInfoBean.getBirthday());
	}


    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static Bean_UserInfo UserInfoGet(String mail_add,String password ){

    	 System.out.println("DAOに言います");

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
                        "SELECT * FROM user_table WHERE mail_add=? AND password = ?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setString(1, mail_add );
	            preparedStatement.setString(2, password );

                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {



                	UserInfoBean.setUser_id(resultSet.getInt("user_id"));
                	UserInfoBean.setMail_add(resultSet.getString("mail_add"));
                	UserInfoBean.setUser_name(resultSet.getString("nick_name"));
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