import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pomodoro/Dbclass/pomodoro.dart';
import 'package:pomodoro/Dbclass/pomodoroDao.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:provider/provider.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  Future<List<Pomodoro>> allData(BuildContext context) async {
    var provider = Provider.of<PomodoroDao>(context, listen: false);

    var a = await provider.getAllData();
    setState(() {});
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => kdefaultAlertAlldata(context),
              );
            },
            icon: Icon(Icons.delete),
          ),
          SizedBox(
            width: 20,
          ),
        ],
        title: const Text(
          "Data",
          style: kDefTextStyle,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: allData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return Center(child: Text("Empty"));
          } else {
            var a = snapshot.data;

            return Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        //! We can delete a data with this Container
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 150,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      kdefaultAlert(context, a[index].id),
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            defColumn("Date", "${a[index].date}"),
                            defColumn("hour", "${a[index].hour}"),
                            defColumn("Minute", "${a[index].minute}"),
                            defColumn("Second", "${a[index].second}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: a!.length,
              ),
            );
          }
        },
      ),
    );
  }

  Padding defColumn(String a, String b) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            a,
            style: kDefTextStyleData,
          ),
          Text(
            b,
            style: kDefTextStyleData,
          ),
        ],
      ),
    );
  }
}
