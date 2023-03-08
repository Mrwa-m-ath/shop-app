import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';
import 'package:shopapp/MyIndex/SharedPreferences.dart';
import 'package:shopapp/PageDeis/LogIn.dart';

class SingOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit()..ProfaileGetDio(),
      child: BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {
          if (state is ProfaileGetDioSucssess) {
            nameC.text = state.userModel!.data!.name;
            emailC.text = state.userModel!.data!.email;
            phoneC.text = state.userModel!.data!.phone;
          }
        },
        builder: (context, state) => Scaffold(
            body: ConditionalBuilder(
          builder: (context) => ProfaileFun(context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
          condition: MyCubit.get(context).userModel != null,
        )),
      ),
    ); //Scaffold();
  }
}

var nameC = TextEditingController();
var emailC = TextEditingController();
var phoneC = TextEditingController();
var keyf = GlobalKey<FormState>();

Widget ProfaileFun(context) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        child: Column(
          children: [
            Container(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.text,
                validator: (s) {
                  if (s!.isEmpty) {
                    return 'must be not empty';
                  }
                },
                controller: nameC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 11)),
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (s) {
                  if (s!.isEmpty) {
                    return 'must be not empty';
                  }
                },
                controller: emailC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 11)),
                    hintText: 'email',
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                validator: (s) {
                  if (s!.isEmpty) {
                    return 'must be not empty';
                  }
                },
                controller: phoneC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 11)),
                    hintText: 'phone',
                    prefixIcon: Icon(Icons.phone)),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              color: Colors.blueAccent,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  SharedPref.RemoveData(key: 'token').then((value) {
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogInPage(),
                          ),
                          (route) => false);
                    }
                  });
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
