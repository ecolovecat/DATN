<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Repositories\Brand\BrandInterface;
use App\Repositories\Category\CategoryInterface;
use App\Repositories\Product\ProductInterface;
use App\Repositories\RecomendSystem\RecomendedInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    private $productRepository;
    private $categoryRepository;
    private $brandRepository;
    private $recomendedRepository;
    public function __construct(ProductInterface $productRepos, CategoryInterface $categoryRepos, BrandInterface $brandRepos, RecomendedInterface $recomendedRepos)
    {
        $this->productRepository = $productRepos;
        $this->categoryRepository = $categoryRepos;
        $this->brandRepository = $brandRepos;
        $this->recomendedRepository = $recomendedRepos;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $products = $this->productRepository->getAll();
        $categories = $this->categoryRepository->getAll();
        $brands = $this->brandRepository->getAll();
        if ($request->category_id){
            $products = $this->productRepository->getByCategoryId($request->category_id);
        }
        if ($request->brand_id){
            $products = $this->productRepository->getByBrandId($request->brand_id);
        }
        if($request->keyword){
            $products = $this->productRepository->getByKeyword($request->keyword);
        }
        if($request->min_price || $request->max_price){
            $products = $this->productRepository->getByPrice($request->min_price, $request->max_price);
        }
        return view('client.layouts.products', compact('products', 'categories', 'brands'));
    }

    public function product_detail(Request $request)
    {
        $userId = Auth::user();
        $suggest = $this->recomendedRepository->recommendProducts($userId->id,$request->id, 3);
        $product = $this->productRepository->find($request->id);
        $suggestProduct = $this->productRepository->getProducts($suggest);
        $productsInCategory = $this->productRepository->getProductSameCategory($product->category_id, $request->id);
        $combinedProducts = $productsInCategory->merge($suggestProduct)->unique('id');
        $category = $this->categoryRepository->find($product->category_id);
        $brand = $this->brandRepository->find($product->brand_id);
        $quantity = $product->quantity;
        return view('client.layouts.product_detail', compact('product', 'category', 'brand', 'quantity', 'combinedProducts'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
