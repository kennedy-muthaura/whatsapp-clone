import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/data/fake_data.dart';
import 'package:whatsappclone/pages/call_info_page.dart';

import '../profile_pic_page.dart';

class CallsPageWidget extends StatelessWidget {
  final VoidCallback moveNextPage;
  final VoidCallback movePreviosPage;

  const CallsPageWidget(
      {Key? key, required this.moveNextPage, required this.movePreviosPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          PhysicalModel(
            color: Colors.white,
            elevation: 2,
            child: ListBody(
              children: [
                ...List.generate(
                    fakeCalls.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            children: [
                              Row(children: [
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Center(
                                          child: Container(
                                            width: 250,
                                            margin: EdgeInsets.only(top: 90),
                                            child: Column(
                                              children: [
                                                GestureDetector(
                                                  onDoubleTap: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProfilePicPage(
                                                                  name: fakeCalls[
                                                                          index]
                                                                      .name,
                                                                  profilePicUrl:
                                                                      fakeCalls[
                                                                              index]
                                                                          .profilePicUrl,
                                                                )));
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 300,
                                                        child: Image.network(
                                                          fakeCalls[index]
                                                              .profilePicUrl,
                                                          fit: BoxFit.cover,
                                                          width: 250,
                                                        ),
                                                      ),
                                                      Positioned(
                                                          top: 0,
                                                          left: 5,
                                                          child: Text(
                                                            fakeCalls[index]
                                                                .name,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 300,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  color: Colors.white,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                        child: Icon(
                                                          Icons.message,
                                                          color: kTealDarkGreen,
                                                          size: 25,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.phone,
                                                        color: kTealDarkGreen,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons.live_tv,
                                                        color: kTealDarkGreen,
                                                        size: 25,
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .notification_important,
                                                        color: kTealDarkGreen,
                                                        size: 25,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        fakeCalls[index].profilePicUrl),
                                    radius: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      splashColor: Colors.grey,
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CallInfoPage()));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            fakeCalls[index].name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Row(
                                            children: [
                                              fakeCalls[index].wasIncoming
                                                  ? Icon(
                                                      Icons.call_received,
                                                      size: 15,
                                                      color: fakeCalls[index]
                                                              .wasReceived
                                                          ? Colors.green
                                                          : Colors.red,
                                                    )
                                                  : Icon(
                                                      Icons
                                                          .call_missed_outgoing,
                                                      size: 15,
                                                      color: Colors.green),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(fakeCalls[index].time),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.call,
                                  color: kTealDarkGreen,
                                )
                              ]),
                              Divider(
                                indent: 30,
                              )
                            ],
                          ),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
