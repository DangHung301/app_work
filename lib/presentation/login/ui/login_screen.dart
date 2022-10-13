import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recruit_app/config/base/app_exeption.dart';
import 'package:recruit_app/presentation/login/bloc/login_cubit.dart';
import 'package:recruit_app/presentation/tabbar_screen/ui/main_screen.dart';
import 'package:recruit_app/until/const/image.dart';
import 'package:recruit_app/until/const/string.dart';
import 'package:recruit_app/until/extension/string.dart';
import 'package:recruit_app/widget/button/button_custom.dart';
import 'package:recruit_app/widget/text_field/text_form_field.dart';
import 'package:recruit_app/widget/views/state_stream_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit loginCubit = LoginCubit();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final keyGroup = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginCubit.showContent();
  }

  @override
  Widget build(BuildContext context) {
    return StateStreamLayout(
      stream: loginCubit.streamState,
      error: AppException(StringConst.error, StringConst.xin_vui_long_thu_lai),
      textEmpty: StringConst.empty,
      retry: () {},
      child: Scaffold(
        body: Form(
          key: keyGroup,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                const Center(
                  child: Text(
                    StringConst.viec_lam_tot,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  StringConst.tai_khoan,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormFieldWidget(
                  controller: userController,
                  prefixIcon: SizedBox(
                    height: 20,
                    width: 20,
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.imgAcount,
                      ),
                    ),
                  ),
                  onChange: (text) {
                    if (text.isEmpty) {
                      setState(() {});
                      return loginCubit.isHideClearData = false;
                    }
                    setState(() {});
                    return loginCubit.isHideClearData = true;
                  },
                  hintText: StringConst.tai_khoan,
                  suffixIcon: loginCubit.isHideClearData
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {});
                                userController.clear();
                                loginCubit.isHideClearData = false;
                              },
                              child: SvgPicture.asset(
                                ImageAssets.icClearLogin,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  StringConst.mat_khau,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                TextFormFieldWidget(
                  controller: passwordController,
                  obscureText: loginCubit.isCheckEye1,
                  suffixIcon: loginCubit.isHideEye1
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {});
                                loginCubit.isCheckEye1 =
                                    !loginCubit.isCheckEye1;
                              },
                              child: loginCubit.isCheckEye1
                                  ? SvgPicture.asset(
                                      ImageAssets.imgView,
                                    )
                                  : SvgPicture.asset(
                                      ImageAssets.imgViewHide,
                                    ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  hintText: StringConst.mat_khau,
                  prefixIcon: SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Center(
                      child: SvgPicture.asset(
                        ImageAssets.imgPassword,
                      ),
                    ),
                  ),
                  onChange: (text) {
                    if (text.isEmpty) {
                      setState(() {});
                      loginCubit.isHideEye1 = false;
                      return true;
                    }
                    setState(() {});
                    loginCubit.isHideEye1 = true;
                    return true;
                  },
                  validator: (value) {
                    return (value ?? '').checkNull();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonCustomBottom(
                    title: StringConst.dang_nhap,
                    onPressed: () async {
                      if (keyGroup.currentState!.validate()) {
                        bool isLogin = await loginCubit.lognIn(
                            userController.text, passwordController.text);

                        if (isLogin) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MainTabBarView()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text(StringConst.dang_nhap_that_bai)));
                        }
                      } else {
                        _showToast(context: context);
                      }
                    }),
                const Spacer(
                  flex: 4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showToast({required BuildContext context, String? text}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text ?? StringConst.dang_nhap_that_bai),
      ),
    );
  }
}
