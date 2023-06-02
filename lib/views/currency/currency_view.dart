
import 'package:flutter/material.dart';

import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/posts_view_model.dart';
class CurrencyView extends StatefulWidget {
  const CurrencyView({Key? key}) : super(key: key);

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {

  var postsViewModel = CurrencyViewModel(currencyRepository: CurrencyAPI());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder<CurrencyModel>(
          future: postsViewModel.fetchAllPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var posts = snapshot.data;
              if(posts != null){
                return  Text(posts.chartName.toString());
              }
              return  Text("");
            }
          },
        ),
      ),
    );
  }
}


