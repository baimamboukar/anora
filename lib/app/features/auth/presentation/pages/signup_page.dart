import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/constants/anora_constants.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SignupPage extends StatefulWidget implements AutoRouteWrapper {
  const SignupPage({super.key, this.invitation});
  final Invitation? invitation;

  @override
  State<SignupPage> createState() => _SignupPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: this,
    );
  }
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<ShadFormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController industryController;

  @override
  void initState() {
    super.initState();
    final hasInvitation = widget.invitation != null;
    nameController = TextEditingController(
      text: hasInvitation ? widget.invitation!.to.first.name : null,
    );
    emailController = TextEditingController(
      text: hasInvitation ? widget.invitation!.to.first.email : null,
    );
    passwordController = TextEditingController();
    industryController = TextEditingController();
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   industryController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final fromInvitation = widget.invitation != null;
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
                    backgroundColor: context.colorScheme.destructive,
                    title: const Text('Authentication Failed'),
                    description: const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Something went wrong! Please try again later....',
                      ),
                    ),
                    actions: [
                      ShadButton(
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
              constraints: BoxConstraints(maxWidth: context.width * .9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Assets.assetsLauncherIcon).floatC,
                  Text(
                    fromInvitation
                        ? 'Signup and Accept Invitation'
                        : 'Create an Account',
                    style: context.head,
                  ).floatC,
                  14.vGap,
                  if (fromInvitation)
                    Container(
                      //height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: context.colorScheme.ring,
                        borderRadius: BorderRadius.circular(12),
                        //border: Border.all(color: theme.colorScheme.primary, width: .4),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Hey ${widget.invitation!.to.first.name} 👋',
                            style: context.title,
                          ).format.floatL,
                          Text('You have been Invited by **${widget.invitation!.from.name}** to Join **${widget.invitation!.organization}**')
                              .format,
                        ],
                      ).hPadding.vPadding,
                    )
                  else
                    Text(
                      'We need few information. Please enter necessary information to create your account',
                      style: context.desc,
                    ),
                  24.vGap,
                  ShadInputFormField(
                    id: 'name',
                    controller: nameController,
                    label: const Text('Full name'),
                    placeholder: const Text('Enter your fullname'),
                    validator:
                        ValidationBuilder().required().minLength(8).build(),
                  ),
                  ShadInputFormField(
                    id: 'email',
                    readOnly: fromInvitation,
                    controller: emailController,
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
                    controller: passwordController,
                    label: const Text('Password'),
                    placeholder: const Text('Enter your password'),
                    obscureText: true,
                    validator:
                        ValidationBuilder().required().minLength(6).build(),
                  ),
                  SizedBox(
                    height: 84,
                    width: context.width,
                    child: ShadSelectFormField<String>(
                      minWidth: context.width,
                      label: const Text('Industry'),
                      onSaved: (industry) {
                        if (industry != null) {
                          industryController.text = industry;
                        }
                      },
                      onChanged: (industry) {
                        if (industry != null) {
                          industryController.text = industry;
                        }
                      },
                      onReset: () => industryController.clear(),
                      placeholder: const Text('Select your Industry'),
                      options: [
                        ...industries.entries.map(
                          (e) => ShadOption(
                            value: e.key,
                            child: Text(e.value),
                          ),
                        ),
                      ],
                      selectedOptionBuilder: (context, value) =>
                          Text(industries[value]!),
                    ),
                  ),
                  14.vGap,
                  SingupAction(
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    industryController: industryController,
                  ).floatC,
                  34.vGap,
                  TextButton(
                    onPressed: () async {
                      await context.router.replaceNamed(LOGIN_ROUTE);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: context.paragraph.copyWith(fontSize: 12),
                        ),
                        8.hGap,
                        const Text('Login here.'),
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

class SingupAction extends StatelessWidget {
  const SingupAction({
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.industryController,
    super.key,
  });

  final GlobalKey<ShadFormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController industryController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => ShadButton(
            size: ShadButtonSize.sm,
            width: context.width,
            text: const Text('Signup'),
            onPressed: () async {
              if (formKey.currentState!.saveAndValidate()) {
                // Send to Firebase
                await context.read<AuthCubit>().signup(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text,
                      industryController.text,
                    );
              }
            },
          ),
          singinUp: () => ShadButton(
            enabled: false,
            icon: const CupertinoActivityIndicator().hPaddingx(8),
            size: ShadButtonSize.sm,
            width: context.width,
            text: const Text('Please wait...'),
            onPressed: () async {
              if (formKey.currentState!.saveAndValidate()) {
                // Send to Firebase
                await context.read<AuthCubit>().signup(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text,
                      industryController.text,
                    );
              }
            },
          ),
        );
      },
    );
  }
}
