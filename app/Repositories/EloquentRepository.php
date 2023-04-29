<?php

namespace App\Repositories;

use App\Repositories\EloquentInterface;
use Illuminate\Database\Eloquent\Model;
abstract class EloquentRepository implements EloquentInterface
{
    protected $_model;

    /**
     * EloquentRepository constructor.
     */
    public function __construct()
    {
        $this->setModel();
    }

    /**
     * get model
     */
    abstract public function getModel();

    /**
     * Set model
     */
    public function setModel()
    {
        $this->_model = app()->make(
            $this->getModel()
        );
    }

    /**
     * Get All
     */
    public function getAll()
    {
        return $this->_model::where('is_deleted', 0)->get();
    }

    /**
     * Get pluck with name and id
     */
    public function getPluck($name, $id)
    {
        return $this->_model::where('is_deleted', 0)->get()->pluck($name, $id);
    }
    /**
     * Get one
     */
    public function find($id)
    {
        $result = $this->_model->find($id);

        return $result;
    }

    /**
     * Create
     */
    public function create(array $attributes)
    {
        return $this->_model->create($attributes);
    }

    /**
     * Update
     */
    public function update($id, array $attributes)
    {
        $result = $this->find($id);
        if ($result) {
            $result->update($attributes);
            return $result;
        }

        return false;
    }

    /**
     * Delete
     */
    public function delete($id)
    {
        $result = $this->find($id);
        if ($result) {
            $result->delete();

            return true;
        }

        return false;
    }

}
