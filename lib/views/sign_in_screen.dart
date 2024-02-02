import 'package:care_route/components/app_bar_widget.dart';
import 'package:care_route/components/my_button.dart';
import 'package:care_route/components/shadow_container.dart';
import 'package:care_route/components/text_field_widget.dart';
import 'package:care_route/components/text_widget.dart';
import 'package:care_route/components/widget_with_white_background.dart';
import 'package:care_route/controller/sig_in_controller.dart';
import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SignInController signInController = SignInController();

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetWithWhiteBackground(
      widget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coloredLogo.png',
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ShadowContainer(
                widget: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const TextWidget(
                      text: 'Sign In',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    TextWidget(
                      text: 'Sign In To Continue',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyTheme.textBlackColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                      hintText: 'Username',
                    ),
                    TextFieldWidget(
                      hintText: 'Password',
                      isPasswordField: true,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Consumer(
                                builder: (context, ref, child) => InkWell(
                                  onTap: () => ref
                                          .read(signInController
                                              .keepMeInProvider.notifier)
                                          .state =
                                      !ref
                                          .read(signInController
                                              .keepMeInProvider.notifier)
                                          .state,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: MyTheme.textBlackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        3,
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: ref.watch(
                                            signInController.keepMeInProvider)
                                        ? Center(
                                            child: Container(
                                              width: 12,
                                              height: 12,
                                              decoration: BoxDecoration(
                                                color: MyTheme.mainColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  2,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ),
                              TextWidget(
                                text: 'keep Me Sign In',
                                color: MyTheme.textBlackColor,
                                fontSize: 14,
                              ),
                            ],
                          ),
                          TextWidget(
                            text: 'Forget Password?',
                            color: MyTheme.mainColor,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            MyButton(
              padding: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width - 80,
              action: () => signInController.moveToHomePage(context: context),
              text: 'Sign In',
              textColor: MyTheme.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}
