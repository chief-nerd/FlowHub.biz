import 'package:flutter/material.dart';
import '../../shared/constants/layout_constants.dart';

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
  static const double _minWidth = 160.0;
  static const double _maxWidth = 520.0;

  double _panelWidth = LayoutConstants.sidePanelWidth;
  double _widthBeforeCollapse = LayoutConstants.sidePanelWidth;
  bool _isSidePanelVisible = true;
  bool _isDragging = false;

  void _toggleSidePanel() {
    setState(() {
      if (_isSidePanelVisible) {
        _widthBeforeCollapse = _panelWidth;
        _isSidePanelVisible = false;
      } else {
        _panelWidth = _widthBeforeCollapse;
        _isSidePanelVisible = true;
      }
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _panelWidth = (_panelWidth + details.delta.dx).clamp(_minWidth, _maxWidth);
      _isSidePanelVisible = true;
    });
  }

  void _onDragStart(DragStartDetails _) {
    setState(() => _isDragging = true);
  }

  void _onDragEnd(DragEndDetails _) {
    setState(() => _isDragging = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Collapsible / resizable side panel
          AnimatedContainer(
            duration: _isDragging
                ? Duration.zero
                : const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _isSidePanelVisible ? _panelWidth : 0.0,
            child: ClipRect(child: widget.sidePanel),
          ),

          // Drag handle / toggle button
          GestureDetector(
            onTap: _toggleSidePanel,
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeColumn,
              child: Container(
                width: LayoutConstants.gridDividerWidth,
                decoration: BoxDecoration(
                  color: _isDragging
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.12)
                      : null,
                  border: Border(
                    right: BorderSide(
                      color: _isDragging
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).dividerColor,
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

          // Main content
          Expanded(child: widget.mainContent),
        ],
      ),
    );
  }
}
