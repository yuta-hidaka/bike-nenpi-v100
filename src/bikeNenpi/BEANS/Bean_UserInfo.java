package bikeNenpi.BEANS;

public class Bean_UserInfo
{
  private int user_id;
  private String mail_add;
  private String User_name;
  private String password;
  private String birthday;
  private int gender;
  private String ubike1;
  private String ubike2;
  private int accept;
  private int UserRegistFlg;
  private int process_flg;
  private int errorCode;
  private String login_date;
  private int login_flg;


  public int getErrorCode() {
	return errorCode;
}

public String getLogin_date() {
	return login_date;
}

public void setLogin_date(String login_date) {
	this.login_date = login_date;
}

public int getLogin_flg() {
	return login_flg;
}

public void setLogin_flg(int login_flg) {
	this.login_flg = login_flg;
}

public void setErrorCode(int errorCode) {
	this.errorCode = errorCode;
}

public int getProcess_flg() {
	return process_flg;
}

public void setProcess_flg(int process_flg) {
	this.process_flg = process_flg;
}

  public int getUser_id()
  {
    return this.user_id;
  }

  public void setUser_id(int user_id)
  {
    this.user_id = user_id;
  }

  public String getMail_add()
  {
    return this.mail_add;
  }

  public void setMail_add(String mail_add)
  {
    this.mail_add = mail_add;
  }

  public String getUser_name()
  {
    return this.User_name;
  }

  public void setUser_name(String user_name)
  {
    this.User_name = user_name;
  }

  public String getPassword()
  {
    return this.password;
  }

  public void setPassword(String password)
  {
    this.password = password;
  }

  public String getBirthday()
  {
    return this.birthday;
  }

  public void setBirthday(String birthday)
  {
    this.birthday = birthday;
  }

  public int getGender()
  {
    return this.gender;
  }

  public void setGender(int gender)
  {
    this.gender = gender;
  }

  public String getUbike1()
  {
    return this.ubike1;
  }

  public void setUbike1(String ubike1)
  {
    this.ubike1 = ubike1;
  }

  public String getUbike2()
  {
    return this.ubike2;
  }

  public void setUbike2(String ubike2)
  {
    this.ubike2 = ubike2;
  }

  public int getAccept()
  {
    return this.accept;
  }

  public void setAccept(int accept)
  {
    this.accept = accept;
  }

  public int getUserRegistFlg()
  {
    return this.UserRegistFlg;
  }

  public void setUserRegistFlg(int userRegistFlg)
  {
    this.UserRegistFlg = userRegistFlg;
  }
}
