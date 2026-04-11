import 'package:flutter/material.dart';

class SplitPaneLayout extends StatefulWidget {
  final Widget sidePanel;
  final Widget mainContent;

  const SplitPaneLayout({
    Key? key,
    required this.sidePanel,
    required this.mainContent,
  }) : super(key: key);

  @override
  State<SplitPaneLayout> createState() => _SplitPaneLayoutState();
}

class _SplitPaneLayoutState extends State<SplitPaneLayout> {
  bool _isSidePanelVisible = true;
  final double _sidePanelWidth = 280.0;

  void _toggleSidePanel() {
    setState(() {
      _isSidePanelVisible = !_isSidePanelVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Collapsible Side Panel
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _isSidePanelVisible ? _sidePanelWidth : 0.0,
            child: ClipRect(
              child: widget.sidePanel,
            ),
          ),
          
          // Divider / Toggle Button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _toggleSidePanel,
              child: Container(
                width: 12.0,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Icon(
                    _isSidePanelVisible ? Icons.arrow_left : Icons.arrow_right,
                    size: 12.0,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
          ),
          
          // Main Content
          Expanded(
            child: widget.mainContent,
          ),
        ],
      ),
    );
  }
}
