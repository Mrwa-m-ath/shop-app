import 'package:shopapp/Model/AddOrDeltModel.dart';
import 'package:shopapp/Model/UserModel.dart';

abstract class MyStat {}

class InitMyStata extends MyStat {}

class DioPostLogInLoding extends MyStat {}

class DioPostLogInSuccessful extends MyStat {
  UserModel? userModel;

  DioPostLogInSuccessful(this.userModel);
}

class DioPostLogInFailar extends MyStat {}

class GetDioHomeCategtyLoding extends MyStat {}

class GetDioHomeCategtySuccess extends MyStat {}

class GetDioHomeCategtyFailar extends MyStat {}
////

class GetDioProductCategorLoading extends MyStat {}

class GetDioProductCategorSucssess extends MyStat {}

class GetDioProductCategorFailar extends MyStat {}

class PostFavaritLoding extends MyStat {}

class PostFavaritSuccess extends MyStat {
  FavMod? favMod;

  PostFavaritSuccess(this.favMod);
}

class PostFavaritsFailat extends MyStat {}
//class InitMyStata extends MyStat{}
//class InitMyStata extends MyStat{}

class GetFavartyStateLoading extends MyStat {}

class GetFavartyStateSucssess extends MyStat {}

class GetFavartyStateFailar extends MyStat {}

class ProfaileGetDioLoading extends MyStat {}

class ProfaileGetDioSucssess extends MyStat {
  UserModel? userModel;
  ProfaileGetDioSucssess(this.userModel);
}

class ProfaileGetDioFailar extends MyStat {}

class PostRejesterPostStateLoading extends MyStat {}

class PostRejesterPostStateSucssess extends MyStat {
  UserModel? userModel;
  PostRejesterPostStateSucssess(this.userModel);
}

class PostRejesterPosttateFailar extends MyStat {}

class UpDataPutDioStateLoading extends MyStat {}

class UpDataPutDioStateSucssess extends MyStat {
  UserModel? userModel;
  UpDataPutDioStateSucssess(this.userModel);
}

class UpDataPutDioStateFailar extends MyStat {}
