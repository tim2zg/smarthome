import 'package:flutter/material.dart';
import 'package:smarthome/rooms/timrunner.dart';

class tim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tim",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tim'),
          titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20, fontStyle: FontStyle.italic),
          leading: GestureDetector(
            child: Icon( Icons.arrow_back_ios, color: Colors.black,  ),
            onTap: () {
              Navigator.pop(context);
            } ,
          ) ,
        ),

        body: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.purpleAccent,
                      child: OutlinedButton.icon(
                        icon: Icon(Icons.arrow_upward, size: 18),
                        label: Text('Rauf', style: TextStyle(color: Colors.greenAccent)),
                        onPressed: () {rauf();},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                          overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                          shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                        ),
                      )
                  )
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.purpleAccent,
                      child: OutlinedButton.icon(
                        icon: Icon(Icons.stop, size: 18),
                        label: Text('Stop', style: TextStyle(color: Colors.greenAccent)),
                        onPressed: () {stop();},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                          overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                          shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                        ),
                      )
                  )
              ),
              SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      splashColor: Colors.purpleAccent,
                      child: OutlinedButton.icon(
                        icon: Icon(Icons.arrow_downward, size: 18),
                        label: Text('Runter', style: TextStyle(color: Colors.greenAccent)),
                        onPressed: () {runter();},
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                          overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                          shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                        ),
                      )
                  )
              ),
            ],
          ),
        ),
          SizedBox(height: 30),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: Icon(Icons.lightbulb, size: 18),
                          label: Text('On', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {Lichtein();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: Icon(Icons.lightbulb_outline, size: 18),
                          label: Text('Off', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {Lichtaus();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.timer, size: 18),
                          label: const Text('Clock', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {Uhrein();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.local_fire_department, size: 18),
                          label: const Text('Party', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {party();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.stop_circle, size: 18),
                          label: const Text('Still', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {still();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
                SizedBox(
                    width: 100.0,
                    height: 100.0,
                    child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        splashColor: Colors.purpleAccent,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.local_fire_department, size: 18),
                          label: const Text('Running', style: TextStyle(color: Colors.greenAccent)),
                          onPressed: () {running();},
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                            foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                            overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                            shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                          ),
                        )
                    )
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: 100.0,
              height: 100.0,
              child: ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  splashColor: Colors.purpleAccent,
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.local_fire_department, size: 18),
                    label: const Text('Sweep Random', style: TextStyle(color: Colors.greenAccent)),
                    onPressed: () {wipe();},
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),
                      foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                      overlayColor: MaterialStateProperty.all(Colors.blueGrey),
                      shadowColor: MaterialStateProperty.all(Colors.blueGrey),
                    ),
                  )
              )
          )
        ],),
      ),
    );
  }
}