import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlist/providers/destination_provider.dart';

class DestinationDetailScreen extends ConsumerStatefulWidget {
  final destinationId;
  const DestinationDetailScreen({super.key, required this.destinationId});

  @override
  ConsumerState<DestinationDetailScreen> createState() => _DestinationDetailScreenState();
}

class _DestinationDetailScreenState extends ConsumerState<DestinationDetailScreen> {
  @override
  Widget build(BuildContext context) {

    final destination = ref.watch(destinationProvider.notifier).getDestinationById(widget.destinationId);
    final year = destination.visitDate.year.toString();
    final month = destination.visitDate.month.toString();
    final day = destination.visitDate.day.toString();
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(destination.location, style: TextStyle(fontSize: 30),),
               ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      'assets/images/${destination.image}',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
               
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destination.location, style: TextStyle(fontSize: 20),),
                Text(destination.country,
                style: TextStyle(color: const Color.fromARGB(255, 102, 98, 97)),),
                Text("Visit date:  ${year} - ${month} - ${day}"),
                
                if(destination.status == "Visited")
                  Text("Status: Visited", style: TextStyle(color: Colors.green),)
                else
                  Text("Status: Not Yet", style: TextStyle(color: Colors.red),)
                
                ,Text("Description", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(destination.description)
                
              ],
            )
        ],
      ),
      
    );
  }
}