import 'package:flutter/material.dart';
import 'package:test_task/constants/images.dart';
import 'package:test_task/utils/size_config.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xFF0C0C0C), Colors.transparent],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),

            Positioned(
              top: SizeConfig.heightMultiplier * 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'My Store',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontFamily: 'PlayfairDisplay',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: SizeConfig.heightMultiplier * 15,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 10,
                ),
                child: Text(
                  'Hos ass kan du baka tid has nastan alla Sveriges salonger och motagningar. Baka frisor, massage, skonhetsbehandingar, friskvard och mycket mer.',
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
