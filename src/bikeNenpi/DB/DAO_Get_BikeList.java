package bikeNenpi.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bikeNenpi.BEANS.Bean_BikeInfo;

public class DAO_Get_BikeList {

	public static void main(String[] args) {

		List<Bean_BikeInfo> List = new ArrayList<>();
		List = DAO_Get_BikeList.Get_BikeByMakerId(1);

		for(int i=0 ;  i < List.size() ; i++){
			System.out.println(List.get(i).getBike_name());
			System.out.println(List.get(i).getBike_id());
			System.out.println(List.get(i).getEngine_displacement_area());
			System.out.println(List.get(i).getEngine_displacement_area_id());
			System.out.println(List.get(i).getMaker_name_jp());


			System.out.println("\r");
		}

	}

	//<>	←のカッコ内にStringなどと入れるとString型の配列になる。
	//リストは総称型(ジェネリクス)
	//データの方に束縛されず、型そのものをパラメーター化して扱える。
	public static List<Bean_BikeInfo> Get_BikeByMakerId(int maker_id){

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
					"SELECT * FROM bike_table INNER JOIN maker_table "
							+ "ON bike_table.maker_id = maker_table.maker_id INNER JOIN eda_table "
							+ "ON bike_table.engine_displacement_area_id = eda_table.engine_displacement_area_id "
							+ "WHERE bike_table.maker_id=?";

			//ステートメントを作成する。
			preparedStatement =
					connection.prepareStatement(sql);

			//値のバインド
			preparedStatement.setInt(1,maker_id );



			//SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
			resultSet = preparedStatement.executeQuery();



			//ここでDBから接続したデータをリストに格納していきます。
			while (resultSet.next()) {
				Bean_BikeInfo Info = new Bean_BikeInfo();

				Info.setBike_name(resultSet.getString("bike_name"));
				Info.setBike_id(resultSet.getInt("bike_id"));

				Info.setEngine_displacement_area(resultSet.getString("engine_displacement_area"));
				Info.setEngine_displacement_area_id(resultSet.getInt("engine_displacement_area_id"));

				Info.setMaker_name_jp(resultSet.getString("maker_name_jp"));


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






	public static List<Bean_BikeInfo> Get_BikeByWord(String word){


		String[] wordList = word.split(" |　");
		System.out.println(wordList[0]);
		String search ="";

		System.out.println("forまえ");
		for(int i = 0 ; wordList.length > i ;i++){

			wordList[i] = "(?=.*"+wordList[i]+")";

			search = search+wordList[i];
		}
		search = "^"+search+".*$";

		System.out.println(search);
		word = "%"+word+"%";


		//String q = "'^(?=.*kawasaki)(?=.*ninja).*$'";


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
					"SELECT bike_table.bike_id,bike_table.bike_name,maker_table.maker_name_jp FROM bike_table INNER JOIN maker_table "
							+ "ON bike_table.maker_id = maker_table.maker_id INNER JOIN eda_table "
							+ "ON bike_table.engine_displacement_area_id = eda_table.engine_displacement_area_id "
							+ " WHERE ( concat( bike_table.bike_name , maker_table.maker_name_jp , "
							+ "maker_table.maker_name_en , maker_table.maker_name_en ,bike_table.tag) regexp ? ) limit 15";

			//ステートメントを作成する。
			preparedStatement =
					connection.prepareStatement(sql);

			//値のバインド
			preparedStatement.setString(1, search);



			//SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
			resultSet = preparedStatement.executeQuery();



			//ここでDBから接続したデータをリストに格納していきます。
			while (resultSet.next()) {

				System.out.println("kokode");
				Bean_BikeInfo Info = new Bean_BikeInfo();

				Info.setBike_name(resultSet.getString("bike_name"));
				Info.setBike_id(resultSet.getInt("bike_id"));

				/*                	Info.setEngine_displacement_area(resultSet.getString("engine_displacement_area"));
                	Info.setEngine_displacement_area_id(resultSet.getInt("engine_displacement_area_id"));*/

				Info.setMaker_name_jp(resultSet.getString("maker_name_jp"));


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



	public static List<Bean_BikeInfo> Get_BikeByUserId(int  userId , int findPoint){


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
					"SELECT bike_table.bike_id,bike_table.bike_name,fc_table.model_year "+
							"FROM bike_table INNER JOIN fc_table "+
							"ON bike_table.bike_id = fc_table.bike_id "+
							"where fc_table.user_id = ? "+
							"group by bike_table.bike_name , fc_table.model_year limit   ? ,15";

			//ステートメントを作成する。
			preparedStatement =
					connection.prepareStatement(sql);

			//値のバインド
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, findPoint);


			//SQL文の実行。検索のときはExecute　QUERI　、更新削除などのときはUPDATE。
			resultSet = preparedStatement.executeQuery();



			//ここでDBから接続したデータをリストに格納していきます。
			while (resultSet.next()) {


				Bean_BikeInfo Info = new Bean_BikeInfo();

				Info.setBike_name(resultSet.getString("bike_name"));
				Info.setModel_year(resultSet.getString("model_year"));
				Info.setBike_id(resultSet.getInt("bike_id"));
				List.add(Info);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbManager.close(resultSet);
			dbManager.close(preparedStatement);
			dbManager.close(connection);
		}
		return List;
	}



}