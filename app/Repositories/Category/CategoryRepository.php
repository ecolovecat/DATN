<?php
namespace App\Repositories\Category;

use App\Repositories\EloquentRepository;

class CategoryRepository extends EloquentRepository implements CategoryInterface
{
    public function getModel()
    {
        return \App\Models\ProductCategory::class;
    }

    public function getCategory()
    {
        return $this->_model::take(5)->get();
    }
    
}