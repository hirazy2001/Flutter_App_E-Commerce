import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/data/model/product.dart';
import 'package:flutter_app_e_commerce/src/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_app_e_commerce/src/screens/search_products/search_product_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/home/card_product.dart';
import 'package:flutter_app_e_commerce/src/widgets/home/item_category.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../data/model/item_category.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  HomeWidgetState createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
          child: Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      width: 30,
                      height: 30,
                      image: AssetImage("assets/images/ic_qr.png"),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SearchProductScreen.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        border: Border.all(color: Colors.pink, width: 0.7)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: const Image(
                              width: 20,
                              height: 20,
                              image: AssetImage("assets/images/ic_camera.png"),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  "Search Products",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        )),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(100, 255, 162, 77),
                                    Color.fromARGB(100, 206, 24, 31),
                                    Color.fromARGB(100, 165, 8, 155)
                                  ]),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(10),
                              child: const Image(
                                width: 12,
                                height: 12,
                                image:
                                    AssetImage("assets/images/ic_search.png"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                flex: 8,
              ),
              Flexible(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Image(
                      width: 20,
                      height: 20,
                      image: AssetImage("assets/images/ic_qr.png"),
                    ),
                  ),
                ),
                flex: 1,
              )
            ],
          ),
        ),
        Expanded(
            child: CustomRefreshIndicator(
          builder: (BuildContext context, Widget child,
              IndicatorController controller) {
            return SingleChildScrollView(
                child: Container(
                  color: const Color.fromARGB(100, 227, 227, 227),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            const Text(
                              "Categories",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      "View All →",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          height: 120,
                          child: ListView(
                            shrinkWrap: true,
                            children: itemCategories.map((e) {
                              return ItemCategoryWidget(
                                  itemCategory: e,
                                  onTap: () {
                                    // Navigator.pushNamed(context, );
                                  });
                            }).toList(),
                            scrollDirection: Axis.horizontal,
                          )),
                      StaggeredGrid.count(
                        crossAxisCount: 2,
                        children: products.map((e) {
                          return CardProduct(product: e, onClick: (){
                            Navigator.pushNamed(context, ProductDetailScreen.routeName,
                                arguments: e.id);
                          },);
                        }).toList(),
                      )
                    ],
                  ),
                ));
          },
          onRefresh: () async{

          },
          child: SingleChildScrollView(
              child: Container(
            color: const Color.fromARGB(100, 227, 227, 227),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Text(
                                "View All →",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 120,
                    child: ListView(
                      shrinkWrap: true,
                      children: itemCategories.map((e) {
                        return ItemCategoryWidget(
                            itemCategory: e,
                            onTap: () {
                              // Navigator.pushNamed(context, );
                            });
                      }).toList(),
                      scrollDirection: Axis.horizontal,
                    )),
                StaggeredGrid.count(
                  crossAxisCount: 2,
                  children: products.map((e) {
                    return CardProduct(product: e, onClick: (){

                    },);
                  }).toList(),
                )
              ],
            ),
          )),
        ))

        // LayoutBuilder(builder:
        //     (BuildContext context, BoxConstraints viewportConstraints) {
        //   return SingleChildScrollView(
        //       child: ConstrainedBox(
        //     constraints: BoxConstraints(
        //       minHeight: viewportConstraints.maxHeight,
        //     ),
        //     child: Column(
        //       children: [
        //         // Categories
        //         const SizedBox(
        //           height: 10,
        //         ),
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           children: [
        //             const Text(
        //               "Categories",
        //               style: TextStyle(
        //                   color: Colors.black,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 17),
        //             ),
        //             InkWell(
        //               onTap: () {},
        //               child: Container(
        //                 padding: const EdgeInsets.all(10),
        //                 child: const Text(
        //                   "View All ->",
        //                   style: TextStyle(
        //                       color: Colors.black12,
        //                       fontWeight: FontWeight.w400,
        //                       fontSize: 15),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //
        //         ListView.builder(
        //           itemBuilder: (context, index) {
        //             return ItemCategoryWidget(
        //                 icon: "",
        //                 color: Colors.blue,
        //                 id: 1,
        //                 category: "",
        //                 onTap: () {});
        //           },
        //           scrollDirection: Axis.horizontal,
        //         )
        //       ],
        //     ),
        //   ));
        // })
      ],
    )));
  }
}

// SafeArea(
// child: CustomRefreshIndicator(
// onRefresh: () async {
// BlocProvider.of<HomeBloc>(context).add(HomeRefreshEvent());
// },
// builder: (BuildContext context, Widget child,
// IndicatorController controller) {
// return Container(
// child: Lottie.asset('assets/raw/anim_refresh.json'),
// );
// },
// child: SingleChildScrollView(
// child: Column(
// children: [
// state is HomeLoadSuccessState
// ? StaggeredGrid.count(
// crossAxisCount: 2,
// children: [
// // List.generate(, (index) => null)
// ],
// )
// : (state is HomeLoadFailedState
// ? const Text(
// "Load Failed",
// style: TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.w400,
// fontSize: 16),
// )
// : const CircularProgressIndicator(
// color: Colors.blue,
// ))
// ],
// ),
// ),
// ),
// )
