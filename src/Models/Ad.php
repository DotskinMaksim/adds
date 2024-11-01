<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ad extends Model
{
    // Указываем имя таблицы, если она не соответствует стандарту
    protected $table = 'ads';

    // Указываем, какие поля могут быть массово присвоены
    protected $fillable = [
        'title',
        'description',
        'price',
        'main_image',
        'additional_images',
    ];
}
