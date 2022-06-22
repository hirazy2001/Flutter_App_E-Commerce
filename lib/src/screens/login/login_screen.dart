import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_app_e_commerce/src/bloc/authentication/authentication_state.dart';
import 'package:flutter_app_e_commerce/src/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/app_bar_screen.dart';
import 'package:flutter_app_e_commerce/src/widgets/button_material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/authentication/authentication_event.dart';
import '../../data/model/request/login_request.dart';
import '../../widgets/dialog_loading.dart';
import '../tab/tab_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  FocusNode focusNodeUsername = FocusNode();
  FocusNode focusNodePassword = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isExpandedSpace = false;

  @override
  void initState() {
    super.initState();
    focusNodeUsername.addListener(() {
      if (focusNodeUsername.hasFocus) {
        // setState((){
        //   isExpandedSpace = false;
        // });
      } else {}
    });

    focusNodePassword.addListener(() {
      if (focusNodePassword.hasFocus) {
        setState(() {
          isExpandedSpace = true;
        });
      } else {
        setState(() {
          isExpandedSpace = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(() {
        Navigator.pop(context);
      }),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoading) {
            DialogLoading.showDialogLoading(context);
            Navigator.pushNamed(context, TabScreen.routeName,
                arguments: _usernameController.text);
          } else if (state is UnAuthenticatedState) {
            Navigator.pop(context);
            Navigator.pushNamed(context, TabScreen.routeName,
                arguments: _usernameController.text);
          }
          else if(state is AuthenticatedState){

          }
        },
        child: SafeArea(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome back",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Login Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: TextField(
                              focusNode: focusNodeUsername,
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black26),
                                  hintText: "Phone Number/Email"),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: TextField(
                                focusNode: focusNodePassword,
                                controller: _passwordController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.black26),
                                    hintText: "Password"),
                              ),
                            )),
                        isExpandedSpace
                            ? const SizedBox(
                                height: 15,
                              )
                            : const SizedBox(
                                height: 0,
                              )
                      ]),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 10, right: 10, bottom: 10),
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ButtonMaterial(
                              text: "Log in",
                              onClick: () {
                                authBloc.add(AuthenticationLoginEvent(
                                    loginRequest: LoginRequest(
                                        phoneOrEmail: _usernameController.text,
                                        password: _passwordController.text)));
                              })
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
