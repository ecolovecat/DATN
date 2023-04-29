<?php
namespace App\Repositories\Brand;

use App\Repositories\EloquentRepository;

class BrandRepository extends EloquentRepository implements BrandInterface
{
    public function getModel()
    {
        return \App\Models\Brand::class;
    }

    public function getTopBrand($top)
    {
        return $this->_model::where('is_deleted', 0)->take($top)->get();
    }
    
}