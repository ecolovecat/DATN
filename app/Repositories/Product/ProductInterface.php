<?php
namespace App\Repositories\Product;

interface ProductInterface
{
    public function getProduct();
    public function getProducts($pIds);
    public function getTopHotProduct($top);
    public function getTopNewProduct($top);
    public function getTopSaleProduct($top);
    public function getTotalProduct();
    public function getByCategoryId($id);
    public function getProductSameCategory($catId, $prodId);
    public function getByBrandId($id);
    public function getByKeyword($keyword);
    public function getByPrice($min, $max);
}
