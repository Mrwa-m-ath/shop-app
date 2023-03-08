import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';

import 'PageDeis/LogIn.dart';

class RejesterPagr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {
          if (state is PostRejesterPostStateSucssess) {
            if (state.userModel!.status) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.userModel!.message}')));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInPage(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.userModel!.message}')));
              print(state.userModel!.status);
            }
          }
          if (state is UpDataPutDioStateSucssess) {
            if (state.userModel!.status) {
              print(state.userModel!.status);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.userModel!.message}')));
            } else {
              print(state.userModel!.status);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${state.userModel!.message}')));
            }
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Form(
            key: KeyFmf,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Rejester Now',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      Container(
                        width: 450,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: NamC,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Must be take This empty';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Name',
                              suffixIcon: Icon(Icons.drive_file_rename_outline),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 11))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: PhonC,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Must be take This empty';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Phone',
                              suffixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 11))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 450,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: EmlC,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Must be take This empty';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Email',
                              suffixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 11))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: PswodC,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Must be take This empty';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: Icon(Icons.remove_red_eye),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 11))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.url,
                          controller: EmgC,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Must be take This empty';
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Emage',
                              suffixIcon: Icon(
                                Icons.photo,
                                size: 22,
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 11))),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      ConditionalBuilder(
                        condition: state is! PostRejesterPostStateLoading,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => Container(
                          height: 77,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22))),
                          width: double.infinity,
                          child: MaterialButton(
                              onPressed: () {
                                if (KeyFmf.currentState!.validate()) {
                                  MyCubit.get(context).PostRejesterPost(
                                      name: NamC.text,
                                      phone: PhonC.text,
                                      email: EmlC.text,
                                      password: PswodC.text,
                                      image: EmgC.text);
                                }
                              },
                              child: Text(
                                'Regester',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 33),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      ConditionalBuilder(
                        condition: state is! UpDataPutDioStateLoading,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => Container(
                          height: 77,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22))),
                          width: double.infinity,
                          child: MaterialButton(
                              onPressed: () {
                                if (KeyFmf.currentState!.validate()) {
                                  MyCubit.get(context).UpDataCubitDioBu(
                                      Nme: NamC.text,
                                      PhN: PhonC.text,
                                      Eml: EmlC.text,
                                      pswd: PswodC.text,
                                      Img: EmgC.text);
                                }
                              },
                              child: Text(
                                'UpData',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 33),
                              )),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

var NamC = TextEditingController();
var EmlC = TextEditingController();
var PswodC = TextEditingController();
var EmgC = TextEditingController();

var PhonC = TextEditingController();
var KeyFmf = GlobalKey<FormState>();
