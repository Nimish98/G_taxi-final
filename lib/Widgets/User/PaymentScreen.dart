import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:trackingapp/Widgets/User/GlobalVariables.dart';
import 'package:trackingapp/Widgets/User/SnackBar.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = "PaymentPage";
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Razorpay Sample App'),
        ),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(onPressed: openCheckout, child: Text('Open'))
                ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 1000,
      'name': 'G-TAXI',
      'description': 'Trip amount from',
      'prefill': {'contact': '${currentUserInfo.phoneNumber}', 'email': '${currentUserInfo.email}','name': '${currentUserInfo.name}',},
      'external': {
        'wallets': ['paytm']
      },
    "image": "images/logo.png",
      "theme": {
        "color": "#40CF89"
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    rootScaffoldMessengerKey.currentState.showSnackBar(
        showSnackBar("SUCCESS: " + response.paymentId, context));
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    rootScaffoldMessengerKey.currentState.showSnackBar(
        showSnackBar("ERROR: " + response.code.toString() + " - " + response.message, context));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    rootScaffoldMessengerKey.currentState.showSnackBar(
        showSnackBar("EXTERNAL_WALLET: " + response.walletName, context));
  }
}