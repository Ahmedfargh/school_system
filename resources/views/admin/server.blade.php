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
            صفحة الخادم
            
          </h1>
        </section>
        <section class="content">

          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">معلومات عن الخادم</h3>
              <div class="box-tools pull-center">
                
              </div>
              <div class="box-body">
                <div class='media center'>
                  <table class='table table-hover table-stripped'>
                    <tr>
                      <td>
                        {{$_SERVER['SERVER_NAME']}}
                      </td>
                      <td>
                        النطاق
                      </td>
                    </tr>
                    <tr>
                      <td>
                        {{$_SERVER['SERVER_SOFTWARE']}}
                      </td>
                      <td>
                        بيئة العمل
                      </td>
                    </tr>
                    <tr>
                      <td>
                        {{$_SERVER['SERVER_PROTOCOL']}}
                      </td>
                      <td>
                        بروتوكول الخدمة
                      </td>
                    </tr>
                    <tr>
                      <td>
                        {{$_SERVER['HTTP_HOST']}}
                      </td>
                      <td>
                         عنوان الأتصال
                      </td>
                    </tr>
                    <tr>
                      <td>
                        {{$_SERVER['SERVER_ADMIN']}}
                      </td>
                      <td>
                          المدير 
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
          </div>
          @include("admin/parts/server_request_charts")

        </section>
        <!-- Main content -->
                

  </div><!-- ./wrapper -->
  @include('admin/parts/copy_rights')

  <!-- jQuery 2.1.3 -->
  @include('admin/parts/footer')