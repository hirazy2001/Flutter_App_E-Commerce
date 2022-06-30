import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountWidget extends StatefulWidget {
  @override
  AccountWidgetState createState() {
    return AccountWidgetState();
  }
}

class AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 300,
          title: Row(
            children: [
              InkWell(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white10)),
                  child: Image.asset(
                    'assets/images/ic_account_setting.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "********900",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.white10)),
                  child: Image.asset(
                    'assets/images/ic_setting.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              )
            ],
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/img_city.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "My favorites",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "My favorites",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "My favorites",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "My favorites",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
            Text(
                "These two widgets are very useful when you have numerous items to show, but the items cannot be fully visible in the viewport due to their sizes. We need to provide SliverChildDelegate to SliverList and SliverGrid, that can be either SliverChildListDelegate or SliverChildBuilderDelegate depending on your need.SliverChildListDelegate and SliverChildBuilderDelegateThese two delegates supply children for slivers. The difference is that SliverChildListDelegate provides children using an explicit list, which is convenient but reduces the benefit of building children lazily, while SliverChildBuilderDelegate provides children using an IndexedWidgetBuilder callback, so that the children do not even have to be built until they are displayed. The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction. The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction.The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction. The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction. The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction. The output indicates that widgets are NOT created until they are visible and the widgets been scrolled out of the viewport will be destroyed. This mechanism benefits memory reduction."),
          ],
        ))
      ],
    ));
  }
}
