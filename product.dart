import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Model/CategoryModel.dart';
import 'package:shopapp/MyIndex/Cubit.dart';
import 'package:shopapp/MyIndex/MyStata.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MyCubit()..CategoryProductDioGet(),
        child: BlocConsumer<MyCubit, MyStat>(
            listener: (context, state) {},
            builder: (context, state) => Scaffold(
                  backgroundColor: Colors.orange.shade100,
                  body: ConditionalBuilder(
                    condition: MyCubit.get(context).categoriesModel != null,
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                    builder: (context) => Container(
                      child: ListView.separated(
                          itemBuilder: (context, index) => ListViewProduct(
                              MyCubit.get(context)
                                  .categoriesModel!
                                  .data!
                                  .data![index]),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 11,
                              ),
                          itemCount: MyCubit.get(context)
                              .categoriesModel!
                              .data!
                              .data!
                              .length),
                    ),
                  ),
                ))); //Scaffold();
  }
}

Widget ListViewProduct(DataData dataData) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange.shade300,
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: Row(
          children: [
            Image(
                width: 150,
                height: 100,
                image: NetworkImage('${dataData.image}')),
            Text(
              '${dataData.name}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next))
          ],
        ),
      ),
    );
