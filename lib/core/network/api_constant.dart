class ApiConstance {
  ///Store Links
  static const String baseUrl ='https://fakestoreapi.com';

  static const String getAllProductsPath = "$baseUrl/products";

  static String productDetailsPath(int productId)=>'$baseUrl/products/$productId';

  static String cartPath(int productId)=>'$baseUrl/carts/$productId';

}
