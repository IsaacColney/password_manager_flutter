class PasswordDataModel {
  final String siteName;
  final String url;
  final String userName;
  final String password;

  const PasswordDataModel(
      this.siteName, this.url, this.password, this.userName);

  Map<String, String> toMap() {
    return {
      "siteName": siteName,
      "url": url,
      "userName": userName,
      "password": password
    };
  }

  @override
  String toString() {
    return "Password Data : Site Name : $siteName , Url : $url , User Name : $userName , Password : $password";
  }
}
