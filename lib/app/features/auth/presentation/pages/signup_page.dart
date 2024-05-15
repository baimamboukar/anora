import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
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
    nameController = TextEditingController();
    emailController = TextEditingController();
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
    final industries = {
      'TECH': 'Technologies',
      'COMMUNITY-MANAGEMENT': 'Community Management',
      'TECHNICAL-WRITING': 'Technical Writing',
      'HEALTHCARE': 'Healthcare',
      'EDUCATION': 'Education',
      'CUSTOMER-SERVICE': 'Customer Service',
      'FINANCE': 'Finance',
      'E-COMMERCE': 'E-commerce',
      'HUMAN-RESOURCES': 'Human Resources',
      'TRAVEL': 'Travel',
      'REAL-ESTATE': 'Real Estate',
      'LEGAL': 'Legal',
      'MARKETING': 'Marketing',
      'OTHER': 'Other',
    };

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
                  'Create an Account',
                  style: context.head,
                ).floatC,
                Text(
                  'We need few information. Please enter necessary information to create your account',
                  style: context.desc,
                ).floatC,
                24.vGap,
                ShadInputFormField(
                  id: 'name',
                  controller: nameController,
                  label: const Text('Full name'),
                  placeholder: const Text('Enter your fullname'),
                  obscureText: true,
                  validator:
                      ValidationBuilder().required().minLength(8).build(),
                ),
                ShadInputFormField(
                  id: 'email',
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
                      if (industry != null) industryController.text = industry;
                    },
                    onChanged: (industry) {
                      if (industry != null) industryController.text = industry;
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
    );
  }
}
