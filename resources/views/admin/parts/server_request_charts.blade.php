<div class="box box-primary">
    <div class="box-header">
      <i class="fa fa-bar-chart-o"></i>
      <h3 class="box-title">نشاط الموقع</h3>
      <div class="box-tools pull-right">
        
      </div>
    </div>
    <div class="box-body row">
      <div class="col-xl-3 col-lg-4 col-md-4 col-sm-12 col-12">
        <div class="card text-center">
          <div class="card-body">
              <canvas id="gauge1" height="150" width="300"></canvas>
          </div>
          <span class='far fa-chart-bar'></span><span id="gauge1_value">عدد الطلبات المرسلة للخادم أخر 10 دقائق</span>
        </div>
      </div>
      <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
        <div class="card">
            <h3 class="card-header">نشاط الخادم</h3>
            <div class="card-body">
                <div id="sparkline2" class="spark-chart"><canvas width="108" height="50" style="display: inline-block; width: 108px; height: 50px; vertical-align: top;"></canvas></div>
                <div class="spark-chart-info">
                </div>
            </div>
        </div>
    </div>
    </div><!-- /.box-body-->
  </div><!-- /.box -->
  @csrf
</div>