import 'package:flutter/material.dart';

class Configurator extends StatefulWidget {
  const Configurator({super.key});

  @override
  State<Configurator> createState() => _ConfiguratorState();
}

class _ConfiguratorState extends State<Configurator> {
  double _width = 100.0;
  double _height = 100.0;
  double _topRightRadius = 0.0;

  void _onChangeWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  void _onChangeHeight(double value) {
    setState(() {
      _height = value;
    });
  }

  void _onChangeTopRightRadius(double value) {
    setState(() {
      _topRightRadius = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Width: "),
              Text(_width.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Slider(
            value: _width,
            min: 1,
            max: 100,
            onChanged: _onChangeWidth,
          ),
          Row(
            children: [
              const Text("Height: "),
              Text(_height.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Slider(
            value: _height,
            min: 1,
            max: 100,
            onChanged: _onChangeHeight,
          ),
          Row(
            children: [
              const Text("Top Right Radius: "),
              Text(_topRightRadius.toStringAsFixed(2), style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Slider(
            value: _topRightRadius,
            min: 0,
            max: 100,
            onChanged: _onChangeTopRightRadius,
          ),
          Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(_topRightRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Container Configurator')),
      body: const Configurator(),
    ),
  ));
}
