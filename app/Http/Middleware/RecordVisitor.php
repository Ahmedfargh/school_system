<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\log;
class RecordVisitor
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $logOject=new log;
        $logOject->Remote_ip=$_SERVER['REMOTE_ADDR'];
        $logOject->ReuqestUrl=$_SERVER['REQUEST_URI'];
        $logOject->save();   
        return $next($request);
    }
}
