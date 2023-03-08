import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/value.dart';
import 'package:shopapp/RejesterPage.dart';

import '../MyIndex/Cubit.dart';
import '../MyIndex/MyStata.dart';
import '../MyIndex/SharedPreferences.dart';
import 'HomePage.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyCubit(),
        child: BlocConsumer<MyCubit, MyStat>(
            listener: (context, state) {
              if (state is DioPostLogInSuccessful) {
                if (state.userModel!.status) {
                  print(state.userModel!.message);
                  //token
                  SharedPref.SaveData(
                          key: 'token', value: state.userModel!.data!.token)
                      .then((value) {
                    token = state.userModel!.data!.token;
                    print(token);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  });
                } else {
                  print(state.userModel!.message);
                }
              }
            },
            builder: (context, state) => Scaffold(
                  appBar: AppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 33,
                          ),
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 44),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'You Can Login into browser using Email and Password',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 24,
                                color: Colors.black45),
                          ),
                          SizedBox(
                            height: 52,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (va) {
                              if (va!.isEmpty) {}
                              return ' Can not leave this empty';
                            },
                            controller: EmailContoller,
                            decoration: InputDecoration(
                                hintText: '      Email',
                                label: Text(
                                  'email',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 33),
                                ),
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.black45),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 11),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                          SizedBox(
                            height: 42,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: (va) {
                              if (va!.isEmpty) {}
                              return ' Can not leave this empty';
                            },
                            controller: PassWaContoller,
                            decoration: InputDecoration(
                                label: Text(
                                  'password',
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 33),
                                ),
                                hintText: '    Password',
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.black45),
                                suffix: Icon(Icons.remove_red_eye),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 31),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                          ),
                          SizedBox(
                            height: 55,
                          ),
                          Container(
                              color: Colors.blue,
                              width: double.infinity,
                              height: 66,
                              child: MaterialButton(
                                onPressed: () {
                                  MyCubit.get(context).PostDioLogIn(
                                      Emal: EmailContoller.text,
                                      Password: PassWaContoller.text);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 42),
                                ),
                              )),
                          SizedBox(
                            height: 33,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'If you do not have an account?',
                                  style: TextStyle(fontSize: 17),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RejesterPagr(),
                                          ));
                                    },
                                    child: Text('Regester Now'))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

var EmailContoller = TextEditingController();
var PassWaContoller = TextEditingController();
