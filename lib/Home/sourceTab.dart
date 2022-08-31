import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/model/sourcesResponse.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selected;
  SourceTab(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(24),
          color:
              selected ? Theme.of(context).primaryColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            color: selected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
