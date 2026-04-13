import 'package:flutter/material.dart';

/// Auth form for Microsoft To Do – requires an Azure AD app registration with
/// Microsoft Graph Todo.ReadWrite delegated permission.
///
/// Credentials collected: clientId, tenantId, clientSecret.
/// The actual OAuth redirect is launched via the Sign in button.
class MsTodoConnectForm extends StatefulWidget {
  final void Function(Map<String, String> credentials) onConnect;

  const MsTodoConnectForm({super.key, required this.onConnect});

  @override
  State<MsTodoConnectForm> createState() => _MsTodoConnectFormState();
}

class _MsTodoConnectFormState extends State<MsTodoConnectForm> {
  final _formKey = GlobalKey<FormState>();
  final _clientIdController = TextEditingController();
  final _tenantIdController = TextEditingController();
  final _clientSecretController = TextEditingController();
  bool _secretVisible = false;

  @override
  void dispose() {
    _clientIdController.dispose();
    _tenantIdController.dispose();
    _clientSecretController.dispose();
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
          const _HelpTile(
            icon: Icons.open_in_new,
            text: 'Register an app at portal.azure.com. '
                'Add Delegated permission: Tasks.ReadWrite (Microsoft Graph).',
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _clientIdController,
            decoration: const InputDecoration(
              labelText: 'Application (Client) ID',
              hintText: 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',
              border: OutlineInputBorder(),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _tenantIdController,
            decoration: const InputDecoration(
              labelText: 'Directory (Tenant) ID',
              hintText: 'common  or  xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx',
              border: OutlineInputBorder(),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _clientSecretController,
            obscureText: !_secretVisible,
            decoration: InputDecoration(
              labelText: 'Client Secret',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(_secretVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _secretVisible = !_secretVisible),
              ),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.login),
            label: const Text('Sign in with Microsoft'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF0078D4), // Microsoft blue
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConnect({
        'clientId': _clientIdController.text.trim(),
        'tenantId': _tenantIdController.text.trim(),
        'clientSecret': _clientSecretController.text.trim(),
      });
    }
  }
}

class _HelpTile extends StatelessWidget {
  const _HelpTile({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 6),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
