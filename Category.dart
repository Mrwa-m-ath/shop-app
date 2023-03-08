import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Model/CategoryModel.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';

import '../../Model/HomeModel.dart';

class Cetegory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyCubit()
          ..GetDioHomeCategty()
          ..CategoryProductDioGet(),
        child: BlocConsumer<MyCubit, MyStat>(
            listener: (context, state) {
              if (state is PostFavaritSuccess)
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${state.favMod!.message}')));
            },
            builder: (context, state) => Scaffold(
                  backgroundColor: Colors.orange.shade100,
                  body: ConditionalBuilder(
                      condition: MyCubit.get(context).homeModel != null,
                      builder: (context) =>
                          CategroyFun(MyCubit.get(context).homeModel, context),
                      fallback: (context) => Center(
                            child: CircularProgressIndicator(),
                          )),
                )));
  }
}

Widget ListViewProduct(DataData dataData) =>
    Stack(alignment: Alignment.bottomCenter, children: [
      Image(width: 100, height: 100, image: NetworkImage('${dataData.image}')),
      Container(
          width: 100,
          color: Colors.orange.shade300,
          child: Text(
            '${dataData.name}',
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ))
    ]);

Widget CategroyFun(HomeModel? homeModel, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 11,
            ),
            Container(
              width: double.infinity,
              color: Colors.green.shade200,
              child: CarouselSlider(

                  //Map لانه banners List
                  items: homeModel!.data!.banners!
                      .map((e) => Image(image: NetworkImage(e.image)))
                      .toList(),
                  options: CarouselOptions(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      viewportFraction: 22,
                      enlargeFactor: 22)),
            ),
            Text(
              'Category',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
            Container(
              height: 100,
              //لازم نحط اليست بكونتينر ونحدد هرزنيتل او فارتلكل  ع شان نحدد العرض او الطول
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListViewProduct(
                      MyCubit.get(context).categoriesModel!.data!.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 11,
                      ),
                  itemCount: 5),
            )
            ////
            ///
            /// //
            ,
            Text(
              'New Produt',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis),
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: 1 / 1.55,
              //مسافه بين صفين     Row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              //مسافه بين عمودين     Column
              crossAxisCount: 2,
              children: List.generate(
                  homeModel.data!.products!.length,
                  (index) => NewProdut(
                      MyCubit.get(context).homeModel!.data!.products![index],
                      context)),
            )
          ],
        ),
      ),
    );
// //

Widget NewProdut(Products? product, context) => Container(
      color: Colors.orange.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(alignment: Alignment.bottomLeft, children: [
            Image(
                width: double.infinity,
                height: 150,
                image: NetworkImage('${product!.image}')),
            Container(
                color: Colors.red,
                width: 100,
                child: Text(
                  'Discunt',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ))
          ]),
          Text(
            '${product.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            maxLines: 2,
          ),
          Row(
            children: [
              Text(
                '${product.oldPrice}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.blue),
              ),
              SizedBox(
                width: 22,
              ),
              Text(
                '${product.price}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  MyCubit.get(context).ChangeFavarat(product.id);
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundColor: MyCubit.get(context).Favarit[product.id]
                      ? Colors.red
                      : Colors.black,
                  child: Icon(
                    Icons.favorite,
                    size: 23,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
