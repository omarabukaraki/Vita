import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:vitafit/app_authentication.dart';
import 'core/widget/custom_button.dart';
import 'core/widget/custom_sign_up_image.dart';
import 'core/widget/custom_text_field.dart';
import 'core/widget/sign_and_login_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController programPrice = TextEditingController();
  TextEditingController availability = TextEditingController();
  TextEditingController description = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(children: [
                const CustomSignUpImage(),
                CustomTextField(
                  icon: Icons.person,
                  text: 'Full Name',
                  onChanged: (userName) {
                    fullName.text = userName;
                  },
                ),
                CustomTextField(
                  icon: Icons.phone,
                  text: 'phone number',
                  onChanged: (userNumber) {
                    phoneNumber.text = userNumber;
                  },
                ),
                CustomTextField(
                  text: 'Email',
                  onChanged: (userEmail) {
                    email.text = userEmail;
                  },
                ),
                CustomTextField(
                  isPassword: true,
                  icon: Icons.lock,
                  text: 'Password',
                  onChanged: (userPassword) {
                    password.text = userPassword;
                  },
                ),
                CustomTextField(
                  icon: Icons.pin_drop,
                  text: 'location',
                  onChanged: (userLocation) {
                    location.text = userLocation;
                  },
                ),
                CustomTextField(
                  icon: Icons.price_check_rounded,
                  text: 'Your program price',
                  onChanged: (userProgramPrice) {
                    programPrice.text = userProgramPrice;
                  },
                ),
                CustomTextField(
                  icon: Icons.watch_later,
                  text: 'Your Availability',
                  onChanged: (userAvailability) {
                    availability.text = userAvailability;
                  },
                ),
                CustomTextField(
                  icon: Icons.edit,
                  text: 'Describe your self',
                  onChanged: (userDescription) {
                    description.text = userDescription;
                  },
                ),
                CustomButton(
                  labelBtn: 'Sign Up',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      await AppAuthentication().signUpUser(
                          fullName: fullName.text,
                          phoneNumber: phoneNumber.text,
                          email: email.text,
                          location: location.text,
                          programPrice: programPrice.text,
                          availability: availability.text,
                          description: description.text,
                          password: password.text,
                          context: context);
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                SignAndLoginButton(
                  question: 'Already have an Account?',
                  pageName: ' Login',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 40)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
