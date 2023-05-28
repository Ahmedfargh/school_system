@include('admin/header')
<style>
  .marginal-first{
    padding:15px;
  }
 
</style>
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
            بيانات الموظف
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">الموظف</h3>
              <div class="box-tools pull-center">
              </div>
            </div>
            <div class="box-body">
              <div class='media center'>
                <a href="#"class='pull-left '>
                <img src="{{$teacher_data[0]->personal_image}}"class='media-object'>
                </a>
                <div class='media-body'>
                  <div class='media-heading'>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>أسم المعلم</span>
                      <input type="text"value="{{$teacher_data[0]->name}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>الرقم التعريفى لطالب </span>
                      <input type="text"value="{{$teacher_data[0]->id}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>رقم هاتف المعلم</span>
                      <input type="text"value="{{$teacher_data[0]->phone}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>رقم هاتف المعلم</span>
                      <input type="text"value="{{$teacher_data[0]->phone}}"disabled>
                    </div>
                    <div class='input-group marginal' >
                      <span class='input-group-addon'>البريد الألكترونى</span>
                      <input type="text"value="{{$teacher_data[0]->email}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'> العنوان</span>
                      <input type="text"value="{{$teacher_data[0]->address}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'> تاريخ الميلاد</span>
                      <input type="text"value="{{$teacher_data[0]->birth_date}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'> تاريخ الأنضمام </span>
                      <input type="text"value="{{$teacher_data[0]->joined_at}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>  الديانة </span>
                      <input type="text"value="{{$teacher_data[0]->relegion}}"disabled>
                    </div>
                    <div class='input-group marginal'>
                      <span class='input-group-addon'>  النوع </span>
                      <input type="text"value="{{$teacher_data[0]->gender}}"disabled>
                    </div>

                  </div>
                </div>
              </div>
              
            </div><!-- /.box-body -->
            <div class="box-footer">
            </div><!-- /.box-footer-->
          </div><!-- /.box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">أولياء الأمور</h3>
              
            </div>
            <div class='box-body'>
              <table class='table table-striped'>
                <tr>
                  <td>
                    أسم المادة
                  </td>
                  <td>
                    الوصف
                  </td>
                  <td>
                   رقم المادة 
                  </td>
                </tr>
                <tr>
                  @foreach ($subjects as $subject)
                      <td>
                        {{$subject->subj_name}}
                      </td>
                      <td>
                        {{$subject->description}}
                      </td>
                      <td>
                        {{$subject->id}}
                      </td>
                  @endforeach
                </tr>
              </table>
            </div>
          </div>
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      @include('admin/parts/copy_rights')
    </div><!-- ./wrapper -->

   
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')