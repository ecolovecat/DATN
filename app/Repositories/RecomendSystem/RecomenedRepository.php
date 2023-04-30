<?php

namespace App\Repositories\RecomendSystem;

use App\Repositories\RecomendSystem\RecomendedInterface;

class RecomenedRepository implements RecomendedInterface
{
    // Function to calculate similarity between two users
    function calculateSimilarity($userA, $userB)
    {
        // Count the number of common items
        $numCommonItems = count(array_intersect($userA, $userB));

        // Calculate the similarity score as the Jaccard similarity coefficient
        $similarity = $numCommonItems / (count($userA) + count($userB) - $numCommonItems);

        return $similarity;
    }

    // Function to recommend products based on purchase history of similar users
    function recommendProducts($userId, $pId, $n)
    {
        // fake data
        $users = [
            [
                'id' => 1,
                'purchase_history' => [1, 2, 3, 30, 31],
            ],
            [
                'id' => 2,
                'purchase_history' => [1, 30, 32, 36],
            ],
            [
                'id' => 3,
                'purchase_history' => [31, 32, 35],
            ],
            [
                'id' => 19,
                'purchase_history' => [1, 2, 29],
            ],
            [
                'id' => 20,
                'purchase_history' => [29, 30, 31],
            ],
        ];


        // Get the user's purchase history
        $userPurchaseHistory = null;

        foreach ($users as $user) {
            if ($user['id'] == $userId) {
                $userPurchaseHistory = $user['purchase_history'];
                break;
            }
        }
        $similarUsers = null;

        // Loop through all other users
        foreach ($users as $user) {
            // Skip current user
            if ($user['id'] == $userId) {
                continue;
            }

            // Calculate similarity between users
            $similarity = $this->calculateSimilarity($userPurchaseHistory, $user['purchase_history']);

            // Add to list of similar users
            $similarUsers[$user['id']] = $similarity;
        }

        // Sort similar users by similarity score
        arsort($similarUsers);

        // Get top n similar users
        $topSimilarUsers = array_slice($similarUsers, 0, $n, true);

        // Get products purchased by similar users
        $similarProducts = [];
        foreach ($topSimilarUsers as $similarUserId => $similarity) {
            $purchases = null;

            foreach ($users as $user) {
                if ($user['id'] == $similarUserId) {
                    $purchases = $user['purchase_history'];
                    break;
                }
            }

            foreach ($purchases as $productId) {
                if (!in_array($productId, $userPurchaseHistory) && !isset($similarProducts[$productId])) {
                    $similarProducts[$productId] = 0;
                }
                if (isset($similarProducts[$productId])) {
                    $similarProducts[$productId] += $similarity;
                } else {
                    $similarProducts[$productId] = $similarity;
                }
            }

        }

        // Sort similar products by similarity score
        arsort($similarProducts);


        // Get top n similar products
        $topSimilarProducts = array_slice($similarProducts, 0, $n, true);

        // Get recommended products
        $recommendedProducts = [];
        foreach ($topSimilarProducts as $productId => $similarity) {
            if ($productId == $pId) continue;
            $recommendedProducts[] = $productId;
        }

        return $recommendedProducts;
    }

    // Test the function by recommending 3 products to user with ID 1
    // $userId = 1;
    // $n = 3;
    // $recommendedProducts = recommendProducts($users, $userId, $n);

    // // Print recommended products
    // echo "Recommended products for user with ID $userId:\n";
    // foreach ($recommendedProducts as $product) {
    //   echo "- " . $product['name'] . "\n";
    // }

}
