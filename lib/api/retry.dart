// import 'dart:async';

// Future<Response> retryRequestWithExponentialBackoff(
//     Future<Response> Function() request,
//     {int maxAttempts = 3}) async {
//   const initialDelay = Duration(seconds: 1);
//   var attempt = 0;
//   while (attempt < maxAttempts) {
//     try {
//       return await request();
//     } catch (e) {
//       print('Attempt ${attempt + 1} failed: $e');
//       attempt++;
//       if (attempt < maxAttempts) {
//         final delay = initialDelay * (1 << attempt); // Exponential backoff
//         await Future.delayed(delay);
//       }
//     }
//   }
//   throw Exception('Max retry attempts reached');
// }

// // Example usage:
// void fetchData() async {
//   try {
//     final response = await retryRequestWithExponentialBackoff(() async {
//       // Make API request here
//       return http.get('https://api.example.com/data');
//     });
//     // Process response
//     print('Response: ${response.body}');
//   } catch (e) {
//     // Handle error
//     print('Error: $e');
//   }
// }
