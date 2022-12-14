class ConstantStrings {
  static String kBaseUrl = 'http://lm.okommerce.com/api/';
  static String kAPIVersion = 'v1/';
  static String kBannerAPI = 'banners';
  static String kCategoryAPI = 'ParentCategory/4';
  static String kSubCategoryAPI = 'Category/4/';
  static String kProductsAPI = 'Products/4/1/13/1';
  static String kProductDetailsAPI = 'Product-Details';
  static String kRegisterAPI = 'customer-register';
  static String kLoginAPI = 'customer-login';
  static String kCartItemsAPI = 'cart-items';
  static String kAddToCartAPI = 'add-to-cart';
  static String kRemoveFromCartAPI = 'remove-product-from-cart';
  static String kRemoveItemFromCartAPI = 'remove-from-cart/';
  static String kCountryAPI = 'country';
  static String kStateAPI = 'state/';
  static String kCityAPI = 'city/';
  static String kDeliveryAddressesAPI = 'delivery-address';
  static String kUpdateDeliveryAddresstAPI = 'update-delivery-address';
  static String kDeleteDeliveryAddresstAPI = 'delete-delivery-address/';
  static String kOrderAPI = 'order';
  static String kPreviousOrderAPI = 'previous-order';
  static String kLatestOrderAPI = 'latest-order';

  // error msgs
  static String kWentWrong = 'Something went wrong';
  static String kNoData = 'No Data Found!';
  static String kEmptyFields = 'Please fill all fields';
  static String kValidEmail = 'Please enter a valid email';
  static String kPasswordLength = 'Password must be at least 6 characters';

  // fonts
  static String kFontFamily = 'Poppins';

  static String kHtmlPrefix = '''
  <!DOCTYPE html>
    <html>
      <head>
      <style>
      img{
        width:100% !important;
      }
      </style>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>
      <body>
        <div style="margin-left: 15px; margin-right: 15px;">
      ''';
  static String kHtmlPostFix = '''
  </div>
  </body>
  </html>
  ''';
}
