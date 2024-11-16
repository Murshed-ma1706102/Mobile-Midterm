import 'package:wanderlist/model/destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wanderlist/providers/destination_provider.dart';

class EditDestinationScreen extends ConsumerStatefulWidget {
  final String destinationId;

  const EditDestinationScreen({super.key, required this.destinationId});

  @override
  ConsumerState<EditDestinationScreen> createState() =>
      _EditDestinationFormState();
}

class _EditDestinationFormState extends ConsumerState<EditDestinationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _visitDateController = TextEditingController();

  String _selectedStatus = 'Not Yet';
  String? _selectedCountry; // Track the selected country
  final List<String> _statuses = ['Visited', 'Not Yet'];

  @override
  Widget build(BuildContext context) {
    return const Text("Edit Destination");
  }
}
