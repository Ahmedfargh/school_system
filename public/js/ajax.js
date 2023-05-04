function serialze_data(data){
    return JSON.parse(JSON.stringify(data));
}
function render_search(data){
    html="<tr><th>صورة الطالب</th><th>رقم الطالب</th><th>الرقم القومى</th><th>تاريخ الأنضمام </th><th>تاريخ الميلاد</th><th>العنوان</th><th>البريد الألكترونى</th><th>الأسم</th><th>أكشن</th></tr>"
    for(student in data){
        console.log(student)
        html+="<tr>";
        html+="<td>";
        html+="<a href='"+data[student]["personal_image"]+"'>صورة الطالب</a>";
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
        type:"POST",
        url:url,
        data:sentdata,
        success:function(data){
            data=serialze_data(data);
            render.render(data);
        },
        error:function(data){
            data=serialze_data(data);
           
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
    data=call_ajax_post({key:key,value:value,_token:$("input[name='_token']").val()},"/admin/ajax/search/student",
    {
        render:function(data){
            render_search(data);
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
var statistic_refresh_time=setInterval(refresh_statictics,2000)