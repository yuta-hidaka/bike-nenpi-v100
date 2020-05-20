package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import bikeNenpi.BEANS.Bean_UserInfo;

public class DAO_User_Resist {

	public static void main(String[] args) {

        Calendar calendar = Calendar.getInstance();
        System.out.println(calendar.getTime());

        Bean_UserInfo Bean_UserInfo = new Bean_UserInfo();

        Bean_UserInfo.setMail_add("yyyyy@gggg");
        Bean_UserInfo.setPassword("admin");
        Bean_UserInfo.setUser_name("ぼっちゃん");
        Bean_UserInfo.setUbike1("kla");
        Bean_UserInfo.setUbike2("ninja1000");
        Bean_UserInfo.setBirthday("2019/10/22");
        Bean_UserInfo.setGender(1);


        DAO_User_Resist.UserRegist(Bean_UserInfo);
	}


    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static void UserRegist(Bean_UserInfo UserInfo){

            Connection connection =null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");


            try{
                //DBへ接続します。
                connection = dbManager.getConnection();
                //SQL文の準備
                //SQL文が動作するかをoracleで確認しましょう。
                String sql =
                		"INSERT INTO user_table(user_id,mail_add,user_name,password,birthday,gender,ubike1,ubike2,regist_date,accept)"
                		+ "VALUES(NEXTVAL(seq_user_id),?,?,?,?,?,?,?,?,?)";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド

	            preparedStatement.setString(1,UserInfo.getMail_add() );
	            preparedStatement.setString(2,UserInfo.getUser_name());
	            preparedStatement.setString(3,UserInfo.getPassword());
	            preparedStatement.setString(4,UserInfo.getBirthday());
	            preparedStatement.setInt(5,UserInfo.getGender());
	            preparedStatement.setString(6,UserInfo.getUbike1());
	            preparedStatement.setString(7,UserInfo.getUbike2());
	            preparedStatement.setString(8,sdf.format(timestamp));
	            preparedStatement.setInt(9,UserInfo.getAccept());

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
}