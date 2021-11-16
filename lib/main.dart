import 'package:flutter/material.dart';
import 'package:tree_node/components/custom_tree_node.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Custom tree view'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({@required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          CustomTreeNode(
            title: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Text('preto'),
              ],
            ),
            color: Colors.black,
            offsetLeft: 0,
            paddingLeft: 0,
            icon: Icon(Icons.arrow_drop_down),
            children: [
              CustomTreeNode(
                title: Row(
                  children: [
                    Icon(Icons.how_to_reg_outlined),
                    SizedBox(width: 5),
                    Text('vermelho'),
                  ],
                ),
                color: Colors.red,
                offsetLeft: 0,
                paddingLeft: 24,
                expaned: true,
                icon: Icon(Icons.arrow_drop_down),
                children: [
                  CustomTreeNode(
                    title: Text('verde'),
                    color: Colors.green,
                    offsetLeft: 0,
                    paddingLeft: 48,
                    icon: Icon(Icons.arrow_drop_down),
                    children: [],
                  ),
                  CustomTreeNode(
                    title: Text('azul'),
                    color: Colors.blue,
                    offsetLeft: 0,
                    paddingLeft: 48,
                    icon: Icon(Icons.arrow_drop_down),
                    children: [
                      CustomTreeNode(
                        title: Text('rosa'),
                        color: Colors.pink,
                        offsetLeft: 0,
                        paddingLeft: 48,
                        icon: Icon(Icons.arrow_drop_down),
                        children: [],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
