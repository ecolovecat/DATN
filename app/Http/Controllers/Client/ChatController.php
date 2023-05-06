<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

use GuzzleHttp\Client;
use GuzzleHttp\Promise;

class ChatController extends Controller
{
    //
    public function converse(Request $request)
    {
        $input = $request->input('message');

        // Prepend "I want to" to the user's input
        $prompt = "Tôi muốn tìm một cuốn sách về " . $input;

        // Create a new Guzzle HTTP client
        $client = new Client([
            'base_uri' => 'https://api.openai.com/v1/engines/text-davinci-003/',
            'headers' => [
                'Authorization' => 'Bearer ' . env('OPENAI_API_KEY'),
                'Content-Type' => 'application/json',
            ],
        ]);

        // Create a new request with the prompt and other parameters
        $request = [
            'json' => [
                'prompt' => $prompt,
                'max_tokens' => 100,
                'temperature' => 0.5,
                'n' => 1,
                'stop' => ['\n'],
            ],
        ];

        // Send the request asynchronously using Guzzle's Promise API
        $promise = $client->postAsync('completions', $request);

        // Wait for the response and handle any errors
        try {
            $response = $promise->wait();
            $message = json_decode($response->getBody()->getContents(), true)['choices'][0]['text'];
        } catch (\GuzzleHttp\Exception\RequestException $e) {
            $message = $e->getMessage();
        }

        return response()->json(['message' => $message]);
    }
}
