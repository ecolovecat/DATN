@extends('client.shared.master')
@section('content')
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>{{trans('message.Shop Detail')}}</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">{{trans('message.Shop')}}</a></li>
                    <li class="breadcrumb-item active">{{trans('message.Shop Detail')}} </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Detail  -->
<div class="shop-detail-box-main">
    @if(Session::has('message'))
    <div id="div-alert" class="float-right mt-2 alert alert-success alert-dismissible show" role="alert" style="position: fixed; top: 10px; right: 20px;">
        <strong>{{ Session::get('message') }}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @elseif(Session::has('err'))
    <div id="div-alert" style="position:fixed; right: 10px;" class="float-right mt-2 alert alert-danger alert-dismissible show" role="alert" style="position: absolute;">
        <strong>{{ Session::get('err') }}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <script>
        setTimeout(function() {
            var element = document.getElementById("div-alert");
            element.classList.add("fade");
        }, 2000)
    </script>
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-5 col-md-6">
                <div id="" class="" data-ride="">
                    <div class="card">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="{{asset('images/'.$product->url_image)}}">
                            </div>
                            <div class="carousel-item"> <img class="d-block w-100" src="{{asset('images/'.$product->url_image)}}" alt="Second slide"> </div>
                            <div class="carousel-item"> <img class="d-block w-100" src="{{asset('images/'.$product->url_image)}}" alt="Third slide"> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7 col-md-6">
                <div class="single-product-details">
                    <h2>{{$product->name}}</h2>
                    @if($product->promotion_price != null)
                    <h4> <strike class="text-secondary">₫{{$product->price}}</strike> ₫{{$product->promotion_price}}</h4>
                    @else
                    <h4>{{$product->price}}</h4>
                    @endif

                    <div class="row ml-0">
                        <a class="btn-sm btn-group btn-group-sm btn-info" data-toggle="tooltip" data-placement="top" title="Categorry Name" href="{{url('product-all?category_id='.$category->id)}}">{{$category->name}}</a>

                        <a class="btn-sm btn-group btn-group-sm btn-success ml-1
                        " data-toggle="tooltip" data-placement="top" title="Brand Name" href="{{url('product-all?brand_id='.$brand->id)}}">{{$brand->name}}</a>
                    </div>

                    <h4>{{trans('message.Short Description')}}:</h4>
                    <p>{{$product->detail}}</p>
                    <h4>{{trans('message.Detail')}}:</h4>
                    <p>{!! $product->description !!}</p>
                    <div class="price-box-bar">
                        <div class="cart-and-bay-btn">
                            @if($quantity > 0)
                            <a id="div-cart" class="btn hvr-hover " data-fancybox-close="" href="{{ url('/add-to-cart?product_id='.$product->id.'&quantity=1') }}">{{trans('message.Add to Cart')}}</a>
                            <span class="ml-3">Hàng còn: {{$quantity}}</span>
                            @else
                            <a id="div-cart" class="btn hvr-hover disabled" data-fancybox-close="" href="{{ url('/add-to-cart?product_id='.$product->id.'&quantity=1') }}">{{trans('message.Add to Cart')}}</a>
                            <span class="ml-3 text-danger">Hàng còn: {{$quantity}}</span>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr style="width: 70%; margin-bottom: 2.5rem" />
        <div class="row">
            <div class="col-lg-12">
                <div class="special-menu text-center">
                    <div class="button-group filter-button-group">
                        <button class="active">Sản phẩm tương tự</button>
                    </div>
                </div>
            </div>
            @foreach($combinedProducts as $key => $product)
            <div class="col-lg-3 col-md-6 special-grid top-hot">
                <div class="products-single fix">
                    <div class="card">
                        <div class="box-img-hover">
                            <img src="{{asset('/images/'.$product->url_image)}}" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="{{url('/product-detail?id='.$product->id)}}" data-toggle="tooltip" data-placement="right" title="{{trans('message.View')}}"><i class="fas fa-eye"></i></a></li>
                                </ul>
                                <a class="cart" href="{{ url('/add-to-cart?product_id='.$product->id.'&quantity=1') }}" }}>{{trans('message.Add to Cart')}}</a>
                            </div>
                        </div>
                    </div>
                    <div class="why-text">
                        <h4>
                            <a href="{{url('/product-detail?id='.$product->id)}}">{{ Illuminate\Support\Str::limit($product->name, 25) }}</a>
                        </h4>
                        @if($product->promotion_price != null)
                        <div>
                            <h5 style="float: left;padding-right: 10px;">{{$product->promotion_price}} ₫</h5>
                            <h5 class="text-secondary"> <strike>{{$product->price}}₫</strike></h5>
                        </div>
                        @else
                        <h5>${{$product->price}}</h5>
                        @endif
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
<!-- End Cart -->

@endsection