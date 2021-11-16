import 'package:flutter/material.dart';
import 'package:flutter_tree/flutter_tree.dart';

class CustomTreeNode extends StatefulWidget {
  final Widget title;
  final Color color;
  final Function() titleOnTap;
  final List<Widget> children;
  final double offsetLeft;
  final double paddingLeft;
  final Widget icon;
  final bool expaned;

  CustomTreeNode({
    @required this.title,
    this.color,
    this.children,
    this.titleOnTap,
    this.offsetLeft,
    this.paddingLeft,
    this.icon,
    this.expaned,
  });

  @override
  _CustomTreeNodeState createState() => _CustomTreeNodeState();
}

class _CustomTreeNodeState extends State<CustomTreeNode> {
  bool isExpanded;
  bool show;
  bool activeTrailling;

  @override
  initState() {
    activeTrailling = false;
    show = false;
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TreeNode(
            leading: GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: widget.paddingLeft),
                child: widget.children.length > 0
                    ? isExpanded
                        ? Icon(Icons.keyboard_arrow_down)
                        : Icon(Icons.keyboard_arrow_right_rounded)
                    : Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.transparent,
                      ),
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
                if (!isExpanded) {
                  setState(() {
                    show = false;
                  });
                }
              },
            ),
            title: widget.title,
            titleOnTap: () {
              setState(() {
                show = !show;
              });
            },
            children: <Widget>[
              show
                  ? Container(
                      margin: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      height: 50,
                      color: widget.color,
                    )
                  : Container(),
              Visibility(
                  visible: isExpanded,
                  child: Column(children: [...widget.children])),
            ],
            offsetLeft: widget.offsetLeft,
            expaned: true,
            trailing: GestureDetector(
              child: Text(''),
              onTap: () {},
            ),
          ),
        ),
      ],
    );
  }
}
