import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String keyWishlist = "key_wishlist";
  static String keyFavorite = "key_favorite";

  static void setWishlist(String wishlistItems) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyWishlist, wishlistItems);
  }

  static Future<String> getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyWishlist)!;
  }
}
