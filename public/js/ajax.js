
function serialze_data(data){
    return JSON.parse(JSON.stringify(data));
}
function render_search_student(data){

    console.log(data);
    html="<tr><th>كامل بيانات الطالب </th><th>رقم الطالب</th><th>الرقم القومى</th><th>تاريخ الأنضمام </th><th>تاريخ الميلاد</th><th>العنوان</th><th>البريد الألكترونى</th><th>الأسم</th><th>أكشن</th></tr>"
    for(student in data){
        console.log(student)
        html+="<tr>";
        html+="<td>";
        html+="<a href='/admin/student/data/"+data[student]["id"]+"'>كامل بيانات الطالب الطالب</a>";
        html+="</td>";
        html+="<td>";
        html+=data[student]["id"];
        html+="</td>"
        html+="<td>";
        html+=data[student]["nat_id"];
        html+="</td>";
        html+="<td>";
        html+=data[student]["join_date"];
        html+="</td>";
        html+="<td>";
        html+=data[student]["birth_date"];
        html+="</td>";
        html+="<td>";
        html+=data[student]["address"];
        html+="</td>";
        html+="<td>";
        html+=data[student]["email"];
        html+="</td>";
        html+="<td>";
        html+=data[student]["name"];
        html+="</td>";
        html+="<td>";
        html+="<input type='button' class='btn btn-warning'id='delete_std_"+data[student]["id"]+"'value='مسح'onclick='delete_std("+data[student]["id"]+")'>";
        html+="</td>";
        html+="</tr>";
    }
    $(".student_table").html(html);
}
function render_search_teacher(data){
    html="<tr><th>صورة المعلم</th><th>رقم المعلم</th><th>الرقم القومى</th><th>ديانة</th><th>تاريخ الأنضمام </th><th>تاريخ الميلاد</th><th>العنوان</th><th>البريد الألكترونى</th><th>النوع</th><th>الأسم</th><th>أكشن</th></tr>"
    for(teacher in data){
        console.log(teacher)
        console.log(data[teacher])
        html+="<tr>";
        html+="<td>";
        html+="<a href='"+data[teacher]["personal_image"]+"'>صورة الطالب</a>";
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["id"];
        html+="</td>"
        html+="<td>";
        html+=data[teacher]["nat_id"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["relegion"];
        html+="</td>";

        html+="<td>";
        html+=data[teacher]["joined_at"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["birth_date"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["address"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["email"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["gender"];
        html+="</td>";
        html+="<td>";
        html+=data[teacher]["name"];
        html+="</td>";
        html+="<td>";
        html+="<input type='button' class='btn btn-warning'id='delete_std_"+data[teacher]["id"]+"'value='مسح'onclick='delete_teacher("+data[teacher]["id"]+")'>";
        html+="</td>";
        html+="</tr>";
    }
    $(".student_table").html(html);
}
function render_staticticts(data){
    $("#student_counter").html(data["student_count"]);
    $("#admin_counter").html(data["admin_counter"]);
    $("#classes_count").html(data["classes_count"]);
    $("#student_have_credit").html(data["student_have_credit"]);
    $("#teacher_count").html(data["teacher_count"]);

}
function call_ajax_post(sentdata,url,render){
   
    $.ajax({
        type:"get",
        url:url,
        data:sentdata,
        success:function(data){
            data=serialze_data(data);
            render.render(data);
            console.log("will done");
        },
        error:function(data){
            data=serialze_data(data);
            alert("big error");
            render.render(data);
        },
        statusCode:{
            404:function(data){
                alert("Error 404");
            },
            500:function(data){
                alert("Error 404");
            },
        }
    });
    //return data_to_return;
}
function search_student(key,value){

    data=call_ajax_post({key:key,value:value,_token:$("[inputname='_token']").val()},"/admin/ajax/search/student",
    {
        render:function(data){
            render_search_student(data);
        }
    });
}
function search_teacher(key,value){
    data=call_ajax_post({key:key,value:value,_token:$("input[name='_token']").val()},"/admin/ajax/search/teacher",
    {
        render:function(data){
            render_search_teacher(data);
        }
    });
}
function delete_std(id){
    
    call_ajax_post({std_id:id,_token:$("input[name='_token']").val()},"/admin/student/delete",{
        render:function(data){
            alert("تمت عملية المسح بنجاح");
        }
    });
}
function refresh_statictics(){
    data=call_ajax_post({_token:$("input[name='_token']").val()},"/admin/get/statictics",
    {
        render:function(data){
            render_staticticts(data);
        }
    });
}
function update_std(data,render){
    call_ajax_post(data,"/admin/student/update",render);
}
/**************************/
/*update students sections*/
/**************************/
$("#update_name").on("click",function(){
    let std_id=$("#std_id").val();
    let std_value=$("#new_std_name").val();
    if(std_id && std_value){
        update_std({_token:$("input[name='_token']").val(),std_id:std_id,field:"name",value:std_value},{
            render:function(data){
                console.log(data);
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_std_address").on("click",function(){
    let std_id=$("#std_id").val();
    let std_value=$("#new_std_address").val();
    if(std_id && std_value){
        console.log({_token:$("input[name='_token']").val(),std_id:std_id,field:"address",value:std_value});
        update_std({_token:$("input[name='_token']").val(),std_id:std_id,field:"address",value:std_value},{
            render:function(data){
                console.log(data);
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_std_email").on("click",function(){
    let std_id=$("#std_id").val();
    console.log(std_id);
    let std_value=$("#new_std_email").val();
    console.log(std_value);
    if(std_id && std_value){
        //console.log({_token:$("input[name='_token']").val(),std_id:std_id,field:"email",value:std_value});
        update_std({_token:$("input[name='_token']").val(),std_id:std_id,field:"email",value:std_value},{
            render:function(data){
                console.log(serialze_data(data));
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_std_date").on("click",function(){
    let std_id=$("#std_id").val();
    let std_value=$("#new_std_date").val();
    if(std_id && std_value){
        console.log({_token:$("input[name='_token']").val(),std_id:std_id,field:"brith_date",value:std_value});
        update_std({_token:$("input[name='_token']").val(),std_id:std_id,field:"birth_date",value:std_value},{
            render:function(data){
                console.log(data);
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_std_date").on("click",function(){
    let std_id=$("#std_id").val();
    let std_value=$("#new_std_date").val();
    if(std_id && std_value){
        console.log({_token:$("input[name='_token']").val(),std_id:std_id,field:"brith_date",value:std_value});
        update_std({_token:$("input[name='_token']").val(),std_id:std_id,field:"birth_date",value:std_value},{
            render:function(data){
                console.log(data);
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
/**********************/
/*search students here*/
/**********************/
$("#search_student_by_name").on("click",function(){
    search_student("name",$("#student_by_name").val());
});
$("#search_student_by_address").on("click",function(){
    search_student("address",$("#search_by_address").val());
});
$("#search_student_by_id").on("click",function(){
    search_student("id",$("#search_by_id").val());
});
/****************************/
/*search teachers start here*/
/****************************/
$("#search_teacher_by_name").on("click",function(){
    search_teacher("name",$("#teacher_by_name").val());
});
$("#search_teacher_by_address").on("click",function(){
    search_teacher("address",$("#search_by_address").val());
});
$("#search_teacher_by_id").on("click",function(){
    search_teacher("id",$("#search_by_id").val());
});
function delete_teacher(id){
    call_ajax_post({teacher_id:id,_token:$("input[name='_token']").val()},"/admin/ajax/delete/teacher",{
        render:function(data){
            alert("تمت عملية المسح بنجاح");
        }
    });
}
/*================================*/
/****update teacher starts here****/
/*================================*/
function update_teacher(data){
    call_ajax_post(data,"/admin/ajax/update/teacher",{
        render:function(data){
            alert("تمت العملية بنجاح");
        }
    });
}
$("#update_name_teacher").on("click",function(){
    let teacher_id=$("#teacher_id").val();
    let std_value=$("#new_teacher_name").val();
    if(teacher_id && std_value){
        //console.log({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"name",value:std_value});
        update_teacher({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"name",value:std_value},{
            render:function(data){
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_teacher_address").on("click",function(){
    let teacher_id=$("#teacher_id").val();
    let std_value=$("#new_teacher_address").val();
    if(teacher_id && std_value){
        //console.log({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"name",value:std_value});
        update_teacher({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"address",value:std_value},{
            render:function(data){
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_teacher_phone").on("click",function(){
    let teacher_id=$("#teacher_id").val();
    let std_value=$("#new_teacher_phone").val();
    if(teacher_id && std_value){
        //console.log({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"name",value:std_value});
        update_teacher({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"phone",value:std_value},{
            render:function(data){
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
$("#update_teacher_email").on("click",function(){
    let teacher_id=$("#teacher_id").val();
    let std_value=$("#new_teacher_email").val();
    if(teacher_id && std_value){
        //console.log({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"name",value:std_value});
        update_teacher({_token:$("input[name='_token']").val(),teacher_id:teacher_id,field:"email",value:std_value},{
            render:function(data){
                alert("تمت عملية التحديث بنجاح");
            }
        });
    }else{
        alert("لا يوجد رقم الطالب");
    }
});
/********************************************/
/********class searching starts here*********/
/********************************************/
function delete_class(class_id){
    let data={class_id:class_id,_token:$("input[name='_token']").val()};
    call_ajax_post(data,"/admin/class/delete",{
        render:function(data){
            alert("تمت عملية التحديث بنجاح");
        }
    });
}
function render_search_classies(data){
    let html="<thead><td>أسم المشرف </td><td>أسم الفصل</td><td>رقم الفصل </td></thead>";
    for (const key in data) {
        html+="<tr>";
        html+="<td>";
        html+=data[key]["name_"];
        html+="</td>";
        html+="<td>";
        html+=data[key]["class_name"];
        html+="</td>";
        html+="<td>";
        html+=data[key]["class_id"];
        html+="</td>";
        html+="<td>";
        html+="<button class='btn btn-danger'onclick='delete_class("+data[key]["class_id"]+")'>مسح</button>";
        html+="</td>";
        html+="</tr>"
    }
    $("#class_searcj_result").html(html);
}
function search(data){
    call_ajax_post(data,"/admin/class/search",{
        render:function(data){
            render_search_classies(data);
        }
    });
}
$("#search_class_id").on("click",function(){
    let class_id=$("#class_number").val();
    let key="id";
    if(class_id){
        let data={key:key,value:class_id,_token:$("input[name='_token']").val()};
        search(data);
    }else{
        alert("يوجد خطأ فى المدخلات");
    }
});
$("#search_class_name").on("click",function(){
    let class_=$("#class_name").val();
    let key="name";
    if(class_){
        let data={key:key,value:class_,_token:$("input[name='_token']").val()};
        search(data);
    }else{
        alert("يوجد خطأ فى المدخلات");
    }
});
$("#search_class_super_name").on("click",function(){
    let supervisor_name=$("#super_visor").val();
    let key="super_visor";
    if(supervisor_name){
        let data={key:key,value:supervisor_name,_token:$("input[name='_token']").val()};
        search(data);
    }else{
        alert("يوجد خطأ فى المدخلات");
    }
});
/******************************************/
/***********update classies here***********/
/******************************************/
function ready_for_update(class_data){
    $("#class_under_update").val(class_data["class_id"]);
    $("#new_class_name").val(class_data["class_name"]);
}
function update_class(data){
    call_ajax_post(data,"/admin/update/class",{
        render:function(data){
            alert("تمت عملية التحديث");
        }
    });
}
$("#update_class_supervisor").on("click",function(){
    let class_super_visor=$("#new_class_super_visor").val();
    let class_id=$("#class_under_update").val();
    if(class_id){
        update_class({class_id:class_id,value:class_super_visor,field:"super_visor",_token:$("input[name='_token']").val()});
    }else{
        alert("لم يتم أختيار الفصل لتحديث");
    }
});
$("#update_class_name").on("click",function(){
    let class_name=$("#new_class_name").val();
    let class_id=$("#class_under_update").val();
    if(class_id){
        update_class({class_id:class_id,value:class_name,field:"name",_token:$("input[name='_token']").val()});
    }else{
        alert("لم يتم أختيار الفصل لتحديث");
    }
});
/*******************************************/
/******search subjects is from here*********/
/*******************************************/
function render_search(data){
    let html="<thead><td>وصف المادة </td><td>أسم المادة </td><td>رقم المادة </td></thead>";
    for (key in data) {
        html+="<tr>";
        html+="<td>";
        html+=data[key]["description"];
        html+="</td>";
        html+="<td>";
        html+=data[key]["subj_name"];
        html+="</td>";
        html+="<td>";
        html+=data[key]["subj_id"];
        html+="</td>";
        html+="</tr>";
    }
    $("#subject_searcj_result").html(html);
}
function search_subject(data){
    console.log(data);
    call_ajax_post(data,"/admin/search/subject/",{
        render:function(data){
            render_search(data);
        }
    });
}
$("#search_subj_name").on("click",function(){
    let subject_name=$("#subj_name").val();
    let field="name";
    if(subject_name){
        search_subject({field_:field,value_:subject_name,_token:$("input[name='_token']").val()});
    }else{
        alert("أدخل أسم المادة");
    }
});
$("#search_subj_desc").on("click",function(){
    let subject_desc=$("#subj_desc_in").val();
    let field="description";
    if(subject_desc){
        search_subject({field_:field,value_:subject_desc,_token:$("input[name='_token']").val()});
    }else{
        alert("أدخل أسم المادة");
    }
});
//***********************************
//update subjects go through here****
//**********************************
function render_update_subject(data){
    alert("تمت عملية التحديث بنجاح");
}
function update_subject(data){
    call_ajax_post(data,"/admin/subject/update",{
        render:function(data){
            render_update_subject(data);
        }
    });
}
$("#update_subject_name").on("click",function(){
    let subject_name=$("#subject_name").val();
    let id=$("#subject_update").val();
    let field="name";
    if(id && subject_name){
        update_subject({field:field,value:subject_name,id:id,_token:$("input[name='_token']").val()});
    }else{
        alert("هناك خطأ فى المدخلات");
    }
});
$("#update_subject_desc").on("click",function(){
    let subject_name=$("#subject_desc").val();
    let id=$("#subject_update").val();
    let field="description";
    if(id && subject_name){
        update_subject({field:field,value:subject_name,id:id,_token:$("input[name='_token']").val()});
    }else{
        alert("هناك خطأ فى المدخلات");
    }
});
var statistic_refresh_time=setInterval(refresh_statictics,2000)