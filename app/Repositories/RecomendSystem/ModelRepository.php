<?php

namespace App\Repositories\RecomendSystem;

use App\Models\Product;
use App\Models\User;
use App\Repositories\RecomendSystem\RecomendedInterface;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
// use MatrixFactorization;


class ModelRepository implements RecomendedInterface
{
  public function recommendProducts($userId,$pId, $n) {

  }

  public function trainModel()
    {
        // Get the user-item interaction data
        // $data = DB::table('user_item_interactions')->select('*')->get()->toArray();

        // Train the model
        $matrix = new SparseMatrix($data);
        $model = new MatrixFactorization($matrix, $rank = 10, $lambda = 0.01, $numIterations = 10);
        $model->train();

        // Store the model in a file
        $filePath = storage_path('app/recommendation_model.ser');
        file_put_contents($filePath, serialize($model));
    }

    public function getRecommendations(int $userId, int $numRecommendations = 10)
    {
        // Load the model
        $model = $this->loadModel();

        // Get the user-item interaction data
        // $data = DB::table('user_item_interactions')->select('*')->get()->toArray();

        // Normalize the data
        $data = $this->normalizeData($data);

        // Get the user vector
        $userIndex = $userId - 1;
        $userVector = $model->getP($userIndex);

        // Compute the similarity between the user and each item
        $similarityScores = [];
        foreach ($data as $productIndex => $row) {
            $productVector = $model->getQ($productIndex);
            $similarityScore = $this->computeSimilarity($userVector, $productVector);
            $similarityScores[] = [$productIndex, $similarityScore];
        }

        // Sort the products by similarity score
        usort($similarityScores, function($a, $b) {
            return $b[1] - $a[1];
        });

        // Return the top recommended products
        $recommendedProducts = [];
        for ($i = 0; $i < $numRecommendations; $i++) {
            $productIndex = $similarityScores[$i][0];
            $product = $this->getProductById($productIndex + 1);
            $recommendedProducts[] = $product;
        }

        return $recommendedProducts;
    }

    private function loadModel()
    {
        // Load the model from a file
        $filePath = storage_path('app/recommendation_model.ser');
        $model = unserialize(file_get_contents($filePath));

        return $model;
    }

    private function normalizeData($data)
    {
        // Normalize the data
        $numUsers = User::count();
        $numProducts = Product::count();

        $normalizedData = array_fill(0, $numProducts, array_fill(0, $numUsers, 0));
        foreach ($data as $interaction) {
            $userId = $interaction->user_id - 1;
            $productId = $interaction->product_id - 1;
            $rating = $interaction->rating;

            $normalizedData[$productId][$userId] = $rating;
        }
    
        return $normalizedData;
    }
    
    private function computeSimilarity($a, $b)
    {
        // Compute the cosine similarity between two vectors
        $numerator = 0;
        $denominatorA = 0;
        $denominatorB = 0;
    
        for ($i = 0; $i < count($a); $i++) {
            $numerator += $a[$i] * $b[$i];
            $denominatorA += pow($a[$i], 2);
            $denominatorB += pow($b[$i], 2);
        }
    
        $denominator = sqrt($denominatorA) * sqrt($denominatorB);
        $similarity = ($denominator != 0) ? $numerator / $denominator : 0;
    
        return $similarity;
    }
    
    private function getProductById($productId)
    {
        // Get a product by ID
        // return DB::table('products')->where('id', $productId)->first();
    }
}
