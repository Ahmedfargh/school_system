@include('admin/header')
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      
      
        @include('admin/parts/nav_header')
        <!-- Left side column. contains the logo and sidebar -->
        @include('admin/parts/side_bar')
      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            أولياء الأمور
          </h1>
          
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">أضافة ولى أمر</h3>
              <div class="box-tools pull-right">
                @if (isset($status_message))
                    {{$status_message}}
                @endif
              </div>
            </div>
            <div class="box-body">
              <form action="{{route('add_parent')}}" method="post">
                @csrf
                <div class='input-group input-group-md'>
                  <label for="parent_name"class='input-group-addon'> أسم ولى الامر</label>
                  <input type="text" name="parent_name"class='form-control'>
                </div>
                <div class='input-group'>
                  <label for="student_number"class='input-group-addon'>
                    رقم الطالب
                  </label>
                  <input type="number" name="student_number" id="student_number"class='form-control'>
                </div>
                <div class='input-group'>
                  <label for="parent_job"class='input-group-addon'>
                    وظيفة ولى الأمر
                  </label>
                  <input type="text" name="parent_job" id="parent_job"class='form-control'>
                </div>
                <div class='input-group'>
                  <label for="parent_email"class='input-group-addon'>
                      البريد الألكترونى لوالى الأمر
                  </label>
                  <input type="email" name="parent_email" id="parent_email"class='form-control'>
                </div>
                <div class='input-group'>
                  <label for="parent_phone"class='input-group-addon'>
                    هاتف ولى الأمر
                  </label>
                  <input type="phone" name="parent_phone" id="parent_phone"class='form-control'>
                </div>
                <div class='input-group'>
                  <label for="parent_address"class='input-group-addon'>
                      عنوان ولى الأمر
                  </label>
                  <input type="text" name="parent_address" id="parent_address"class='form-control'>
                </div>
                <div class='input-group'>
                  <div class="input-group-btn">
                    <button class='btn btn-default dropdown-toggle'type="button"data-toggle="dropdown">أضافة أو إلغاء
                      <span class='caret'></span></button>
                      <ul class='dropdown-menu'>
                        <li>
                          <button class='btn btn-warning'type="reset">
                            إلغاء
                          </button>
                        </li>
                        <li>
                          <button class='btn btn-success'type="submit">
                            أضافة
                          </button>
                        </li>
                      </ul>
                    </button>
                  </div>
                </div>
              </form>
            </div><!-- /.box-body -->
            <div class="box-footer">
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          <div class="box">
            
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      @include('admin/parts/copy_rights')
    </div><!-- ./wrapper -->

   
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')