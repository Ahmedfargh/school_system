<style>
    .update_std{
        background-color: rgb(255, 255, 255);
    }
</style>
<section class="update_std">
<div class="row">
    <h3 class='text-center'>تحديث طالب</h3>
    <div class="col-xs-12">
        <div class="box-header">
            <h3 class="box-title">رقم الطالب </h3>
            <div class="box-tools">
              <div class="input-group col-4">
                <input type="number" name="std_id"id="std_id" class="form-control input-sm pull-right" style="width: 150px;" placeholder=" رقم الطالب"/>
              </div>
            </div>
        </div>
        <div class="box-header">
          <h3 class="box-title">تحديث الاسم</h3>
          <div class="box-tools">
            <div class="input-group">
              <input type="text" name="std_name"id="new_std_name" class="form-control input-sm pull-right" style="width: 150px;" placeholder="الأسم الجديد"/>
              <div class="input-group-btn">
                <button class="btn btn-info"id="update_name">تحديث</button>
              </div>
            </div>
          </div>
        </div>
        <div class="box-header">
          <h3 class="box-title">تحديث العنوان</h3>
          <div class="box-tools">
            <div class="input-group">
              <input type="text" name="std_address"id="new_std_address" class="form-control input-sm pull-right" style="width: 150px;" placeholder="العنوان"/>
              <div class="input-group-btn">
                <button class="btn btn-sm btn-info"id="update_std_address">نحديث</button>
              </div>
            </div>
          </div>
        </div>
        <div class="box-header">
            <h3 class="box-title">تحديث البريد الالأكترونى </h3>
            <div class="box-tools">
              <div class="input-group">
                <input type="email" name="new_std_email"id="new_std_email" class="form-control input-sm pull-right" style="width: 150px;" placeholder="البريد الألكترونى"/>
                <div class="input-group-btn">
                  <button class="btn btn-sm btn-info"id="update_std_email">نحديث</button>
                </div>
              </div>
            </div>
        </div>
        <div class="box-header">
          <h3 class="box-title">النقل للفصل  </h3>
          <div class="box-tools">
            <div class="input-group">
              <select name="" id="new_std_class">
                @foreach ($data["classies"] as $class)
                    <option value="{{$class->id}}">{{$class->class}}</option>
                @endforeach
              </select>
              <div class="input-group-btn">
                <button class="btn btn-sm btn-info"id="update_std_class">نحديث</button>
              </div>
            </div>
          </div>
      </div>
      </div><!-- /.box -->
    </div>
  </div>
</section>