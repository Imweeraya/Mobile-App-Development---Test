import 'package:flutter/material.dart';
import 'package:mobile_app_test/features/task_board/presentation/widgets/status_badge.dart';

class ExpandableCard extends StatefulWidget {
  final String title;
  final String status;
  final String description;
  final String goal;

  const ExpandableCard({super.key,
    required this.title,
    required this.status,
    required this.description,
    required this.goal,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> with TickerProviderStateMixin{
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.white,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child:  InkWell(
        customBorder: RoundedRectangleBorder( borderRadius: BorderRadius. circular(18), ),
        onTap: (){
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      buildStatusBadge(widget.status),
                      IconButton(
                        icon: Icon(
                          _isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
             AnimatedCrossFade(
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 2000),
                  reverseDuration: Duration.zero,
                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                secondChild: SizedBox.shrink(),
                firstChild: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description:', style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              widget.description,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Goal:', style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              widget.goal,
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                                      ],
                                    ),
                    )



            ],
          ),
        ),
      ),
    );
  }
}
