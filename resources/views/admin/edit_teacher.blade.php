@include('admin/header')
  <body class="skin-blue">
    <!-- Site wrapper -->
    <div class="wrapper">
      
      
        @include('admin/parts/nav_header')
        <!-- Left side column. contains the logo and sidebar -->
        @include('admin/parts/side_bar')

      <!-- =============================================== -->

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title"> إضافة معلم</h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form role="form"method="POST"enctype="multipart/form-data"action="{{route('add_teacher')}}">
              <div class="box-body">
                <h3 class='text-center'>@if (@isset($status))
                    {{$status}}
                    
                @endif</h3>
                <div class="form-group">
                  <label for="student_name">أسم المعلم</label>
                  <input type="text" class="form-control"name='teacher_name' id="teacher_name" placeholder="أسم المعلم"required>
                </div>
                <div class="form-group">
                  <label for="student_email">البريد الألكترونى</label>
                  <input type="email" class="form-control"name="teacher_email" id="teacher_email" placeholder="بريد المعلم"required>
                </div>
                <div class="form-group">
                  <label for="student_address">العنوان</label>
                  <input type="text" class="form-control"name="teacher_address" id="teacher_address" placeholder="عنوان المعلم"required>
                </div>
                <div class="form-group">
                  <label for="student_birth_date">تاريخ الميلاد</label>
                  <input type="date" class="form-control"name='teacher_birth_date'id="teacher_birth_date"required>
                </div>
                @csrf
                <div class="form-group">
                  <label for="student_phone">رقم هاتف المعلم</label>
                  <input type="phone" class="form-control"name='teacher_phone'id="teacher_phone"placeholder="رقم الهاتف"required>
                </div>
                <div class="form-group">
                  <label for="teacher_id">الرقم القومى</label>
                  <input type="phone" class="form-control"name='teacher_nat_id'id="teacher_nat_id"placeholder="الرقم القومى"required>
                </div>
                <div class="form-group">
                  <label for="teacher_relegion">الرقم الديانة</label>
                  <select name="Relegion"class='from-control' id=""required>
                    <option value="مسلم">
                      مسلم
                    </option>
                    <option value="مسيحى">
                      مسيحى
                    </option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="teacher_gender">النوع </label>
                  <select name="gender"class='from-control' id="gender"required>
                    <option value="ذكر">
                      ذكر
                    </option>
                    <option value="أنثى">
                      أنثى
                    </option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="student_image">أرفاق صورة المعلم</label>
                  <input type="file"name="teacher_image" id="teacher_image"required>
                </div>
                </div>
              </div><!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">أضافة</button>
              </div>
            </form>
            @include('admin/parts/search_teacher')
            @include('admin/parts/update_student')
          </div><!-- /.box -->
        </section>
        
        <!-- Main content -->
        
      </div><!-- /.content-wrapper -->

    </div><!-- /.content-wrapper -->
    @include('admin/parts/copy_rights')
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')