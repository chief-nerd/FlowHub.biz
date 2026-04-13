import 'package:flutter/material.dart';

/// Auth form for Flagged Emails – connects to any IMAP mailbox.
/// For Gmail: enable IMAP and use an App Password (not your Google password).
///
/// Credentials collected: host, port, email, password.
class FlaggedEmailsConnectForm extends StatefulWidget {
  final void Function(Map<String, String> credentials) onConnect;

  const FlaggedEmailsConnectForm({super.key, required this.onConnect});

  @override
  State<FlaggedEmailsConnectForm> createState() =>
      _FlaggedEmailsConnectFormState();
}

class _FlaggedEmailsConnectFormState extends State<FlaggedEmailsConnectForm> {
  final _formKey = GlobalKey<FormState>();
  final _hostController = TextEditingController(text: 'imap.gmail.com');
  final _portController = TextEditingController(text: '993');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = false;

  static const _presets = {
    'Gmail': ('imap.gmail.com', '993'),
    'Outlook': ('outlook.office365.com', '993'),
    'iCloud': ('imap.mail.me.com', '993'),
    'Custom': ('', ''),
  };

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
            'Connect via IMAP. For Gmail, enable IMAP in settings and use '
            'an App Password instead of your Google account password.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            children: _presets.entries
                .map((e) => ActionChip(
                      label: Text(e.key),
                      onPressed: () {
                        if (e.value.$1.isNotEmpty) {
                          _hostController.text = e.value.$1;
                          _portController.text = e.value.$2;
                        }
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _hostController,
                  decoration: const InputDecoration(
                    labelText: 'IMAP Host',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: TextFormField(
                  controller: _portController,
                  decoration: const InputDecoration(
                    labelText: 'Port',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: 'Password / App Password',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon:
                    Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () =>
                    setState(() => _passwordVisible = !_passwordVisible),
              ),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Required' : null,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: _submit,
            icon: const Icon(Icons.email_outlined),
            label: const Text('Connect IMAP'),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConnect({
        'host': _hostController.text.trim(),
        'port': _portController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
      });
    }
  }
}
