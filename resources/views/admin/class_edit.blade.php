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
            التحكم  فى الفصول الدراسية
            
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-3">
              <div class="box box-solid">
                <div class="box-header with-border">
                  <h3 class="box-title">المدرسيين المشرفين </h3>
                </div>
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li class="text-center"><span class="label label-primary">{{count($data['supervisors'])}}</span> عدد مشرفيين الفصول </li>
                    @foreach ($data['supervisors'] as $teacher)
                    <li><a href="mailbox.html">{{$teacher->name}}</a></li>               
                    @endforeach
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
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
                    <h3 class="box-title">أضافة فصل</h3>
                    <h3 class='box-title'>@if (isset($data["status"]))
                        {{$data["status"]}}
                    @endif</h3>
                  </div><!-- /.box-header -->
                  <div class="box-body">
                    <div class="form-group">
                      <input type="text"name='class_label' class="form-control" placeholder="عنوان الفصل"/>
                    </div>
                    <div class="form-group">
                      <select name='teacher_id'class='form-control'placeholder='أسم المعلم'>
                        @foreach ($data['nosupervisor'] as $teacher)
                            <option value="{{$teacher->id}}">{{$teacher->name_}}(({{$teacher->email}}))</option>
                        @endforeach
                      </select>
                    </div>
                  </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="pull-right">
                    <button type="submit" class="btn btn-success"name='add_class'><i class="fa fa-envelope-o"></i> أضافة</button>
                  </div>
                  <button class="btn btn-default"type='reset'><i class="fa fa-times"></i> cancel</button>
                </div><!-- /.box-footer -->
              </div><!-- /. box -->
            </form>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      @include('admin/parts/copy_rights')
    </div><!-- ./wrapper -->

   
  </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')