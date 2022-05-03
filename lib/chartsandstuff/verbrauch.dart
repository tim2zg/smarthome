import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:smarthome/datalocig/getdata.dart';


class verbruahcdata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return sadfwegs3();
  }

}


class sadfwegs3 extends State<verbruahcdata> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calendar_today), text: "Today"),
              Tab(icon: Icon(Icons.calendar_today_outlined), text: "Week"),
              Tab(icon: Icon(Icons.calendar_today), text: "Month"),
              Tab(icon: Icon(Icons.calendar_today_outlined), text: "Year")
            ],
          ),
          title: const Text('Verbrauch'),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
                future: eigenverbrauchget("1d", "1m"),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done) {
                    return charts.TimeSeriesChart(
                      snapshot.data,
                      animate: true,
                      // Custom renderer configuration for the point series.
                      customSeriesRenderers: [
                        charts.SymbolAnnotationRendererConfig(
                          // ID used to link series to this renderer.
                            customRendererId: 'customSymbolAnnotation')
                      ],
                      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                      // should create the same type of [DateTime] as the data provided. If none
                      // specified, the default creates local date time.
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
            FutureBuilder(
                future: eigenverbrauchget("7d", "10m"),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done) {
                    return charts.TimeSeriesChart(
                      snapshot.data,
                      animate: true,
                      // Custom renderer configuration for the point series.
                      customSeriesRenderers: [
                        charts.SymbolAnnotationRendererConfig(
                          // ID used to link series to this renderer.
                            customRendererId: 'customSymbolAnnotation')
                      ],
                      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                      // should create the same type of [DateTime] as the data provided. If none
                      // specified, the default creates local date time.
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
            FutureBuilder(
                future: eigenverbrauchget("1mo", "30m"),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done) {
                    return charts.TimeSeriesChart(
                      snapshot.data,
                      animate: true,
                      // Custom renderer configuration for the point series.
                      customSeriesRenderers: [
                        charts.SymbolAnnotationRendererConfig(
                          // ID used to link series to this renderer.
                            customRendererId: 'customSymbolAnnotation')
                      ],
                      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                      // should create the same type of [DateTime] as the data provided. If none
                      // specified, the default creates local date time.
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
            FutureBuilder(
                future: eigenverbrauchget("12mo", "6h"),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.connectionState == ConnectionState.done) {
                    return charts.TimeSeriesChart(
                      snapshot.data,
                      animate: true,
                      // Custom renderer configuration for the point series.
                      customSeriesRenderers: [
                        charts.SymbolAnnotationRendererConfig(
                          // ID used to link series to this renderer.
                            customRendererId: 'customSymbolAnnotation')
                      ],
                      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                      // should create the same type of [DateTime] as the data provided. If none
                      // specified, the default creates local date time.
                      dateTimeFactory: const charts.LocalDateTimeFactory(),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
            ),
          ],
        ),
      ),
    );
  }

}
