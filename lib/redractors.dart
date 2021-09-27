import 'package:flutter/material.dart';
import 'package:kuiz_app/Networking.dart';
import 'package:kuiz_app/dataCollection.dart';
import 'package:kuiz_app/screens/end_screen.dart';
import 'package:provider/provider.dart';

Network network = Network();

class OptionCard extends StatelessWidget {
  final Color colour;
  final String opt;
  final int n;
  OptionCard({@required this.opt, this.colour, this.n});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: FlatButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.zero,
          onPressed: () {
            if (Provider.of<DataCollection>(context, listen: false).enable) {
              Provider.of<DataCollection>(context, listen: false)
                  .optionColor(opt, n);
              Provider.of<DataCollection>(context, listen: false).question();
            }
            if (Provider.of<DataCollection>(context, listen: false).wrong >=
                3) {
              Navigator.pushNamed(context, EndScreen.id,
                  arguments: EndScreen(
                      score: Provider.of<DataCollection>(context, listen: false)
                          .points));
            }
          },
          child: Container(
              child: Center(
                child: Text(
                  opt,
                ),
              ),
              // margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: colour ?? Colors.white,
              )),
        ),
      ),
    );
  }
}
