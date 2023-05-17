
import 'package:firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds extends StatefulWidget {
  const GoogleAds({Key? key}) : super(key: key);

  @override
  State<GoogleAds> createState() => _GoogleAdsState();
}

class _GoogleAdsState extends State<GoogleAds> {
  String adUnitId = 'ca-app-pub-3940256099942544/6300978111';
  late BannerAd _bannerAd;
  bool _isLoaded = false;

  void loadAdBanner() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
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
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Initialize the banner ad
    _bannerAd = BannerAd(
      adUnitId: 'your_ad_unit_id',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );

    // Load the banner ad
    _bannerAd.load();
    loadAdBanner();
    print("112121212");
    // loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Banner Ads In ListView"))),
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
      // body: _bannerAd != null?
      // Align(
      //   alignment: Alignment.bottomCenter,
      //   child: SafeArea(
      //     child: SizedBox(
      //       width: _bannerAd!.size.width.toDouble(),
      //       height: _bannerAd!.size.height.toDouble(),
      //       child: AdWidget(ad: _bannerAd!),
      //       // child: AdmobBanner(adUnitId: adUnitId, adSize: AdmobBannerSize.BANNER),
      //     ),
      //   ),
      // ):CircularProgressIndicator()

      // body: ListView.separated(
      //   itemCount: 25,
      //   separatorBuilder: (context, index) {
      //     if ((index + 1) % 4 == 0) {
      //       return Container(
      //         margin: EdgeInsets.all(10),
      //         height: 100,
      //         color: Colors.yellow,
      //         child: StatefulBuilder(builder: (context, setState) {
      //           return  AdmobBanner(adUnitId: adUnitId, adSize: AdmobBannerSize.BANNER);
      //         },)
      //       );
      //     } else {
      //       return Container( );
      //     }
      //   },
      //   itemBuilder: (context, index) {
      //     return Container(
      //       margin: EdgeInsets.all(10),
      //       height: 100,
      //       color: Colors.blue,
      //
      //     );
      //   },
      // ),

    );
  }
}
