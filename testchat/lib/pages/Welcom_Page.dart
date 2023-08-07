
import 'package:flutter/material.dart';
import 'package:testchat/pages/login_page.dart';
import 'package:testchat/widgets/custom_button.dart';

class WelcomPage extends StatefulWidget {
  WelcomPage({super.key});
  static String id = 'Welcompage';

  @override
  State<WelcomPage> createState() => _WelcomPageState();
  void Function()? ontap;
}

class _WelcomPageState extends State<WelcomPage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? fadinganimation;

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    fadinganimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    // gotonextpage();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: fadinganimation!,
              child: const Center(
                child: Text(
                  'Welcom To Chat App ',
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                height: 250,
                child: Image.asset(
                  'assets/images/Illustration.png',
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Custombutton(
                  colorbutton: Colors.yellow,
                  onTap: () {
                    Navigator.pushNamed(context, loginPage.id);
                  },
                  text: 'Get Started'),
            )
          ],
        ),
      ),
    );
  }

//   void gotonextpage() {
//     Future.delayed(Duration(seconds: 2 ), () {
//       Navigator.pushNamed(context, loginPage.id );

//     });
//   }
}
