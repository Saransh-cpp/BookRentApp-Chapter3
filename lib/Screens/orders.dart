import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_rent_app_chapter3/model/order.dart';
import 'package:book_rent_app_chapter3/provider/user.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('$BannerAd failedToLoad: $error');
        },
        onAdOpened: (Ad ad) => debugPrint('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => debugPrint('$BannerAd onAdClosed.'),
      ),
    );

    _bannerAd?.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title:
        const Text(
            "Orders", style: TextStyle(fontSize: 18, color: Colors.black)),
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children:[ ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: userProvider.orders.length,
            itemBuilder: (_, index) {
              OrderModel _order = userProvider.orders[index];
              return ListTile(
                leading: Text(
                  "\$${_order.total}",
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
                title: Text(_order.description),
                subtitle: Text(
                    DateTime.fromMillisecondsSinceEpoch(_order.createdAt)
                        .toString()),
                trailing: Text(_order.status,
                    style: const TextStyle(fontSize: 18, color: Colors.black)),
              );
            }),
          Container(
            alignment: Alignment.center,
            child: AdWidget(ad: _bannerAd!),
            width: _bannerAd?.size.width.toDouble(),
            height: _bannerAd?.size.height.toDouble(),
          )
        ]
      ),
    );
  }
}
