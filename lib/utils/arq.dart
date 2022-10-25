
class Arq {
  static bool isNull(item) => item==null;
  static bool isNotNull(item) => item!=null;
  static bool isEmpty(item) => item.isEmpty;
  static bool isNotEmpty(item) => item.isNotEmpty;
  static bool isNullOrEmpty(item) => isNull(item)||isEmpty(item);
  static bool isNotNullOrEmpty(item) => isNotNull(item) && isNotEmpty(item);



}
