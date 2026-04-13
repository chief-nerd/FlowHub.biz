import 'package:flutter/material.dart';

/// Auth form for GitHub – requires a Personal Access Token with
/// `repo` and `read:user` scopes.
class GitHubConnectForm extends StatefulWidget {
  final void Function(Map<String, String> credentials) onConnect;

  const GitHubConnectForm({super.key, required this.onConnect});

  @override
  State<GitHubConnectForm> createState() => _GitHubConnectFormState();
}

class _GitHubConnectFormState extends State<GitHubConnectForm> {
  final _formKey = GlobalKey<FormState>();
  final _tokenController = TextEditingController();
  bool _tokenVisible = false;

  @override
  void dispose() {
    _tokenController.dispose();
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
            'Create a Personal Access Token at github.com/settings/tokens '
            'with repo and read:user scopes.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _tokenController,
            decoration: InputDecoration(
              labelText: 'Personal Access Token',
              hintText: 'ghp_...',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(_tokenVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _tokenVisible = !_tokenVisible),
              ),
            ),
            obscureText: !_tokenVisible,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Token is required' : null,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.code),
            label: const Text('Connect GitHub'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConnect({'token': _tokenController.text.trim()});
    }
  }
}
