import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/product/product_state.dart';
import 'package:flutter_app_e_commerce/src/screens/chat/chat_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/product_detail/bottom_sheet_detail.dart';
import 'package:flutter_app_e_commerce/src/widgets/product_detail/item_review.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../bloc/product/product_event.dart';
import '../../common/constants.dart';
import '../../utils/common_page_route.dart';
import '../../widgets/home/card_product.dart';

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
  final ScrollController _scrollList = ScrollController();

  @override
  Future<String> get data =>
      rootBundle.loadString('assets/markdown_test_page.md');

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
                            controller: _scrollList,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Text(state.product.price)),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 25,
                                                        maxWidth: 25),
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
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 5, left: 8),
                                  child: Text(
                                    state.product.name!,
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 30),
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
                                    )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: RichText(
                                            text: TextSpan(children: [
                                              const TextSpan(
                                                  text: "Rating and Review",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                      color: Colors.black)),
                                              TextSpan(
                                                  text:
                                                      " (${state.product.reviews.length})",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 15,
                                                      color: Colors.black))
                                            ]),
                                          )),
                                          const Text(
                                            "See All",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: ItemReview(
                                            review:
                                                state.product.reviews[index]),
                                      );
                                    },
                                    itemCount: state.product.reviews.length,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image(
                                        height: 30,
                                        width: 30,
                                        image:
                                            NetworkImage(state.shopView.image)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.shopView.name,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          state.shopView.online,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black38),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    color: Colors.black12,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Center(
                                            child: Text(
                                          "Product details",
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontSize: 14),
                                        ))
                                      ],
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    "Outstanding Characteristics",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                state.product.characteristics.isNotEmpty
                                    ? Column(
                                        children: state.product.characteristics
                                            .map((e) => itemFeature(e))
                                            .toList(),
                                      )
                                    : const SizedBox(),
                                const Divider(
                                  color: Colors.black38,
                                ),
                                InkWell(
                                  onTap: () {
                                    showMaterialModalBottomSheet(
                                        barrierColor: Colors.black12,
                                        context: context,
                                        builder: (context) =>
                                            const BottomSheetDetail());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                            child: Text(
                                          "Characteristics",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                        Text(
                                          "Brand, Models, etc",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.black38,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text("Product Description",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                  // InkWell(
                                  // )
                                ),
                                Visibility(
                                    visible: true,
                                    child: InkWell(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: const Image(
                                          height: 20,
                                          width: 20,
                                          image: AssetImage(
                                              'assets/images/ic_up_arrow.png'),
                                        ),
                                      ),
                                    )),
                                const Markdown(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  data: Constants.FILE_HTML_PRODUCT,
                                  // onTapLink: (text, href, title){
                                  //
                                  // },
                                ),
                                StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  children: state.productDetailView.productViews
                                      .map((e) {
                                    return CardProduct(
                                      product: e,
                                      onClick: () {
                                        Navigator.of(context)
                                            .push(CommonPageRoute(
                                                child: ProductDetailScreen(
                                                  productId: e.id!,
                                                ),
                                                direction: AxisDirection.left));
                                        // Navigator.pushNamed(context,
                                        //     ProductDetailScreen.routeName,
                                        //     arguments: e.id);
                                      },
                                    );
                                  }).toList(),
                                )
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

  Widget itemFeature(String feature) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: const BoxDecoration(
                color: Colors.black38, shape: BoxShape.circle),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            feature,
            style: const TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Expanded(
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
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  border: Border.all(color: Colors.pink, width: 0.7)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
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
        Expanded(
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
        Expanded(
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
        Expanded(
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
        constraints: const BoxConstraints(minHeight: 40, maxHeight: 55),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                          width: 18,
                          height: 18,
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
                flex: 2,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ChatScreen.routeName,
                        arguments: "1");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Image(
                          width: 18,
                          height: 18,
                          image: AssetImage("assets/images/ic_chatting.png")),
                      Text(
                        "Chat",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                flex: 2,
              ),
              Expanded(
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
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                flex: 3,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
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
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
                flex: 3,
              ),
              const SizedBox(
                width: 8,
              ),
            ]));
  }
}
