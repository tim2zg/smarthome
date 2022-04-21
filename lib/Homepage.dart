import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:smarthome/rooms/tim.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
        header: PageHeader(title: Text("Smart Home")),
        padding: const EdgeInsets.all(10),
        content: material.GridView(
          gridDelegate: const material.SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 270,
              mainAxisExtent: 290,
              mainAxisSpacing: 10,
              childAspectRatio: (10/10),
              crossAxisSpacing: 10),
          padding: const material.EdgeInsets.all(16),
          children: <Widget>[
            material.ButtonTheme(
              child: material.OutlinedButton(
                style: material.ButtonStyle(
                    shape: material.MaterialStateProperty.all<RoundedRectangleBorder>(
                      material.RoundedRectangleBorder(
                        borderRadius: material.BorderRadius.circular(20.0),
                        side: material.BorderSide(width: 7, color: Colors.blue),
                      ),
                    ),side: material.MaterialStateProperty.all(BorderSide(width: 2.0, color: Colors.white))
                ),
                onPressed: () => {},
                child: material.Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    material.Icon(material.Icons.home, color: Colors.white, size: 80),
                    material.SizedBox(height:  5),
                    material.FittedBox(
                      fit: BoxFit.fitWidth,
                      child: material.Text('Reddit', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                  ],
                ),
              ),),material.ButtonTheme(
              child: material.OutlinedButton(
                style: material.ButtonStyle(
                    shape: material.MaterialStateProperty.all<RoundedRectangleBorder>(
                      material.RoundedRectangleBorder(
                        borderRadius: material.BorderRadius.circular(20.0),
                        side: material.BorderSide(width: 7, color: Colors.blue),
                      ),
                    ),side: material.MaterialStateProperty.all(BorderSide(width: 2.0, color: Colors.white))
                ),
                onPressed: () => {Navigator.push(
                context,
                material.MaterialPageRoute(builder: (context) => tim()),
                )},
                child: material.Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    material.Icon(material.Icons.home, color: Colors.white, size: 80),
                    material.SizedBox(height:  5),
                    material.FittedBox(
                      fit: BoxFit.fitWidth,
                      child: material.Text('Tim', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                  ],
                ),
              ),),
          ],
        )
    );
  }
}
