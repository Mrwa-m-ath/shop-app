import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Model/GetFavMod.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';

class Favarty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit()
        ..GetDioHomeCategty()
        ..GetFaverModelCubit(),
      child: BlocConsumer<MyCubit, MyStat>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          body: ConditionalBuilder(
            condition: MyCubit.get(context).getFavarModel != null,
            builder: (context) => ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 11,
              ),
              itemCount: MyCubit.get(context).getFavarModel!.data!.data!.length,
              itemBuilder: (context, index) => FavaritFun(
                  MyCubit.get(context).getFavarModel!.data!.data![index],
                  context),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    ); //Scaffold();
  }
}

Widget FavaritFun(Dataa dataa, context) => Container(
      child: Row(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            Image(
                width: 160,
                height: 160,
                image: NetworkImage('${dataa.product!.image}')),
            Container(
                color: Colors.black,
                width: 152,
                child: Text(
                  'Discount',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ))
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 155,
                child: Text(
                  '${dataa.product!.name}',
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (dataa.product!.oldPrice != dataa.product!.price)
                    Text(
                      '${dataa.product!.oldPrice}',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  if (dataa.product!.oldPrice == dataa.product!.price)
                    Text(
                      '0\$',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${dataa.product!.price}',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: () {
                MyCubit.get(context).ChangeFavarat(dataa.product!.id);
              },
              icon: CircleAvatar(
                backgroundColor: MyCubit.get(context).Favarit[dataa.product!.id]
                    ? Colors.red
                    : Colors.black,
                radius: 22,
                child: Icon(
                  Icons.favorite,
                  size: 21,
                  color: Colors.red.shade100,
                ),
              ))
        ],
      ),
    );

// Widget FavaritFun(Products products, context) => Container(
//       child: Row(
//         children: [
//           Stack(alignment: Alignment.bottomCenter, children: [
//             Image(
//                 width: 160,
//                 height: 160,
//                 image: NetworkImage('${products.image}')),
//             Container(
//                 color: Colors.black,
//                 width: 152,
//                 child: Text(
//                   'Discount',
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22),
//                 ))
//           ]),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 width: 155,
//                 child: Text(
//                   products.name,
//                   maxLines: 2,
//                 ),
//               ),
//               SizedBox(
//                 height: 33,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   if (products.oldPrice != products.price)
//                     Text(
//                       '${products.oldPrice}',
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   if (products.oldPrice == products.price)
//                     Text(
//                       '0\$',
//                       style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     '${products.price}',
//                     style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 12,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           IconButton(
//               onPressed: () {
//                 MyCubit.get(context).ChangeFavarat(products.id);
//               },
//               icon: CircleAvatar(
//                 backgroundColor: MyCubit.get(context).Favarit[products.id]
//                     ? Colors.red
//                     : Colors.black,
//                 radius: 22,
//                 child: Icon(
//                   Icons.favorite,
//                   size: 21,
//                   color: Colors.red.shade100,
//                 ),
//               ))
//         ],
//       ),
//     );
