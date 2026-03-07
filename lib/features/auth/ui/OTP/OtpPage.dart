import 'package:fitness_app/core/RoutesManager.dart';
import 'package:fitness_app/core/colors_manager.dart';
import 'package:fitness_app/features/auth/Logic/emailensure_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  late final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
    borderRadius: BorderRadius.circular(8),
  );

  late final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: Color.fromRGBO(234, 239, 243, 1),
    ),
  );
  final _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: BlocConsumer<EmailensureCubit, EmailensureState>(
           listener: (context, state) {
             if(state is PhoneOtpcorrect){
               Navigator.pushNamed(context, RoutesManager.resetpassword);
             } else if(state is PhoneOtpWrong) {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Code"),backgroundColor: ColorsManager.red,));
             }
           },
            builder: (context, state) {
              if (state is Emailensureloading) {
                return Center(child: CircularProgressIndicator());
              }
              return Pinput(
                length: 6,
                controller: _pinController,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => context.read<EmailensureCubit>().otpSend(pin),
              );
            },
          ),
        ),
        ],
      ),
    );
  }
}
