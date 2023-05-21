<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class relations extends Model
{
    use HasFactory;
    protected $table="relation";
    protected $primarykey="rel_id";
}
