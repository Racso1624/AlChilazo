import 'package:al_chilazo/widgets/list_vie.dart';
import 'package:al_chilazo/widgets/navigate.dart';
import 'package:flutter/material.dart';

import '../widgets/carousel.dart';
import '../widgets/cartas.dart';
import '../widgets/drawer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4338CA),
      appBar: AppBar(
        title: const Text("Al Chilazo"),
      ),
      drawer: DrawerFb1(),
      extendBody: true,
      bottomNavigationBar: const BottomNavBarRaisedInsetFb1(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            Container(
              height: 240,
              child: CustomCarouselFB2(),
            ),
            const Divider(height: 1, color: Colors.white),
            Container(
              child: CategoriesListMallika1(),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white60,
              ),
              height: 400,
              child: SocialPictureGroup(
                title: "Problemas",
                imgUrl:
                    'https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/malika%2FcurryImage.png?alt=media&token=904f3d02-c37e-4e75-99ef-91be24d018af',
                onTap: () {},
                color: Colors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
