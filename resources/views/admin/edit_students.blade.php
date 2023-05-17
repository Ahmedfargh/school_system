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
              <h3 class="box-title">أضافة طالب</h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <form role="form"method="POST"enctype="multipart/form-data"action="{{route('add_students')}}">
              <div class="box-body">
                <div class="form-group">
                  <label for="student_name">أسم الطالب</label>
                  <input type="text" class="form-control"name='student_name' id="student_name" placeholder="أسم الطالب"required>
                </div>
                <div class="form-group">
                  <label for="student_email">البريد الألكترونى</label>
                  <input type="email" class="form-control"name="student_email" id="student_email" placeholder="بريد الطالب"required>
                </div>
                <div class="form-group">
                  <label for="student_address">العنوان</label>
                  <input type="text" class="form-control"name="student_address" id="student_address" placeholder="عنوان الطالب"required>
                </div>
                <div class="form-group">
                  <label for="student_birth_date">تاريخ الميلاد</label>
                  <input type="date" class="form-control"name='student_birth_date'id="student_birth_date"required>
                </div>
                <div class="form-group">
                  <label for="student_birth_date"> الديانة</label>
                  <select name="student_relgion" id=""class='form-control'>
                    <option value="مسلم">مسلم</option>
                    <option value="مسيحى">مسيحى</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="student_birth_date">النوع</label>
                  <select name="student_gender" id=""class='form-control'>
                    <option value="ذكر">ذكر</option>
                    <option value="أنثى">أنثى</option>
                  </select>
                </div>
                <div class="form-group">
                  <label for="student_birth_date"> الجنيسة</label>
                  <input type="text" name="nationality" id=""class='form-control'placeholder="الجنسية">
                </div>
                <div class='form-group'>
                  <label for="student_class">فصل الطالب</label>
                  <select name="std_class" id=""class='form-control'>
                    @foreach ($data["classies"] as $class)
                        <option value="{{$class->id}}">{{$class->class}}</option>
                    @endforeach
                  </select>
                </div>
                @csrf
                <div class="form-group">
                  <label for="student_phone">رقم هاتف الطالب</label>
                  <input type="phone" class="form-control"name='student_phone'id="student_phone"placeholder="رقم الهاتف"required>
                </div>
                <div class="form-group">
                  <label for="student_nat_id">الرقم القومى</label>
                  <input type="phone" class="form-control"name='student_nat_id'id="student_nat_id"placeholder="الرقم القومى"required>
                </div>
                <div class="form-group">
                  <label for="student_image">أرفاق صورة الطالب</label>
                  <input type="file"name="student_image" id="student_image"required>
                </div>
                </div>
              </div><!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">أضافة</button>
              </div>
            </form>
            @include('admin/parts/search_student')
            @include('admin/parts/update_student')
          </div><!-- /.box -->
        </section>
        
        <!-- Main content -->
        

    @include('admin/parts/copy_rights')
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')