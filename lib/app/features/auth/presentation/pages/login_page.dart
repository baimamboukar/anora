import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<ShadFormState>();
  late final TextEditingController userEmailController;
  late final TextEditingController userPasswordController;
  @override
  void initState() {
    super.initState();
    userEmailController = TextEditingController();
    userPasswordController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   userPasswordController.dispose();
  //   userEmailController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Assets.assetsLauncherIcon).floatC,
                Text(
                  'Welcome Back 💐',
                  style: context.head,
                ).floatC,
                Text(
                  '''
We need few information. Please enter your email and password credentials to login to your account''',
                  style: context.desc,
                ).floatC,
                24.vGap,
                ShadInputFormField(
                  id: 'email',
                  controller: userEmailController,
                  label: const Text('Email'),
                  placeholder: const Text('alpha.romeo@gmail.com'),
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationBuilder()
                      .email()
                      .required()
                      .maxLength(25)
                      .build(),
                ),
                ShadInputFormField(
                  id: 'password',
                  controller: userPasswordController,
                  label: const Text('Password'),
                  placeholder: const Text('Enter your password'),
                  obscureText: true,
                  validator:
                      ValidationBuilder().required().minLength(6).build(),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password ?'),
                ),
                4.vGap,
                ShadButton(
                  size: ShadButtonSize.sm,
                  width: context.width,
                  text: const Text('Login'),
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      // Send to Firebase
                    } else {
                      // Process
                    }
                  },
                ).floatC,
                34.vGap,
                TextButton(
                  onPressed: () async {
                    await context.router.replaceNamed<void>(SIGNUP_ROUTE);
                  },
                  child: Row(
                    children: [
                      Text(
                        "Don't have an account yet?",
                        style: context.paragraph.copyWith(fontSize: 12),
                      ),
                      8.hGap,
                      const Text('Create an account.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
