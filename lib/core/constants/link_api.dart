class ApiLink {
  static const String baseUrl = 'http://localhost:8000';
  // ======================= AUTH URL =========================//
  static const String loginUrl = '$baseUrl/auth/loginUser.php';
  static const String registerUrl = '$baseUrl/auth/registerUser.php';
  static const String getUserDataURL = '$baseUrl/auth/getUserData.php';
  static const String editProdileURL = '$baseUrl/auth/updateUsersData.php';
  static const String verfiyCodeURL = '$baseUrl/auth/verfiyCode.php';
  static const String forgetPasswordURL = '$baseUrl/auth/forgetPassword.php';
  static const String updateUsersType = '$baseUrl/auth/updateUserType.php';
  // ======================= INTERESTE URL =========================//
  static const String intersetURL = '$baseUrl/interest/getDataByID.php';
  static const String addInterstURL = '$baseUrl/interest/addInterestProduct.php';
  static const String deletedInterstURL = '$baseUrl/interest/deleteInterest.php';
  static const String getInterstCollectionURL = '$baseUrl/interest/getIntersetCollectionByID.php';
  static const String addInterstCollectionURL = '$baseUrl/interest/addInterstCollection.php';
  static const String deletedInterstColletionURL = '$baseUrl/interest/deleteIntersetCollection.php';
  // ======================= DEPARTMENT URL =========================//
  static const String departmentURL = '$baseUrl/department/viewDepartment.php';
  // ======================= PRODUCT URL =========================//
  static const String productURL = '$baseUrl/product/getAllProduct.php';
  static const String getProductByIDURL = '$baseUrl/product/getColorOfProduct.php';
  // ======================= COLLECTION URL =========================//
  static const String viewCollectionURL = '$baseUrl/collection/viewCollection.php';
  static const String getOneCollectionByIDURL = '$baseUrl/collection/getOneCollectionByID.php';
  // ======================= ORDER URL =========================//
  static const String getOrderUserByID = '$baseUrl/order/viewOrderByUserID.php';
  // ======================= WEB VIEW URL =========================//
  static const String termOfUse = '$baseUrl/teamofuse.html';
  static const String privacyPolicy = '$baseUrl/privacypolicy.html';
}
