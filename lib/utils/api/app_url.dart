class AppUrl {
  // <===========  Base Url  ==========>
  static const String baseUrl = "http://172.252.13.83:2000/api/v1";

  // <===========  login Url  ==========>
  static const String logIn = "$baseUrl/auth/login";

  // <===========  SignUp Url  ==========>
  static const String signUp = "$baseUrl/users";


// <=========== Task Create Url  ==========>
  static const String taskCreate = "$baseUrl/task";

  // <=========== My Task Url  ==========>
  static const String myTask = "$baseUrl/task/my-tasks";

  // <=========== Profile Url  ==========>
  static const String myPrfile = "$baseUrl/users/my-profile";

}
