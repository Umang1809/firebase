import 'dart:io';

import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds2 extends StatefulWidget {
  const GoogleAds2({Key? key}) : super(key: key);

  @override
  State<GoogleAds2> createState() => _GoogleAds2State();
}

class _GoogleAds2State extends State<GoogleAds2> {
int counter=0;
  BannerAd? _bannerAd4;
InterstitialAd? _interstitialAd;
  bool _isLoaded = false;

  final adUnitId =
       'ca-app-pub-3940256099942544/6300978111';
final adinterunit = 'ca-app-pub-3940256099942544/1033173712';


  AdWidget loadAdBanner() {
    _bannerAd4 = BannerAd(
      adUnitId: adUnitId,
      request:  AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();

    return AdWidget(ad: _bannerAd4!);

  }
void loadAdInter() {

  InterstitialAd.load(
      adUnitId: adinterunit,
      request:  AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(

            // Called when the ad showed the full screen content.
              onAdShowedFullScreenContent: (ad) {},
              // Called when an impression occurs on the ad.
              onAdImpression: (ad) {},
              // Called when the ad failed to show full screen content.
              onAdFailedToShowFullScreenContent: (ad, err) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when the ad dismissed full screen content.
              onAdDismissedFullScreenContent: (ad) {
                // Dispose the ad here to free resources.
                ad.dispose();
              },
              // Called when a click is recorded for an ad.
              onAdClicked: (ad) {});

          print('====$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          setState(() {
            _interstitialAd = ad;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ));
}
// void loadAdInter() {
//   InterstitialAd.load(
//       adUnitId: adinterunit,
//       request:  AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         // Called when an ad is successfully received.
//         onAdLoaded: (ad) {
//           ad.fullScreenContentCallback = FullScreenContentCallback(
//             // Called when the ad showed the full screen content.
//               onAdShowedFullScreenContent: (ad) {
//                 loadAdInter();
//               },
//               // Called when an impression occurs on the ad.
//               onAdImpression: (ad) {},
//               // Called when the ad failed to show full screen content.
//               onAdFailedToShowFullScreenContent: (ad, err) {
//                 // Dispose the ad here to free resources.
//                 ad.dispose();
//               },
//               // Called when the ad dismissed full screen content.
//               onAdDismissedFullScreenContent: (ad) {
//                 // Dispose the ad here to free resources.
//                 ad.dispose();
//               },
//               // Called when a click is recorded for an ad.
//               onAdClicked: (ad) {});
//
//           debugPrint('$ad loaded.');
//           // Keep a reference to the ad so you can show it later.
//           setState(() {
//             _interstitialAd = ad;
//           });
//         },
//         // Called when an ad request failed.
//         onAdFailedToLoad: (LoadAdError error) {
//           debugPrint('InterstitialAd failed to load: $error');
//         },
//       ));
// }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAdBanner();
    loadAdInter();
    print("84488484844");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Banner Ads In ListView")),

      //     actions: [TextButton(onPressed: () {
      //   if (_interstitialAd != null) {
      //     _interstitialAd!.show();
      //     print("51516516156156");
      //   }
      // }, child: Text("Adds"))],

          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return home();
            },
          ));
        },
        elevation: 50,
        child: Icon(Icons.home),
      ),
      // body: _isLoaded
      //     ? Align(
      //     alignment: Alignment.bottomCenter,
      //     child: SafeArea(
      //       child: SizedBox(
      //         width: _bannerAd!.size.width.toDouble(),
      //         height: _bannerAd!.size.height.toDouble(),
      //         child: AdWidget(ad: _bannerAd!),
      //       ),
      //     ))
      //     : Center(child: CircularProgressIndicator()),

      body: ListView.builder(
      itemCount: 20,
      // separatorBuilder: (context, index) {
      //   if ((index + 1) % 4 == 0) {
      //     return Container(
      //       margin: EdgeInsets.all(10),
      //       height: 100,
      //       color: Colors.yellow,
      //       child: AdWidget(ad: _bannerAd4!,)
      //     );
      //   } else {
      //     return Container( );
      //   }
      // },
        itemBuilder: (context, index) {
          return (index+1) % 4 == 0 ?
             Container(
               margin: EdgeInsets.all(10),
              height: 50,
              color: Colors.amber,
               child:loadAdBanner(),
            )
          :
             InkWell(
               onTap: () {
                 setState(() {
                   counter++;
                 });
                 if(counter%3==0)
                   {
                     print("213221321321");

                     if (_interstitialAd != null) {
                       _interstitialAd!.show();
                       print("51516516156156");
                     }
                   }
               },
               child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                color: Colors.deepOrange,
                 child: Center(child: Text("$index")),
            ),
             );

        },
    ),
    );
  }
  showAdd(){
    return AdWidget(ad: _bannerAd4!);
  }
}
