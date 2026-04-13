import 'package:flutter/material.dart';

/// Auth form for Frappe / ERPNext – uses Frappe REST API key authentication.
///
/// Generate keys at: Your ERPNext → Settings → My Account → API Access.
///
/// Credentials collected: url, apiKey, apiSecret.
class FrappeConnectForm extends StatefulWidget {
  final void Function(Map<String, String> credentials) onConnect;

  const FrappeConnectForm({super.key, required this.onConnect});

  @override
  State<FrappeConnectForm> createState() => _FrappeConnectFormState();
}

class _FrappeConnectFormState extends State<FrappeConnectForm> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _apiKeyController = TextEditingController();
  final _apiSecretController = TextEditingController();
  bool _secretVisible = false;

  @override
  void dispose() {
    _urlController.dispose();
    _apiKeyController.dispose();
    _apiSecretController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'In your Frappe/ERPNext instance: Settings → My Account → '
            'API Access → Generate Keys.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _urlController,
            decoration: const InputDecoration(
              labelText: 'Server URL',
              hintText: 'https://mycompany.erpnext.com',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
            validator: _validateUrl,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _apiKeyController,
            decoration: const InputDecoration(
              labelText: 'API Key',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _apiSecretController,
            obscureText: !_secretVisible,
            decoration: InputDecoration(
              labelText: 'API Secret',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                    _secretVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () =>
                    setState(() => _secretVisible = !_secretVisible),
              ),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.business),
            label: const Text('Connect Frappe / ERPNext'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  String? _validateUrl(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    final uri = Uri.tryParse(v.trim());
    if (uri == null || !uri.hasScheme) return 'Enter a valid URL (https://...)';
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConnect({
        'url': _urlController.text.trim(),
        'apiKey': _apiKeyController.text.trim(),
        'apiSecret': _apiSecretController.text.trim(),
      });
    }
  }
}
