<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="{{asset('dist/img/user2-160x160.jpg')}}" class="img-circle" alt="User Image" />
      </div>
      <div class="pull-left info">
        <p>  مرحبا :{{$account[0]->name}}</p>

      </div>
    </div>
    <!-- search form -->
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
      <li class="header">الروابط

      </li>
      <li class="active treeview">
        <a href="{{route('admin_index')}}">
          <i class="fa fa-dashboard"></i> <span>لوحة التحكم</span> <i class="fa fa-angle-left pull-right"></i>
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_student')}}">
          <i class="fa fa-user"></i> الطلاب 
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_teacher')}}">
          <i class="fa fa-user"></i> المعلمين 
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_classes')}}">
          <i class="fa fa-user"></i> الفصول الدراسية 
        </a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>