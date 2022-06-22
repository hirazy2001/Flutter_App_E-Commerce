import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../bloc/product/product_event.dart';
import '../../common/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/productDetail";
  final String productId;

  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  ProductDetailScreenState createState() {
    return ProductDetailScreenState();
  }
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return BlocProvider<ProductBloc>(
      create: (context) => ProductBloc()..add(ProductLoadingEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadedSuccessState) {
            return SafeArea(
                child: Scaffold(
                    body: Container(
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        children: [
                          appBar(),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    CarouselSlider.builder(
                                      itemCount: 1,
                                      itemBuilder:
                                          (context, itemIndex, pageViewIndex) =>
                                              Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.network(
                                            Constants.PRODUCT_ITEMS[itemIndex]),
                                      ),
                                      options: CarouselOptions(
                                        aspectRatio: 16 / 9,
                                        viewportFraction: 0.8,
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                        autoPlayAnimationDuration:
                                            const Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child: Text(state.product.price)),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 25, maxWidth: 25),
                                              child: const Image(
                                                width: 20,
                                                height: 20,
                                                image: AssetImage(
                                                    "assets/images/ic_unfavorite.png"),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          InkWell(
                                              onTap: () {},
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth: 25),
                                                child: const Image(
                                                  width: 22,
                                                  height: 22,
                                                  image: AssetImage(
                                                      "assets/images/ic_share.png"),
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    state.product.name!,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      '${state.product.rating}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14)),
                                              const TextSpan(
                                                  text: '/5',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      fontSize: 12))
                                            ]),
                                          ),
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            rating: state.product.rating,
                                            itemCount: 5,
                                            itemSize: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: '${state.product.sold} ',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          )),
                                      const TextSpan(
                                          text: 'Sold',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          )),
                                    ]))
                                  ],
                                ))
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    bottomNavigationBar: bottom(context, state)));
          }
          return Container();
        },
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Flexible(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Image(
                width: 30,
                height: 30,
                image: AssetImage("assets/images/ic_product_back.png"),
              ),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  border: Border.all(color: Colors.pink, width: 0.7)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      child: const Image(
                        width: 20,
                        height: 20,
                        image: AssetImage("assets/images/ic_search_pink.png"),
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
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  )),
                ],
              ),
            ),
          ),
          flex: 6,
        ),
        Flexible(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Image(
                width: 20,
                height: 20,
                image: AssetImage("assets/images/ic_share.png"),
              ),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Image(
                width: 20,
                height: 20,
                image: AssetImage("assets/images/ic_carts.png"),
              ),
            ),
          ),
          flex: 1,
        ),
        Flexible(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Image(
                width: 20,
                height: 20,
                image: AssetImage("assets/images/ic_options.png"),
              ),
            ),
          ),
          flex: 1,
        )
      ],
    );
  }

  Widget bottom(BuildContext context, ProductLoadedSuccessState state) {
    var productBloc = BlocProvider.of<ProductBloc>(context);
    return Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                          width: 20,
                          height: 20,
                          image: AssetImage("assets/images/ic_store.png")),
                      Text(
                        "Shop",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: InkWell(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                          width: 20,
                          height: 20,
                          image: AssetImage("assets/images/ic_chatting.png")),
                      Text(
                        "Chat",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Buy now " + state.product.price,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                )),
            Expanded(
                flex: 3,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 229, 18, 18)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ))
          ],
        ));
  }
}
