import 'package:intl/intl.dart';
import 'package:totrash/objs/items.dart';

class Common {
  static DateTime dateFormat = new DateTime(0);
  static final String assetImages = "assets/images/";
  static String barcodeTemp = "";
  static String dateTemp = "";
  static String standardDate = "";
  static List<Items> items = [];

  static additem(String name, String date) {
    print(date);
    List<int> dates = standardizeDate(date);
    items.add(Items(name, dates[0], dates[1], dates[2]));
  }

  static additemCamera(String name, String date) {
    List<int> dates = standardizeCameraDate(date);
    items.add(Items(name, dates[0], dates[1], dates[2]));
  }

  static List<int> standardizeCameraDate(String date) {
    String temp = date.substring(0, date.indexOf(" "));
    int mon = 0;
    if (temp == "JAN") mon = 1;
    if (temp == "FEB") mon = 2;
    if (temp == "MAR") mon = 3;
    if (temp == "APR") mon = 4;
    if (temp == "MAY") mon = 5;
    if (temp == "JUN") mon = 6;
    if (temp == "JUL") mon = 7;
    if (temp == "AUG") mon = 8;
    if (temp == "SEP") mon = 9;
    if (temp == "OCT") mon = 10;
    if (temp == "NOV") mon = 11;
    if (temp == "DEC") mon = 12;
    temp = date.substring(date.indexOf(" "), date.indexOf(" ") + 2);
    int day = int.parse(temp);
    temp = date.substring(date.indexOf(" ") + 3, date.indexOf(" ") + 5);
    int year = int.parse(temp);
    List<int> ret = [year, mon, day];
    return ret;
  }

  static List<int> standardizeDate(String date) {
    String temp = date.substring(0, 2);
    int mon = int.parse(temp);
    temp = date.substring(3, 5);
    int day = int.parse(temp);
    temp = date.substring(6, 9);
    int year = int.parse(temp);
    List<int> ret = [year, mon, day];

    return ret;
  }
}
