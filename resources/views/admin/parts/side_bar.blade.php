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
          لوحة التحكم
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_student')}}">
           الطلاب 
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_teacher')}}">
          المعلمين 
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_classes')}}">
           الفصول الدراسية 
        </a>
      </li>
      <li class='treeview'>
        <a href="{{route('edit_subjects')}}"><li class='fa fa-user'></li>المواد الدراسية</a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>