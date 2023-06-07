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
      
      <li class="treeview">
        <a href="{{route('admin_index')}}">
          <span class='fas fa-th'></span>لوحة التحكم
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_student')}}">
           <span class='fas fa-user'></span>الطلاب 
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_teacher')}}">
          <span class='fas fa-user-plus'></span>المعلمين و الموظفيين
        </a>
      </li>
      <li class="treeview">
        <a href="{{route('edit_classes')}}">
           <span class='fas fa-building'></span>الفصول الدراسية 
        </a>
      </li>
      <li class='treeview'>
        <a href="{{route('edit_subjects')}}">
         <span class='fas fa-book'></span> المواد الدراسية
        </a>
      </li>
      <li class='treeview'>
        <a href="{{route('parent_edit_page')}}">
          <span class='fas fa-user-secret'></span>أولياء الأمور
        </a>
      </li>
      <li class='treeview'>
        <a href="{{route('server_page')}}">
         <span class='fas fa-server'></span> الخوادم 
        </a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>