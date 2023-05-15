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
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title"> تعيين مدرس لمادة</h3>
                </div><!-- /.box-header -->
                <div class="box-body ">
                  <ul class="nav nav-pills nav-stacked ">
                    <li>
                      <select name=""class='form-control' id="teacher_id_to_assign">
                        @foreach ($data["supervisors"] as $item)
                            <option value="{{$item->id}}">{{$item->name}}</option>
                        @endforeach
                        @foreach ($data["nosupervisor"] as $item)
                            <option value="{{$item->id}}">{{$item->name_}}</option>
                        @endforeach
                      </select>
                    </li>
                    <li>
                      <select name="" id="subject_id"class='form-control'>
                        @foreach ($data["all_subjects"] as $subj)
                          <option value="{{$subj->id}}">{{$subj->subj_name}}</option>
                        @endforeach
                      </select>
                    </li>
                    <li><input type="button"class='btn btn-success'id="assign_teacher_to_subject"value="تعيين"></li>
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
                    <input type="text" name="class_name"class='form-control' id="subj_name">
                    <button class='btn btn-primary pull-right'id="search_subj_name">أبحث</button>
                  </div>
                  <div class='form-group'>
                    <textarea name="subject_desc"class='form-control' id="subj_desc_in"cols="50"></textarea>
                    <button class='btn btn-primary pull-right'id="search_subj_desc">أبحث</button>
                  </div>
                </div>
              </div>
              <div class="box box-info container-fluid">
                  <h3 class="box-title">جدول المواد </h3>
                  <div class='box-body'>
                    <table class='table table-hover table-stribed'id="subject_searcj_result">
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
                              {{$subj->id}}
                            </td>
                            <td>
                              <button class='btn btn-danger'onclick="delete_class({{$subj->id}})">مسح</button>
                            </td>
                            <td>
                              <button class="btn btn-primary"onclick="ready_for_update({class_id:{{$subj->id}},class_name:'{{$subj->subj_name}}'})">تجهيز لتحديث</button>
                            </td>
                          </tr>
                      @endforeach
                    </table>
                  </div>
              </div>
              <div class="box box-info container-fluid">
                <h3 class="box-title">تحديث المواد  </h3>
                <div class='box-body'>
                  <div class="form-group">
                    <input type="number" class='form-control' name="" id="subject_update"placeholder="رقم المادة تحت التحديث">
                  </div>
                  <div class="form-group">
                    <input type="text"class='form-control' id="subject_name"placeholder="أسم المادة">
                    <button class='btn btn-primary pull-right'id="update_subject_name">تحديث</button>
                  </div>
                  <div class="form-group">
                    <textarea name=""class='form-control' id="subject_desc" cols="50" rows="10"></textarea>
                    <button class='btn btn-primary pull-right'id="update_subject_desc">تحديث</button>
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