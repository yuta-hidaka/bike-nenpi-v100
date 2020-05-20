package bikeNenpi.BEANS;

public class Bean_BikeInfo
{
  private String country_name;
  private int country_id;
  private String maker_name_en;
  private String maker_name_jp;
  private int maker_id;
  private String engine_displacement_area;
  private int engine_displacement_area_id;
  private String bike_name;
  private int bike_id;
  private int process_flg;
  private double fc_ave;
  private double fc_max;
  private String fc_max_user_name;
  private String fc_update_date;
  private String word;
  private String model_year;

  public String getModel_year() {
	return model_year;
}

public void setModel_year(String model_year) {
	this.model_year = model_year;
}

public String getWord() {
	return word;
}

public void setWord(String word) {
	this.word = word;
}

public String getFc_update_date() {
		return fc_update_date;
}

public void setFc_update_date(String fc_update_date) {
	this.fc_update_date = fc_update_date;
}

  public int getProcess_flg() {
	return process_flg;
}

public void setProcess_flg(int process_flg) {
	this.process_flg = process_flg;
}




  public double getFc_ave() {
	return fc_ave;
}

public void setFc_ave(double fc_ave) {
	this.fc_ave = fc_ave;
}

public double getFc_max() {
	return fc_max;
}

public void setFc_max(double fc_max) {
	this.fc_max = fc_max;
}

public String getFc_max_user_name() {
	return fc_max_user_name;
}

public void setFc_max_user_name(String fc_max_user_name) {
	this.fc_max_user_name = fc_max_user_name;
}

public String getCountry_name()
  {
    return this.country_name;
  }

  public void setCountry_name(String country_name)
  {
    this.country_name = country_name;
  }

  public int getCountry_id()
  {
    return this.country_id;
  }

  public void setCountry_id(int country_id)
  {
    this.country_id = country_id;
  }

  public String getMaker_name_en()
  {
    return this.maker_name_en;
  }

  public void setMaker_name_en(String maker_name_en)
  {
    this.maker_name_en = maker_name_en;
  }

  public String getMaker_name_jp()
  {
    return this.maker_name_jp;
  }

  public void setMaker_name_jp(String maker_name_jp)
  {
    this.maker_name_jp = maker_name_jp;
  }

  public int getMaker_id()
  {
    return this.maker_id;
  }

  public void setMaker_id(int maker_id)
  {
    this.maker_id = maker_id;
  }

  public String getEngine_displacement_area()
  {
    return this.engine_displacement_area;
  }

  public void setEngine_displacement_area(String engine_displacement_area)
  {
    this.engine_displacement_area = engine_displacement_area;
  }

  public int getEngine_displacement_area_id()
  {
    return this.engine_displacement_area_id;
  }

  public void setEngine_displacement_area_id(int engine_displacement_area_id)
  {
    this.engine_displacement_area_id = engine_displacement_area_id;
  }

  public String getBike_name()
  {
    return this.bike_name;
  }

  public void setBike_name(String bike_name)
  {
    this.bike_name = bike_name;
  }

  public int getBike_id()
  {
    return this.bike_id;
  }

  public void setBike_id(int bike_id)
  {
    this.bike_id = bike_id;
  }
}
