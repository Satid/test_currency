import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/history_view_model.dart';

import 'package:html/dom.dart' as htmlParser;

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  var historyViewModel = HistoryViewModel();
  var format = NumberFormat("###,###,###.000", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(historyViewModel.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - (AppBar().preferredSize.height + 100),
              margin: EdgeInsets.only(left: 8, top: 8, right: 4, bottom: 8),
              child: FutureBuilder<List<CurrencyModel>>(
                future: historyViewModel.fetchAllHistory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CurrencyModel> list = snapshot.data!;
                    // if (filterPoi != "") {
                    //   list = snapshot.data!
                    //       .where((o) => o.poiName.contains(filterPoi))
                    //       .toList();
                    // }
                    return ListView.separated(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        CurrencyModel historyListModel = list[index];

                        return ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              "Update : ${historyListModel.time.updated}",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              "${historyListModel.bpi.usd.code} : ${format.format(historyListModel.bpi.usd.rateFloat)} ${htmlParser.DocumentFragment.html(historyListModel.bpi.usd.symbol).outerHtml}",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              "${historyListModel.bpi.gbp.code} : ${format.format(historyListModel.bpi.gbp.rateFloat)} ${htmlParser.DocumentFragment.html(historyListModel.bpi.gbp.symbol).outerHtml}",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              "${historyListModel.bpi.eur.code} : ${format.format(historyListModel.bpi.eur.rateFloat)} ${htmlParser.DocumentFragment.html(historyListModel.bpi.eur.symbol).outerHtml}",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider();
                      },
                    );
                  }

                  // else {
                  //   return Container(
                  //     child: Image.asset('assets/images/ic_no_data.png',
                  //         height: 50, width: 50, fit: BoxFit.fitWidth),
                  //   );
                  // }

                  return Center(
                      child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                    ),
                  ));
                  // return Container( );
                  // return Container(
                  //   child: Image.asset('assets/images/ic_no_data.png',
                  //       height: 50, width: 50, fit: BoxFit.fitWidth),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
