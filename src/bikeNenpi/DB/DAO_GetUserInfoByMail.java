package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bikeNenpi.BEANS.Bean_UserInfo;

public class DAO_GetUserInfoByMail {

	public static void main(String[] args) {

//        List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
//        Bean_FCInfoList = DAO_GetUserInfoByMail.FC_Get_BikeId(273);
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

	}

    //<>	←のカッコ内にStringなどと入れるとString型の配列になる。
    //リストは総称型(ジェネリクス)
    //データの方に束縛されず、型そのものをパラメーター化して扱える。
     public static Bean_UserInfo MailexistenceCheck(String mail){


    	 System.out.println("userIDからFC");
  		Bean_UserInfo Info = new Bean_UserInfo();
         //List<Bean_FCInfo> Bean_FCInfoList = new ArrayList<>();
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
                        "SELECT * FROM user_table WHERE mail_add=?";

                //ステートメントを作成する。
                preparedStatement =
                        connection.prepareStatement(sql);

                //値のバインド
	            preparedStatement.setString(1,mail);



                //SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
                resultSet = preparedStatement.executeQuery();



                //ここでDBから接続したデータをリストに格納していきます。
                while (resultSet.next()) {


                	Info.setMail_add(resultSet.getString("mail_add"));



//                	if(resultSet.getDouble("fc") >= mostFc){
//                		mostFc = resultSet.getDouble("fc");
//                		mostFcUser = resultSet.getString("user_name");
//                	}


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
            return Info;
        }
}