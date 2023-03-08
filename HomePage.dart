import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';
import 'package:shopapp/PageDeis/PagesForHomePage/Category.dart';
import 'package:shopapp/PageDeis/PagesForHomePage/Favarity.dart';
import 'package:shopapp/PageDeis/PagesForHomePage/SingOut.dart';
import 'package:shopapp/PageDeis/PagesForHomePage/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {},
        builder: (context, state) => DefaultTabController(
          length: 4,
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                toolbarHeight: 11,
                bottom: TabBar(
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.category),
                      text: 'catetory',
                    ),
                    Tab(
                      //   child: Product(),
                      icon: Icon(Icons.production_quantity_limits),
                      text: 'product',
                    ),
                    Tab(
                      //    child: Favarty(),
                      icon: Icon(Icons.favorite),
                      text: 'Favorite',
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      text: 'Profaile',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: t,
                children: [Cetegory(), Product(), Favarty(), SingOut()],
              )),
        ),
      ),
    ); //Scaffold();
  }
}

List Page = [
  Cetegory(),
  Product(),
  Favarty(),
];
int cuttenIndex = 0;

TabController? t;
