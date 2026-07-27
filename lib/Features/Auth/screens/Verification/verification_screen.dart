import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orbitask/Features/Home/home_page.dart';
import 'package:orbitask/constants/app_fonts.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text('Confirm Verification Code', style: textTheme.displayMedium),
              Text(
                'Please enter the confirmation code sent to email or phone to proceed.',
                //text span here & be able to change to which ever verification method was chosen
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: false, last: true),
                ],
              ),

              SizedBox(height: 32),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          firstName:
                              FirebaseAuth.instance.currentUser?.displayName
                                  ?.split(' ')
                                  .first ??
                              'User',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Verify Code',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: AppFonts.semibold,
                      color: colorScheme.surface,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: 'Didn\'t receive code?',
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: ' Resend.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: AppFonts.semibold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VerificationInputBox extends StatelessWidget {
  final bool first;
  final bool last;

  const _VerificationInputBox({required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 52,
      height: 52,
      child: TextFormField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        autofocus: first,
        showCursor: false,
        readOnly: false,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          fontWeight: AppFonts.medium,
          color: colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(vertical: 16),
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
              //width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.secondary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: colorScheme.error),
          ),
        ),
      ),
    );
  }
}
