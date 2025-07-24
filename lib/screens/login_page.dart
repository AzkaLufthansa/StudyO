import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/auth/auth_cubit.dart';
import 'package:study_o/utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            print('STATE PRINT: ${state.errMessage}');
            if (state is AuthLoading) {
              SmartDialog.showLoading();
            }

            if (state is AuthSuccess) {
              SmartDialog.dismiss();

              print('AUTH SESSION PRINT: ${state.authSession}');

              Get.offAndToNamed('/home');
            }

            if (state is AuthFailure) {
              SmartDialog.dismiss();

              // Fluttertoast.showToast(msg: state.errMessage);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'app-logo',
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2A2A2A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.school,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                _buildAuthButton(
                  context,
                  label: 'Continue with Google',
                  onPressed: () async {
                    BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  },
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildAuthButton(
    BuildContext context, {
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Border? border,
  }) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: backgroundColor ?? Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_google.png',
                width: 20,
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}