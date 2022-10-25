import 'package:intl/intl.dart';

extension DateFormater on DateTime{

  get id => '${day<10 ? '0$day' : '$day'}-$month-$year';

  String toStringNumeralDate(){ return '$day-$month-$year';}
  String toStringTime(){ return '$hour:${minute>10 ? minute : '0$minute'} ${hour<12? 'am' : 'pm'}';}
  ///@TODO format methods to parse in spanish
  String monthInES(){
    switch(month){
      case 1 : return "Ene";
      case 2 : return "Feb";
      case 3 : return "Mar";
      case 4 : return "Abr";
      case 5 : return "May";
      case 6 : return "Jun";
      case 7 : return "Jul";
      case 8 : return "Ago";
      case 9 : return "Sep";
      case 10 : return "Oct";
      case 11 : return "Nov";
      case 12 : return "Dic";
      default : return "";
    }
  }
  String toStringWeekDay(){
    switch(weekday){
      case 1 : return "Lun";
      case 2 : return "Mar";
      case 3 : return "Mie";
      case 4 : return "Jue";
      case 5 : return "Vie";
      case 6 : return "Sab";
      case 7 : return "Dom";
      default : return "";
    }
  }
  int daysInMonth(){
    switch(month){
      case 1 : return 31;
      case 2 : return isLeapYear() ? 29 : 28;
      case 3 : return 31;
      case 4 : return 30;
      case 5 : return 31;
      case 6 : return 30;
      case 7 : return 31;
      case 8 : return 31;
      case 9 : return 30;
      case 10 : return 31;
      case 11 : return 30;
      case 12 : return 31;
      default : return 0;
    }
  }
  int differenceInYears(DateTime currentDate){
    int age = currentDate.year - year;
    int month1 = currentDate.month;
    int month2 = month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
  int differenceInMonths(DateTime afterTime) => afterTime.month-month + 12 * (afterTime.year-year);
  bool isLeapYear() => (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  String toStringDate(){
    return DateFormat('dd-MMM-yyyy').format(this).replaceAll('-', ' ');
  }


  bool isSameDate(DateTime date){
    return day == date.day && month == date.month && year == date.year;
  }

}