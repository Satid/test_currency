
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/posts_view_model.dart';
class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {

  var currencyViewModel = CurrencyViewModel(currencyRepository: CurrencyAPI());
  static const snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
  );
  @override
  void setState(VoidCallback fn) {
     super.setState(fn);
  }

  @pragma('vm:entry-point')
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return Future.value(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currencyViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<CurrencyModel>(
          future: currencyViewModel.fetchAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              if(posts != null){
                return  Text(posts.chartName.toString());

                //return Container();
              }
              return  const Text("");
            }
          },
        ),
      ),
    );
  }
}


