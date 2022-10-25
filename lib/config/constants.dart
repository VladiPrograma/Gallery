/// This file must constains literal constants
/// and ENUM types for Groups

const String HELLO_WORLD = 'Hello World';

enum Connexion {WIFI, MOBILE_DATA, FAIL }

const Map<String, String>  animalsAPI = {
  "get" : "http://localhost:5050/all",
  "post" : "http://localhost:5050/add?",
  "set" : "http://localhost:5050/set?",
};

class LocalStorageKey {
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `LocalStorageKey()` accidentally
  LocalStorageKey._();

  // the properties are static so that we can use them without a class instance
  // e.g. can be retrieved by `LocalStorageKey.saveUserId`.
  static const String saveUserId = 'save_user_id';
  static const String userId = 'user_id';
  static const String language = 'language';
  static const String themeMode = 'theme_mode';
  static const String enablePushNotification = 'enable_push_notification';
}