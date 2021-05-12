import 'package:flutter/material.dart';
import 'package:mc_replica_app_flutter/constants/colors/colors.dart';
import 'package:mc_replica_app_flutter/ui/views/splash_screen/splash_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
            top: true,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: COLOR_PRIMARY,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/mc.jpg",
                      height: 200,
                    ),
                  ),
                  Positioned(
                      bottom: 30.0,
                      right: 0.0,
                      left: 0.0,
                      child: Center(
                        child: Text("Fast Delivery | Best Offers",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
