const String passwordTable = "password";

class PasswordField {
  static const List<String> values = [
    "id",
    "siteName",
    "url",
    "userName",
    "password",
  ];

  static const String id = "_id";
  static const String siteName = "siteName";
  static const String url = "url";
  static const String userName = "userName";
  static const String password = "password";
}

class PasswordDataModel {
  final int? id;
  final String siteName;
  final String url;
  final String userName;
  final String password;

  const PasswordDataModel({
    this.id,
    required this.siteName,
    required this.url,
    required this.userName,
    required this.password,
  });

  PasswordDataModel copy({
    int? id,
    String? siteName,
    String? url,
    String? userName,
    String? password,
  }) =>
      PasswordDataModel(
        id: id ?? this.id,
        siteName: siteName ?? this.siteName,
        url: url ?? this.url,
        userName: userName ?? this.userName,
        password: password ?? this.password,
      );

  Map<String, String> toMap() {
    return {
      "siteName": siteName,
      "url": url,
      "userName": userName,
      "password": password
    };
  }

  static PasswordDataModel fromJson(Map<String, Object?> json) =>
      PasswordDataModel(
          id: json[PasswordField.id] as int?,
          siteName: json[PasswordField.siteName] as String,
          url: json[PasswordField.url] as String,
          userName: json[PasswordField.userName] as String,
          password: json[PasswordField.password] as String);

  @override
  String toString() {
    return "Password Data : Site Name : $siteName , Url : $url , User Name : $userName , Password : $password";
  }
}
