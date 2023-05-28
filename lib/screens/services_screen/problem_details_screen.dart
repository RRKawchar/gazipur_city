import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Container(
        height: 200, // Provide a specific height here
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              endChild: Container(
                constraints: const BoxConstraints(
                  minWidth: 120,
                ),
                color: Colors.lightGreenAccent,
                child: const Center(
                  child: Text(
                    'End Child',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              startChild: Container(
                color: Colors.amberAccent,
                child: const Center(
                  child: Text(
                    'Start Child',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}