<div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 id='student_counter'>{{$statictics["student_count"]}}</h3>
                  <p> عدد الطلبة</p>
                </div>
                <div class="icon">
                  <i class="ion ion-bag"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-green">
                <div class="inner">
                  <h3 id="admin_counter">{{$statictics["admin_count"]}}</h3>
                  <p>عدد الأدمنز</p>
                </div>
                <div class="icon">
                  <i class="ion ion-stats-bars"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-yellow">
                <div class="inner">
                  <h3 id="classes_count">{{$statictics["classes_count"]}}</h3>
                  <p>عدد الفصول الدراسية</p>
                </div>
                <div class="icon">
                  <i class="ion ion-person-add"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              @csrf
              <div class="small-box bg-red">
                <div class="inner">
                  <h3 id="student_have_credit">{{$statictics["students_have_credit"]}}</h3>
                  <p>عدد الطلبة الذى لديهم ديون</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-red">
                <div class="inner">
                  <h3 id="teacher_count">{{$statictics["teacher_count"]}}</h3>
                  <p>عدد المدرسيين</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
                
              </div>
            </div><!-- ./col -->
          </div><!-- /.row -->