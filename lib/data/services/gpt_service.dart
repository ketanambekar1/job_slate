import 'dart:convert';
import 'package:http/http.dart' as http;

class GPTService {
  static const _apiKey = 'YOUR_OPENAI_API_KEY';
  static const _endpoint = 'https://api.openai.com/v1/chat/completions';

  static Future<String> generateCoverLetter({
    required String name,
    required String jobTitle,
    required String company,
  }) async {
    final prompt = '''
Write a professional cover letter for the following:

Name: $name
Position: $jobTitle
Company: $company

Make it job-specific, concise, and formal.
''';

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": "gpt-4",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "max_tokens": 500,
        "temperature": 0.7,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('GPT Error: ${response.body}');
    }
  }
}
