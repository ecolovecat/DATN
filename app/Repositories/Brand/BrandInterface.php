<?php
namespace App\Repositories\Brand;

interface BrandInterface
{
    /**
     * Get 5 brand
     */
    public function getTopBrand($top);
}