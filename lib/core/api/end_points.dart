class Endpoints {
  // static String baseUrl = "https://tamqa.net/api/";
  static String baseUrl = "https://test.nanoitcompany.com/api/";
  static String freelancer = "${baseUrl}freelancer/";
  static String userLogin = "${baseUrl}login";
  static String userSignup = "${baseUrl}register";
  static String userRecoveryPassword = "${baseUrl}forget-password";
  static String userCheckCode = "${baseUrl}check-code";
  static String sliders = "${baseUrl}sliders";
  static String contactUs = "${baseUrl}contact-us";
  static String notifications = "${baseUrl}notifications";
  static String myProfile = "${baseUrl}profile";
  static String updateProfile = "${baseUrl}user-profile";
  static String searchData = "${baseUrl}search?name=";

  static String allProjects = "${freelancer}orders";
  static String limitServices = "${freelancer}home";
  static String allOrders = "${freelancer}orders?status=";
  static String ordersDetails = "${freelancer}orders/";
  static String limitDetails = "${freelancer}services/";
  static String applyService = "${freelancer}order/create";


  ///////////////////////////////////////////////////////
  static String recruiter = "${baseUrl}recruiter/";

  static String allCategories = "${recruiter}categories";
  static String lastServices = "${recruiter}last-services";
  static String servicesDetails = "${recruiter}services/";
  static String deleteServices = "${recruiter}services/";
  static String myServices = "${recruiter}services?status=";
  static String categoriesDetails = "${recruiter}categories/";
  static String subCategories = "${recruiter}sub-categories/";
  static String acceptOffers = "${recruiter}accept-offer/";
  static String createServices = "${recruiter}services";
}
