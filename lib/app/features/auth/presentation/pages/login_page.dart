import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class LoginPage extends StatefulWidget implements AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: this,
    );
  }
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
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              authenticated: (user) {
                context.router.replaceNamed('/');
              },
              failure: (failure) async {
                await showShadDialog<void>(
                  context: context,
                  builder: (context) => ShadDialog.alert(
                    // backgroundColor: context.colorScheme.destructive,
                    title: const Text('Authentication Failed'),
                    description: const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Something went wrong! Please try again later....',
                      ),
                    ),
                    actions: [
                      ShadButton.outline(
                        text: const Text('Okay'),
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
                );
              },
            );
          },
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
                  LoginAction(
                    formKey: formKey,
                    userEmailController: userEmailController,
                    userPasswordController: userPasswordController,
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
      ),
    );
  }
}

class LoginAction extends StatelessWidget {
  const LoginAction({
    required this.formKey,
    required this.userEmailController,
    required this.userPasswordController,
    super.key,
  });

  final GlobalKey<ShadFormState> formKey;
  final TextEditingController userEmailController;
  final TextEditingController userPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => ShadButton(
            size: ShadButtonSize.sm,
            width: context.width,
            text: const Text('Login'),
            onPressed: () async {
              if (formKey.currentState!.saveAndValidate()) {
                // Send to Firebase
                await context.read<AuthCubit>().login(
                      userEmailController.text.trim(),
                      userPasswordController.text,
                    );
              } else {
                // Process
              }
            },
          ),
          logginIn: () => ShadButton(
            size: ShadButtonSize.sm,
            enabled: false,
            width: context.width,
            icon: const CupertinoActivityIndicator().hPaddingx(8),
            text: const Text('Please wait...'),
            onPressed: () async {
              if (formKey.currentState!.saveAndValidate()) {
                // Send to Firebase
                await context.read<AuthCubit>().login(
                      userEmailController.text.trim(),
                      userPasswordController.text,
                    );
              } else {
                // Process
              }
            },
          ),
        );
      },
    );
  }
}
