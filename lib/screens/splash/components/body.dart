import 'package:connectivity/connectivity.dart';
import 'package:firefluth/components/default_button.dart';
import 'package:firefluth/constants.dart';
import 'package:firefluth/models/user.dart';

import 'package:firefluth/screens/home/my_home_screen.dart';
import 'package:firefluth/screens/sign_in/sign_in_screen.dart';
import 'package:firefluth/screens/splash/components/splash_content.dart';
import 'package:firefluth/services/Auth/auth.dart';
import 'package:firefluth/services/PusherWebSockets/pusher.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';




class SplashScreenBody extends StatefulWidget {
  @override
  _SplashScreenBodyState createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  /// Authenticate Service Instance
  AuthService authService = AuthService();
  PusherService pusherService = PusherService();


  bool loading = false;
  int currentPage = 0;
  List<Map> splashData = [
    {
      "text": "Congestion Avoidance Intelligent Routing System",
      "image": "assets/images/splash-1.png",
    },
    {
      "text": "Congestion Avoidance Intelligent Routing System",
      "image": "assets/images/splash-1.png",
    },
    {
      "text": "Congestion Avoidance Intelligent Routing System",
      "image": "assets/images/splash-1.png",
    },
  ];


  @override
  Widget build(BuildContext context) {

    /// User Model from Provider
    final User user_profile = Provider.of<User>(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"],
                  image: splashData[index]["image"], key: Key('SplashContent1'),
                ),
                onPageChanged: (value){
                  setState(() {
                    currentPage = value;
                  });
                },
              ),

            ),

            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: loading ?
                      SpinKitPulse(
                        color: kPrimaryLightColor,
                        size: 50.0,
                      )
                      :DefaultButton(
                          text: 'Get Start',
                          pressed: () async {

                            var connectivityResult = await Connectivity().checkConnectivity();
                            if (connectivityResult != ConnectivityResult.none) {
                              // I am not connected to wifi network
                              setState(() {
                                loading = true;
                              });
                              /// fetch user profile
                              Map<String, dynamic>? user = await authService.fetchUserProfile();
                              if(user == null){
                                /// this means maybe user is not logged in SO,
                                /// double check by resting the preferences values
                                await authService.unsetLogInPref();
                                /// Navigate to Login Screen
                                Navigator.pushNamed(context, SignInScreen.routeName);
                              }else{
                                /// Then the request succeed and the user is logged in SO,
                                /// First of all update the Users Model
                                user_profile.user_id        = user['id'];
                                user_profile.name           = user['name'];
                                user_profile.email          = user['email'];
                                user_profile.country        = user['country'];
                                user_profile.city           = user['city'];
                                user_profile.phone          = user['phone'];
                                user_profile.profilePicture = user['profile_picture'];

                                /// maybe i shall use it with private channel later
                                String? accessToken = await authService.getAccessTokenFromPref();
                                print("AccessToken-PusherAuth:"+accessToken!);

                                /// Init Pusher Listener
                                LaravelFlutterPusher pusher = pusherService.initPusher(PusherKey, PusherHost, PusherPort, PusherCluster);

                                /// Subscribe to Channel
                                pusherService.listen(pusher, 'test-channel-'+user_profile.user_id.toString(), 'test-event');

                                /// Navigate to My Courses Screen
                                Navigator.pushNamed(context, MyHomeScreen.routeName);

                              }

                              setState(() {
                                loading = false;
                              });

                              // String access_token = await authService.getAccessTokenFromPref() ?? '';
                              // print('Access-Token: ${access_token}');
                            }else{
                              Fluttertoast.showToast(
                                msg: 'Check your internet connection.',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.amber,
                                textColor: Colors.white,
                              );
                            }



                          }, key: Key('GetStartKey'),
                      ),
                    ),
                    Spacer(),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(

      curve: Curves.fastOutSlowIn,
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20:6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryLightColor: kSecondaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

}




