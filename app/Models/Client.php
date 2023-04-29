<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Client extends Authenticatable
{
    use Notifiable;

    protected $table = "users";
    protected $guarded = ['id'];
    protected $timestrap = true; 
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
}
