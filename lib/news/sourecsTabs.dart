import 'package:flutter/material.dart';

import 'package:news_app/model/sourcesResponse.dart';
import 'package:news_app/news/sourceTab.dart';

import 'news_list_widgit.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;
  SourcesTabs(this.sources);

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  var selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabs: widget.sources.map((e) {
                    var isSelected = widget.sources.indexOf(e) == selectedTab;
                    return SourceTab(e, isSelected);
                  }).toList()),
              NewsList(widget.sources[selectedTab])
            ],
          )),
    );
  }
}
