import 'package:flutter/material.dart';
import 'package:pharmacy/constants/colors.dart';
import 'package:pharmacy/views/widgets/app_text_field.dart';
import 'package:pharmacy/views/widgets/drop_list.dart';

class DropListSearch extends StatefulWidget {
  final List<String> list;
  final FocusNode textFocusNode;
  final TextEditingController textController;
  final String hint;
  final bool readOnly;
  final bool enabled;

  const DropListSearch({
    super.key,
    required this.list,
    required this.textFocusNode,
    required this.textController,
    this.hint = '',
    this.readOnly = false,
    this.enabled = true,
  });

  @override
  State<DropListSearch> createState() => _DropListSearchState();
}

class _DropListSearchState extends State<DropListSearch> {
  late OverlayEntry _entry;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => initOverlayList());
    textFieldFocusListener();
  }

  void initOverlayList() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offSet = renderBox.localToGlobal(Offset.zero);

    _entry = OverlayEntry(
      builder: (context) => Positioned(
        top: offSet.dy + 49,
        left: offSet.dx + 8,
        height: 150,
        width: renderBox.size.width - 16,
        child: DropList(
          list: widget.list,
          textController: widget.textController,
          textFocusNode: widget.textFocusNode,
        ),
      ),
    );
  }

  void textFieldFocusListener() {
    widget.textFocusNode.addListener(() {
      if (widget.textFocusNode.hasFocus)
        Overlay.of(context).insert(_entry);
      else if (widget.enabled) _entry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 10),
      () => Overlay.of(context).setState(() {}),
    );
    return AppTextField(
      hint: widget.hint,
      focusNode: widget.textFocusNode,
      controller: widget.textController,
      suffixIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: AppColors.blue,
        size: 30,
      ),
      readOnly: widget.readOnly,
      enabled: widget.enabled,
    );
  }
}
