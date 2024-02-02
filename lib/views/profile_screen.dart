import 'package:care_route/components/my_button.dart';
import 'package:care_route/components/shadow_container.dart';
import 'package:care_route/components/text_field_widget.dart';
import 'package:care_route/components/text_widget.dart';
import 'package:care_route/components/widget_with_white_background.dart';
import 'package:care_route/controller/profile_screen_controller.dart';
import 'package:care_route/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends StatefulWidget {
  late ProfileScreenController profileScreenController;
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.profileScreenController = ProfileScreenController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return WidgetWithWhiteBackground(
      showAppBar: true,
      showBackButton: true,
      widget: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Consumer(
              builder: (context, ref, child) => Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyTheme.whiteColor,
                      border: Border.all(
                        color: MyTheme.borderColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: widget.profileScreenController
                                    .watchImageProviderValue(ref: ref) ==
                                null
                            ? null
                            : DecorationImage(
                                image: FileImage(
                                  widget.profileScreenController
                                      .watchImageProviderValue(ref: ref)!,
                                ),
                              ),
                        color: MyTheme.mainColor,
                        shape: BoxShape.circle,
                      ),
                      width: 30,
                      height: 30,
                      child: Center(
                        child: IconButton(
                          onPressed: () => widget.profileScreenController
                              .changeImage(ref: ref),
                          icon: Icon(
                            Icons.edit,
                            color: MyTheme.whiteColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ShadowContainer(
              widget: Padding(
                padding: MyTheme.padding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: 'Default Location',
                          fontSize: 16,
                        ),
                        TextWidget(
                          text: 'Scan QR',
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                        ),
                      ],
                    ),
                    TextFieldWidget(
                      hintText: 'Default Location',
                    ),
                    TextWidget(
                      text: 'Password',
                      fontSize: 16,
                    ),
                    TextFieldWidget(
                      hintText: 'Password',
                      isPasswordField: true,
                    ),
                    TextWidget(
                      text: 'Confirm Password',
                      fontSize: 16,
                    ),
                    TextFieldWidget(
                      hintText: 'Confirm Password',
                      isPasswordField: true,
                    ),
                  ],
                ),
              ),
            ),
            MyButton(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              text: 'Save Edits',
            )
          ],
        ),
      ),
    );
  }
}
