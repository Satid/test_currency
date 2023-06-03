import 'package:flutter/material.dart';

import '../../models/currency_model.dart';
import '../../repositories/currency/currency_api.dart';
import '../../view_models/history_view_model.dart';
class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {

  var historyViewModel = HistoryViewModel(currencyRepository: CurrencyAPI());

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
              height: MediaQuery.of(context).size.height - 260,
              margin: EdgeInsets.only(
                  left: 8, top: 8, right: 4, bottom: 8),
              child:
              FutureBuilder<List<CurrencyModel>>(
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
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(25),
                                      side: BorderSide(
                                          width: 0.0,
                                          color: Colors.transparent),
                                    ),
                                    color: Colors.grey,
                                    child: Container(
                                        height: 40,
                                        padding:
                                        const EdgeInsets.all(4),
                                        child: Image.asset(
                                          'assets/images/ic_store.png',
                                        )),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(historyListModel.time.updated,
                                              style: TextStyle(
                                                  color: Color(
                                                      0xff2C4F6B),
                                                  fontSize: 16)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              "ประเภท : " +
                                                  historyListModel.chartName +
                                                  "",
                                              style: TextStyle(
                                                  fontFamily:
                                                  'Prompt',
                                                  color: Color(
                                                      0xff2C4F6B),
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Spacer(),
                                  Container(
                                      margin:
                                      EdgeInsets.only(top: 16),
                                      height: 40,
                                      padding:
                                      const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/ic_next.png',
                                      )),
                                ],
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            // List<LatLng> list = [];
                            // list.add(LatLng(trackingModel.latitude,
                            //     trackingModel.longitude));
                            // Future.delayed(
                            //     Duration(milliseconds: 500),
                            //         () => controllerSingle.animateCamera(
                            //         CameraUpdate.newLatLngBounds(
                            //             boundsFromLatLngList(list),
                            //             50)));

                            //this.dispose();

                            // Future.delayed(
                            //     Duration(milliseconds: 700),
                            //         () => showModalPoiBottom(
                            //         trackingModel));
                            // markerPoiSelect(trackingModel, index);
                          },
                        );
                      },
                      separatorBuilder:
                          (BuildContext context, int index) {
                        return Divider();
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
