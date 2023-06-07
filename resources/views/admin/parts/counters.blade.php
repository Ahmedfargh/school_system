<div class="row">
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <i class="fas fa-user-circle"style="color:#000000"></i>

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
              <div class="small-box bg-aqua">
                <div class="inner">
                  <i class="fas fa-user-circle"style="color:#000000"></i>

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
              <div class="small-box bg-aqua">
                <div class="inner">
                  <i class="far fa-building"style="color:#000000"></i>


                  <h3 id="classes_count">{{$statictics["classes_count"]}}</h3>
                  <p>عدد الفصول الدراسية</p>
                </div>
                <div class="icon">
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              @csrf
              <div class="small-box bg-aqua">
                <div class="inner">
                  <i class="fas fa-money-bill-alt"style="color:#000000"></i>

                  <h3 id="student_have_credit">{{$statictics["students_have_credit"]}}</h3>
                  <p>عدد الطلبة الذى لديهم ديون</p>
                </div>
                <div class="icon">
                </div>
                
              </div>
            </div><!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <h3 id="teacher_count">{{$statictics["teacher_count"]}}</h3>
                  <i class="fas fa-user-circle"style="color:#000000"></i>

                  <p>عدد المدرسيين</p>
                </div>
                <div class="icon">
                  <i class="ion ion-pie-graph"></i>
                </div>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                <div class="inner">
                  <i class="fas fa-money-bill-alt"style="color:#000000"></i>
                  <h3 id="teacher_count">{{$statictics["teacher_salary_sum"][0]->total_salary}}</h3>
                  <p> مجموع رواتب المدرسيين</p>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-xs-6">
              <!-- small box -->
              <div class="small-box bg-aqua">
                
                <div class="inner">
                  <i class="fas fa-money-bill-alt"style="color:#000000"></i>
                  <h3 id="teacher_count">{{$statictics["employee_salary_sum"][0]->total_salary}}</h3>
                  <p> مجموع رواتب الموظفيين العاديين</p>
                </div>
                  
              </div>
            </div>
          </div><!-- /.row -->