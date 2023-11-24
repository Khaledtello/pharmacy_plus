import 'package:flutter/material.dart';

class DropList extends StatelessWidget {
  final List<String> list;
  final FocusNode textFocusNode;
  final TextEditingController textController;

  const DropList({
    super.key,
    required this.list,
    required this.textFocusNode,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0, color: Color(0xFF767676)),
            bottom: BorderSide(width: 1.5, color: Color(0xFF767676)),
            right: BorderSide(width: 1.5, color: Color(0xFF767676)),
            left: BorderSide(width: 1.5, color: Color(0xFF767676)),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              textController.text = list[index];
              textFocusNode.unfocus();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    right: 22,
                    left: 22,
                  ),
                  child: Text(
                    list[index],
                    style: const TextStyle(
                      color: Color(0xFF767676),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xFF767676),
                  thickness: 1.5,
                  height: 3,
                  indent: 8,
                  endIndent: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
