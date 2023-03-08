import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/SharedPreferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../MyIndex/Cubit.dart';
import '../MyIndex/MyStata.dart';
import 'LogIn.dart';

class PageViewDe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Container(
            child: PageView.builder(
              controller: PageCont,
              onPageChanged: (s) {
                if (s == ListPageView.length - 1) {
                  ListBoolPageView = true;
                } else {
                  ListBoolPageView = false;
                }
                // //if(ListPageView.length-1==){

                //}
              },
              itemCount: 3,
              itemBuilder: (context, index) =>
                  PageViewBuilderFun(ListPageView[index], context),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}

var PageCont = PageController();

Widget PageViewBuilderFun(PageViewClass listpageview, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              image: AssetImage(listpageview.ImageP),
              height: 333,
              width: double.infinity),
          SizedBox(
            height: 44,
          ),
          Text(
            '${listpageview.tex}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
          ),
          SizedBox(
            height: 44,
          ),
          Text(
            '${listpageview.TextBode}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Spacer(),
          Row(
            children: [
              SmoothPageIndicator(
                controller: PageCont,
                count: ListPageView.length,
                effect: WormEffect(
                    activeDotColor: Colors.blue,
                    dotHeight: 22,
                    dotWidth: 22,
                    dotColor: Colors.black,
                    radius: 71),
              ),
              Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (ListBoolPageView) {
                    SharedPref.SaveData(key: 'IsBording', value: true);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(),
                      ),
                      (route) => false,
                    );
                  } else
                    PageCont.nextPage(
                        duration: Duration(microseconds: 522),
                        curve: Curves.fastLinearToSlowEaseIn);
                },
                child: Icon(Icons.navigate_next, size: 44, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );

class PageViewClass {
  var ImageP;
  var tex;
  var TextBode;

  PageViewClass({this.ImageP, this.tex, this.TextBode});
}

List ListPageView = [
  PageViewClass(
      ImageP: 'Imagee/undraw_Social_ideas_re_j5v4.png',
      tex: 'ONE',
      TextBode: 'This Page One'),
  PageViewClass(
      ImageP: 'Imagee/undraw_Social_girl_re_kdrx (1).png',
      tex: 'TOW',
      TextBode: 'This Page Tow'),
  PageViewClass(
      ImageP: 'Imagee/undraw_Social_expert_re_elbp.png',
      tex: 'Tree',
      TextBode: 'This Page Three')
];
bool ListBoolPageView = false;
