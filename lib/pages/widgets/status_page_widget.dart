import 'package:flutter/material.dart';
import 'package:whatsappclone/constants.dart';

class StatusPageWidget extends StatelessWidget {
  final VoidCallback moveNextPage;
  final VoidCallback movePreviosPage;

  const StatusPageWidget(
      {Key? key, required this.moveNextPage, required this.movePreviosPage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          GestureDetector(
            onDoubleTap: () {
              movePreviosPage();
            },
            onTap: () {
              moveNextPage();
            },
            child: PhysicalModel(
              color: Colors.white,
              elevation: 0.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.grey.shade300,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: kLightGreen,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Status',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Tap to add status update',
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Viewed updates',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 12,
                  fontWeight: FontWeight.w900),
            ),
          ),
          PhysicalModel(
            color: Colors.white,
            elevation: 2,
            child: ListBody(
              children: [
                ...List.generate(
                    10,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Column(
                            children: [
                              Row(children: [
                                CircleAvatar(
                                  backgroundColor: Colors.teal,
                                  radius: 25,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'person name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text('Today 13:18'),
                                  ],
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
