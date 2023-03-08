class FavMod {
  var status;
  var message;
  FavMod.Fj(Map<String, dynamic> s) {
    status = s['status'];
    message = s['message'];
  }
}
