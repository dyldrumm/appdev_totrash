import 'package:intl/intl.dart';

class Items {
  String name = "";
  int day = 0;
  int month = 0;
  int year = 0;
  DateTime something = new DateTime(0);

  Items(String name, int year, int month, int day) {
    this.name = name;
    this.day = day;
    this.month = month;
    this.year = year;
  }

  nonameItems(int year, int month, int day) {
    this.name = name;
    this.day = day;
    this.month = month;
    this.year = year;
  }
}
