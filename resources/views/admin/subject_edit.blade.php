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
          <h1>
            التحكم  فى المواد الدراسية 
            
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-3">
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">المدرسيين  </h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li class="text-center"><span class="label label-primary">{{count($data['supervisors'])+count($data['nosupervisor'])}}</span> عدد المدرسين </li>
                    @foreach ($data['supervisors'] as $teacher)
                    <li><a href="#">{{$teacher->name}}</a></li>               
                    @endforeach
                    @foreach ($data['nosupervisor'] as $teacher)
                    <li><a href="#">{{$teacher->name_}}</a></li>               
                    @endforeach
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">المدرسيين الذين لا يدرسوا مواد  </h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li class="text-center"><span class="label label-primary">{{count($data['nosupervisor'])}}</span> عدد مشرفيين الفصول </li>
                    @foreach ($data['all_non_actual_teachers'] as $teacher)
                    <li><a href="#">{{$teacher->name}}</a></li>               
                    @endforeach
                  </ul>
                </div><!-- /.box-body -->
              </div>
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">المواد التى تدرس </h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li>,<span class='label label-primary'>{{count($data["all_subjects"])}}</span> عدد المواد التى تدرس</li>
                    @foreach ($data["all_subjects"] as $subject)
                    <li><a href="#"><i class="fa fa-circle-o text-red"></i> {{$subject->subj_name	}}</a></li>
                    @endforeach
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
            <div class="col-md-9">
              <form action="{{route('add_class')}}" method="post">
                @csrf
              <div class="box box-primary">
                  <div class="box-header with-border">
                    <h3 class="box-title">أضافة مادة دراسية</h3>
                    <h3 class='box-title'>@if (isset($data["status"]))
                        {{$data["status"]}}
                    @endif</h3>
                  </div><!-- /.box-header -->
                  <div class="box-body">
                    <div class="form-group">
                      <input type="text"name='subj_name' class="form-control" placeholder="عنوان المادة"/>
                    </div>
                    <div class="form-group">
                      <textarea name='subject_desc'class='form-control'placeholder='وصف المادة'>
                       
                      </textarea>
                    </div>
                  </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="pull-right">
                    <button type="submit" class="btn btn-success"name='add_subj'><i class="fa fa-envelope-o"></i> أضافة</button>
                  </div>
                  <button class="btn btn-default"type='reset'><i class="fa fa-times"></i> cancel</button>
                </div><!-- /.box-footer -->
              </div><!-- /. box -->
              </form>
              
            </div>
            <div class="col-md-9">
              <div class="box box-primary container-fluid">
                <h3 class="box-title">البحث عن المادة</h3>
                <div class="box-body form-group">
                  <div class="form-group">
                    <input type="text" name="subject" id="subj_name"placeholder="أسم المادة">
                    <button class='btn btn-primary pull-right'id="search_subject_name">أبحث</button>
                  </div>
                  <div class="form-group">
                    <input type="text" name="class_name" id="class_name">
                    <button class='btn btn-primary pull-right'id="search_class_name">أبحث</button>
                  </div>
                  <div class="form-group">
                    <select name="super_visor" id="super_visor">
                      @foreach ($data['supervisors'] as $teacher)
                      <option value="{{$teacher->id}}">{{$teacher->name}}(({{$teacher->email}}))</option>
                      @endforeach
                    </select>
                    <button class='btn btn-primary pull-right'id="search_class_super_name">أبحث</button>
                  </div>
                </div>
              </div>
              <div class="box box-info container-fluid">
                  <h3 class="box-title">جدول المواد </h3>
                  <div class='box-body'>
                    <table class='table table-hover table-stribed'id="class_searcj_result">
                      <thead>
                        <td>
                          وصف المادة 
                        </td>
                        <td>
                          أسم المادة 
                        </td>
                        <td>
                          رقم المادة 
                        </td>
                      </thead>
                      @foreach ($data["all_subjects"] as $subj)
                          <tr>
                            <td>
                              {{$subj->description}}
                            </td>
                            <td>
                              {{$subj->subj_name}}
                            </td>
                            <td>
                              {{$subj->subj_id}}
                            </td>
                            <td>
                              <button class='btn btn-danger'onclick="delete_class({{$subj->subj_id}})">مسح</button>
                            </td>
                            <td>
                              <button class="btn btn-primary"onclick="ready_for_update({class_id:{{$subj->subj_id}},class_name:'{{$subj->subj_name}}'})">تجهيز لتحديث</button>
                            </td>
                          </tr>
                      @endforeach
                    </table>
                  </div>
              </div>
              <div class="box box-info container-fluid">
                <h3 class="box-title">تحديث الفصول  </h3>
                <div class='box-body'>
                  <div class="form-group">
                    <input type="text" name="" id="class_under_update"placeholder="رقم الفصل تحت التحديث"disabled>
                  </div>
                  <div class="form-group">
                    <select name="super_visor" id="new_class_super_visor">
                      @foreach ($data['nosupervisor'] as $teacher)
                      <option value="{{$teacher->id}}">{{$teacher->name_}}(({{$teacher->email}}))</option>
                      @endforeach
                    </select>
                    <button class='btn btn-primary pull-right'id="update_class_supervisor">تحديث</button>
                  </div>
                  <div class="form-group">
                    <input type="text" name="" id="new_class_name"class='form-control'>
                    <button class='btn btn-primary pull-right'id="update_class_name">تحديث</button>
                  </div>
                </div>
              </div>
            </div><!-- /.col -->
            
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      @include('admin/parts/copy_rights')
    </div><!-- ./wrapper -->

   
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')