import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Model/UserModel.dart';
import 'package:shopapp/MyIndex/Dio.dart';
import 'package:shopapp/MyIndex/MyStata.dart';
import 'package:shopapp/MyIndex/value.dart';

import '../Model/AddOrDeltModel.dart';
import '../Model/CategoryModel.dart';
import '../Model/GetFavMod.dart';
import '../Model/HomeModel.dart';

class MyCubit extends Cubit<MyStat> {
  MyCubit() : super(InitMyStata());

  static MyCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  void PostDioLogIn({required String Emal, required String Password}) async {
    emit(DioPostLogInLoding());
    await MyDio.PostData(
        lang: 'en',
        url: 'login',
        data: {'email': Emal, 'password': Password}).then((value) async {
      userModel = await UserModel.fromJson(value.data);
      userModel.toString();
      print(userModel!.message);
      emit(DioPostLogInSuccessful(userModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(DioPostLogInFailar());
    });
  }

  HomeModel? homeModel;
  Map<dynamic, dynamic> Favarit = {};
  FavMod? favMod;

  void ProfaileGetDio() {
    emit(ProfaileGetDioLoading());
    MyDio.GetDio(Path: 'profile', lang: 'en', token: token).then((value) async {
      userModel = UserModel.fromJson(value.data);
      print(value.toString());
      print('sssssssssssssssss');
      emit(ProfaileGetDioSucssess(userModel));
    }).catchError((onError) {
      emit(ProfaileGetDioFailar());
      print(onError.toString());
    });
  }

  void ChangeFavarat(int IdProduct) {
    Favarit[IdProduct] = !Favarit[IdProduct];
    emit(PostFavaritLoding());
    MyDio.PostData(
        url: 'favorites',
        lang: 'ar',
        token: token,
        data: {'product_id': IdProduct}).then((value) async {
      print(token);
      favMod = FavMod.Fj(value.data);
      if (!favMod!.status) {
        Favarit[IdProduct] = !Favarit[IdProduct];
      }

      emit(PostFavaritSuccess(favMod));
    }).catchError((onError) {
      Favarit[IdProduct] = !Favarit[IdProduct];
      print(onError.toString());
      emit(PostFavaritsFailat());
    });
  }

  void GetDioHomeCategty() async {
    emit(GetDioHomeCategtyLoding());
    await MyDio.GetDio(
      Path: 'home',
      lang: 'en',
    ).then((value) async {
      homeModel = await HomeModel.fromJson(value.data);
      homeModel!.data!.products!.forEach((element) {
        Favarit.addAll({element.id: element.inFavorites});
      });
      print(Favarit.toString());
      // print(value.data);

      emit(GetDioHomeCategtySuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetDioHomeCategtyFailar());
    });
  }

  ////

  CategoriesModel? categoriesModel;

  void CategoryProductDioGet() {
    emit(GetDioProductCategorLoading());
    MyDio.GetDio(Path: 'categories', token: token, lang: 'en')
        .then((value) async {
      categoriesModel = await CategoriesModel.fromJson(value.data);
      print(categoriesModel!.data!.data![0].image);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      emit(GetDioProductCategorSucssess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetDioProductCategorFailar());
    });
  }

  GetFavarModel? getFavarModel;

  void GetFaverModelCubit() {
    emit(GetFavartyStateLoading());
    MyDio.GetDio(Path: 'favorites', token: token, lang: 'en')
        .then((value) async {
      getFavarModel = await GetFavarModel.fromJson(value.data);
      print(getFavarModel!.status);
      print(getFavarModel!.status);
      print(getFavarModel!.status);
      print(getFavarModel!.data!.currentPage.toString());
      print(value.data);

      emit(GetDioHomeCategtySuccess());
    }).catchError((onError) {
      print(onError.toString());
      emit(GetFavartyStateFailar());
    });
  }

  void PostRejesterPost(
      {required name,
      required phone,
      required email,
      required password,
      required image}) {
    emit(PostRejesterPostStateLoading());
    MyDio.PostData(url: 'register', data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image
    }).then((value) async {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(PostRejesterPostStateSucssess(userModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(PostRejesterPosttateFailar());
    });
  }

  void UpDataCubitDioBu(
      {required Nme, required Eml, required PhN, required Img, required pswd}) {
    emit(UpDataPutDioStateLoading());
    MyDio.PutDio(
            path: 'update-profile',
            data: {
              'name': Nme,
              'password': pswd,
              'email': Eml,
              'phone': PhN,
              'image': Img
            },
            token: token,
            lang: 'en')
        .then((value) async {
      userModel = UserModel.fromJson(value.data);
      print(value.data);
      emit(UpDataPutDioStateSucssess(userModel));
    }).catchError((onError) {
      emit(UpDataPutDioStateFailar());
      print(onError.toString());
    });
  }
}
