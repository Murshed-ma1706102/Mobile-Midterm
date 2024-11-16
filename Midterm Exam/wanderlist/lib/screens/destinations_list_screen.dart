import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderlist/model/destination.dart';
import 'package:wanderlist/providers/destination_provider.dart';
import 'package:wanderlist/routes/app_routes.dart';

class DestinationsListScreen extends ConsumerStatefulWidget {
  const DestinationsListScreen({super.key});

  @override
  ConsumerState<DestinationsListScreen> createState() => _DestinationsListScreenState();
}

class _DestinationsListScreenState extends ConsumerState<DestinationsListScreen> {
  @override
  Widget build(BuildContext context) {

    final destinations = ref.watch(destinationProvider);
    final destination = Destination(
    id: "GC04",
    location: "Grand Canyon",
    description: "A massive natural wonder in Arizona, USA, showcasing awe-inspiring geological formations and breathtaking views. Known for its immense size and intricate layers, it’s a top destination for hiking and nature photography.",
    country: "USA",
    visitDate: DateTime(2023,10,10),
    status: "Visited",
    image: "grand_canyon.jpeg"
      
    );
    return   GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
            ),
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              return DestinationCard(
                destination: destinations[index],
              );
            },
          
        );
      
    
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                'assets/images/${destination.image}',
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(destination.location,
                style: TextStyle(fontSize: 12),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(destination.country,
                    style: TextStyle(fontSize: 12),),

                   Text("${destination.visitDate.year.toString()} - ${destination.visitDate.month.toString()} - ${destination.visitDate.day.toString()}",
                      style: TextStyle(fontSize: 12),),
                  ],
                )
              ],
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                   ElevatedButton(
                  onPressed: () => {
                    context.pushNamed(AppRouter.editDestination.name, pathParameters: {'id': destination.id})
                  }, 
                  child: Text("Edit",
                  style: TextStyle(fontSize: 10),),
                  
                  ),
                
                IconButton(
                onPressed: () => {
                  context.pushNamed(AppRouter.destinationDetail.name, pathParameters: {'id': destination.id})
                }, 
                icon: Icon(Icons.edit)
                )
              ],
            )
        ],
      ),
    );
  }
}


