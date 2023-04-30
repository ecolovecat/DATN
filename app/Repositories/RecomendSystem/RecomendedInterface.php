<?php

namespace App\Repositories\RecomendSystem;

interface RecomendedInterface
{
    public function recommendProducts($userId,$pId, $n);
}
