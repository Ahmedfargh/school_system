<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use App\Models\transfereed_log;
class clearLogTable extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:transferLog';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'this command we transfer the log which store the request server every hour';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $group=DB::select("SELECT HOUR(time) as hours_ ,Count(*) as request_count from log GROUP BY HOUR(time) ORDER BY time DESC");
        
        foreach ($group as $key) {
            echo $key->request_count;
            $counter=new transfereed_log;
            $counter->counter=$key->request_count;
            $counter->Save();
        }
        return 0;
    }
}
