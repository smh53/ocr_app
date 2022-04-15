import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad_helper.dart';
import '../constants/constants.dart';
import '../reusable_widgets/gradient_button.dart';
import '../services/copy_to_clipboard.dart';
import '../services/send_as_pdf.dart';
import 'package:ocr_app/services/image_to_text.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<InitializationStatus> _initGoogleMobileAds() {
  return MobileAds.instance.initialize();
}

late BannerAd _bannerAd;
bool _isBannerAdReady = false;
late BannerAd _bannerAd2;
bool _isBannerAdReady2 = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    initializeGoogleAds();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isBannerAdReady = true;
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd2 = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId2,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          _isBannerAdReady2 = true;
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady2 = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    _bannerAd2.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _bannerAd2.dispose();
    super.dispose();
  }

  String text = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tav OCR'),
            centerTitle: true,
          ),
          body: Builder(
            builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_isBannerAdReady)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: _bannerAd.size.width.toDouble(),
                        height: _bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd),
                      ),
                    ),
                  Expanded(
                    child: SelectableText(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  if (_isBannerAdReady2)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: _bannerAd.size.width.toDouble(),
                        height: _bannerAd.size.height.toDouble(),
                        child: AdWidget(ad: _bannerAd2),
                      ),
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: GradientButton(
                          onPressed: () async {
                            text = await imageToText();
                            setState(() {});
                          },
                          buttonName: "Resim Seç",
                          darkColor: defaultGradientButtonDarkColor,
                          lightcolor: defaultGradientButtonLightColor,
                          height: 50.0,
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: text == "" ? false : true,
                          child: GradientButton(
                              onPressed: () {
                                copyToClipboard(context, text);
                              },
                              buttonName: "Yazıyı Kopyala",
                              darkColor: defaultGradientButtonDarkColor,
                              lightcolor: defaultGradientButtonLightColor,
                              height: 50.0),
                        ),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: text == "" ? false : true,
                          child: GradientButton(
                              onPressed: () {
                                sendAsPdf(text);
                              },
                              buttonName: "PDF olarak gönder",
                              darkColor: defaultGradientButtonDarkColor,
                              lightcolor: defaultGradientButtonLightColor,
                              height: 50.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void initializeGoogleAds() async {
    await _initGoogleMobileAds();
  }
}
