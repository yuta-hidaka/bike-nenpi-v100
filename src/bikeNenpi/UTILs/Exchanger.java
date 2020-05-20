package bikeNenpi.UTILs;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Exchanger
{
  public static void main(String[] args) {}

  public static String ChangeDate2(String birthday)
  {
    String[] birthdayList = birthday.split("-", 0);
    if (birthdayList[0].equals(null))
    {
      birthdayList[0] = "";
      birthdayList[1] = "";
      birthdayList[2] = "";
    }
    else
    {
      if (birthdayList[0].length() == 1) {
        birthdayList[0] = ("0" + birthdayList[0]);
      }
      if (birthdayList[1].length() == 1) {
        birthdayList[1] = ("0" + birthdayList[0]);
      }
      if (birthdayList[2].length() == 1) {
        birthdayList[2] = ("0" + birthdayList[0]);
      }
    }
    String ReBirthday = birthdayList[0] + birthdayList[1] + birthdayList[2];
    return ReBirthday;
  }

  public static String ChangeDate(String birthday)
  {
    String[] birthdayList = birthday.split("-", 0);
    if (birthdayList[0].equals(null))
    {
      birthdayList[0] = "";
      birthdayList[1] = "";
      birthdayList[2] = "";
    }
    else
    {
      birthdayList[0] = (birthdayList[0] + "�N");
      birthdayList[1] = (birthdayList[1] + "��");
      birthdayList[2] = (birthdayList[2] + "��");
    }
    String ReBirthday = birthdayList[0] + birthdayList[1] + birthdayList[2];

    return ReBirthday;
  }

  public static String ChangeGender(int num)
  {
    int n = num;
    String gender = null;
    if (n == 1) {
      gender = "男性";
    } else if (n == 2) {
      gender = "女性";
    } else if (n == 3) {
      gender = "選択しない";
    } else {
      gender = "登録なし";
    }
    return gender;
  }

  public static String ChangeAuthority(int num)
  {
    int n = num;

    String authority = null;
    if (n == 1) {
      authority = "����";
    } else if (n == 2) {
      authority = "������";
    } else {
      authority = "�o�^��";
    }
    return authority;
  }

  public static String ChangeDptId(int num)
  {
    int n = num;
    String dptName = null;
    switch (n)
    {
    case 1:
      dptName = "�c����";
      break;
    case 2:
      dptName = "�o����";

      break;
    case 3:
      dptName = "������";

      break;
    default:
      dptName = "�Y����������";
    }
    return dptName;
  }

  public static String Num1Checker(int num)
  {
    String check;
    if (num == 1) {
      check = "checked";
    } else {
      check = " ";
    }
    return check;
  }

  public static String Num2Checker(int num)
  {
    String check;
    if (num == 2) {
      check = "checked";
    } else {
      check = " ";
    }
    return check;
  }

  public static String Num3Checker(int num)
  {
    String check;
    if (num == 3) {
      check = "checked";
    } else {
      check = " ";
    }
    return check;
  }

  public static String Pass2Dot(String password)
  {
    String rePass = password.replaceAll(".", "��");

    return rePass;
  }

  public static String IDChecker4Login(int empId)
  {
    String ans = null;
    if (String.valueOf(empId).length() == 0)
    {
      ans = "����ID�A�������p�X���[�h�����������������B ";
      return ans;
    }
    try
    {
      if ((String.valueOf(empId).length() <= 5) && (String.valueOf(empId).length() >= 1)) {
        return "OK";
      }
      return "����ID�A�������p�X���[�h�����������������B ";
    }
    catch (Exception e)
    {
      ans = "����ID�������l�������������������B ";
    }
    return ans;
  }

  public static String PassChecker4Login(String password)
  {
    String ans = null;

    Pattern p = Pattern.compile("^[0-9a-zA-Z]+$");
    Matcher m = p.matcher(password);
    boolean check = m.find();
    if ((password.length() == 0) || (!check))
    {
      ans = "�p�X���[�h�����p�p�����������������������B ";
      return ans;
    }
    try
    {
      if ((password.length() <= 16) && (password.length() >= 1)) {
        return "";
      }
      return "����ID�A�������p�X���[�h�����������������B ";
    }
    catch (Exception e)
    {
      ans = "�p�X���[�h�����p�p�����������������������B ";
    }
    return ans;
  }

  public static String PassChecker4Insert(String pass)
  {
    String ans = null;

    Pattern p = Pattern.compile("^[0-9a-zA-Z]+$");
    Matcher m = p.matcher(pass);
    boolean check = m.find();
    if ((pass.length() == 0) || (!check))
    {
      ans = "�p�X���[�h�����p�p�����������������������B ";
      return ans;
    }
    try
    {
      if ((pass.length() <= 16) && (pass.length() >= 1)) {
        return "";
      }
      return "�p�X���[�h��1��������16���������������������������B ";
    }
    catch (Exception e)
    {
      ans = "�p�X���[�h�����p�p�����������������������B ";
    }
    return ans;
  }

  public static String NameChecker4Insert(String name)
  {
    String ans = null;
    if (name.length() == 0)
    {
      ans = "��������1��������30���������������������������B ";
      return ans;
    }
    try
    {
      if ((name.length() <= 30) && (name.length() >= 1)) {
        return "";
      }
      return "��������1��������30���������������������������B ";
    }
    catch (Exception e)
    {
      ans = "��������1��������30���������������������������B  ";
    }
    return ans;
  }

  public static String AddressChecker4Insert(String address)
  {
    String ans = null;
    if (address.length() == 0)
    {
      ans = "住所は1文字以上30文字以内で入力してください";
      return ans;
    }
    try
    {
      if ((address.length() <= 60) && (address.length() >= 1)) {
        return "";
      }
      return "�Z����1��������60���������������������������B ";
    }
    catch (Exception e)
    {
      ans = "�Z����1��������30���������������������������B  ";
    }
    return ans;
  }

  public static String DateChecker4Insert(String date)
  {
    DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
    String ans = "";

    Pattern p = Pattern.compile("^(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/([12][0-9]{3})$");
    Matcher m = p.matcher(date);
    boolean check = m.find();
    if (!check)
    {
      if ((date.length() == 10) || (date.length() == 9) || (date.length() == 8)) {
        try
        {
          format.setLenient(false);
          format.parse(date);
        }
        catch (Exception e)
        {
          ans = "日付を正しく入力してください";
        }
      } else {
        ans = "日付を正しく入力してください";
      }
    }
    else {
      ans = "日付を正しく入力してください";
    }
    return ans;
  }
}
