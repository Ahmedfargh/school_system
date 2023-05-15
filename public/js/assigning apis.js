
$("#assign_teacher_to_subject").on("click",function(){
    let teacher_id=$("#teacher_id_to_assign").val();
    let subject_id=$("#subject_id_to_assign").val();
    if(teacher_id && subject_id){
        let data={_token:$("[inputname='_token']").val(),teacher_id:teacher_id,subj_id:subject_id};
        call_ajax_post(data,"/admin/teacher/assign_subject",{
            render:function(data){
                alert("تمت عملية التعيين بنجاح");
            }
        });
    }else{
        alert("خطا فى بيانات تعينن المواد لمدرسين");
    }
});