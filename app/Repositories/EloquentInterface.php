<?php

namespace App\Repositories;

interface EloquentInterface
{
    /**
     * Get all
     */
    public function getAll();

    /**
 	 * Get pluck with name and id
     */
    public function getPluck($name, $id);
    
    /**
     * Get one
     */
    public function find($id);


    public function create(array $attributes);

    public function update($id, array $attributes);


    public function delete($id);
}