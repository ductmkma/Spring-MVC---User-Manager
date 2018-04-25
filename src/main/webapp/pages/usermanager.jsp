<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="header.jsp"%>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <spring:message code="usermanager"></spring:message>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>  <spring:message code="home"></spring:message></a></li>
        <li><a href="#"> <spring:message code="tree"></spring:message></a></li>
        <li class="active"> <spring:message code="usermanager"></spring:message></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
      	<div class="box-header with-border">
				<h3 style="float:left;" class="box-title"><spring:message code="listuser"></spring:message> </h3>
				<div>
					 <!-- Button trigger modal -->
  		<a style="float:right;" data-toggle="modal" href="#myModal" class="btn btn-primary btn-md btn-add"><i class="fa fa-user-plus" aria-hidden="true"></i> <spring:message code="adduser"></spring:message></a>

		  <!-- Modal -->
		  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title"><spring:message code="adduser"></spring:message></h4>
		        </div>
		        <div class="modal-body">
		        	<div id="error" class="error"></div>
					<form  method="post" id="frm-add">
					<input type="hidden" class="form-control" name="action" id="action" value="add"/>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label> 
			<div class="col-sm-10">
				<input type="text" class="form-control"  name="name" id="name" placeholder="Họ và tên"/>
				<p id="err_name" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Ngày sinh</label> 
			<div class="col-sm-10">
				<input type="text" class="form-control datepicker" id="birthday" name = "birthday"  placeholder="Ngày sinh"/>
				<p id="err_birthday" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
		
			<label class="col-sm-2">Giới tính</label> 
			<div class="col-sm-10">
			<input type="radio" name="gender" checked value="1"/>Nam
			<input type="radio" name="gender" value="2"/>Nữ 
			<input type="radio"  name="gender" value="3"/>Khác
			<p id="err_gender" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Địa chỉ</label> 
			<div class="col-sm-10">
				<input type="text" class="form-control" id="address" name="address"  placeholder="Địa chỉ"/>
				<p id="err_add" class="error"></p>
			</div>
		</div>
		        <div class="modal-footer">
		          <button  type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="cancle"></spring:message></button>
		          <button type="submit" id="themmoi" class="btn btn-primary"><spring:message code="adduser"></spring:message> </button>
		        </div>
		 </form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
		  
				</div>
			
		</div>
		<div class="box-body">
       		<table id="tableuser" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th><spring:message code="id"></spring:message></th>
						<th><spring:message code="name"></spring:message></th>
						<th><spring:message code="birthday"></spring:message></th>
						<th><spring:message code="gender"></spring:message></th>	
						<th><spring:message code="address"></spring:message></th>
						<th><spring:message code="action"></spring:message></th>
					</tr>
				</thead>
				<tbody>
				</tbody>
		</table>
		 <!-- Modal edit-->
		  <div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Sửa thông tin người dùng</h4>
		        </div>
		        <div class="modal-body">
					<form  method="post" id="frm-edit">
					<input type="hidden" class="form-control" name="action" id="action" value="edit"/>
					<input type="hidden" class="form-control" name="id" id="id" value=""/>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="name" id="edit_name" placeholder="Họ và tên"/>
				<p id="err_edit_name" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Ngày sinh</label>
			<div class="col-sm-10">
				<input type="text" class="form-control datepicker" id="edit_birthday" name = "birthday" placeholder="Ngày sinh"/>
				<p id="err_edit_birthday" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
		
			<label class="col-sm-2">Giới tính</label>
			<div class="col-sm-10">
			<input type="radio" id="edit_gender" name="gender"  value="1"/>Nam
			<input type="radio" id="edit_gender" name="gender"  value="2"/>Nữ 
			<input type="radio" id="edit_gender"  name="gender" value="3"/>Khác
			<p id="err_edit_gender" class="error"></p>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Địa chỉ</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="edit_address" name="address" placeholder="Địa chỉ"/>
				<p id="err_edit_add" class="error"></p>
			</div>
		</div>
		        <div class="modal-footer">
		          <button  type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
		          <button type="submit" name="edit" id="edit" class="btn btn-primary">Cập nhật</button>
		        </div>
		 </form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
		</div>
      </div>
      </div>
      <!-- /.box -->
	
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="footer.jsp"%>
  <script type="text/javascript">
  //Plug-in to fetch page data 
	 jQuery.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
		return {
			"iStart":         oSettings._iDisplayStart,
			"iEnd":           oSettings.fnDisplayEnd(),
			"iLength":        oSettings._iDisplayLength,
			"iTotal":         oSettings.fnRecordsTotal(),
			"iFilteredTotal": oSettings.fnRecordsDisplay(),
			"iPage":          oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
			"iTotalPages":    oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
		};
	};
  	$(document).ready(function(){
  		var ctx = "${pageContext.request.contextPath}";
	  		var table = $("#tableuser").dataTable( {
	  	        "bProcessing": true,
	  	        "bServerSide": true,
	  	        "sort": "position",
	  	     	" bSortable": true,
	  	        //bStateSave variable you can use to save state on client cookies: set value "true" 
	  	        "bStateSave": false,
	  	        //Default: Page display length
	  	        "iDisplayLength": 10,
	  	        //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
	  	        "iDisplayStart": 0,
	  	        "fnDrawCallback": function () {
	  	            //Get page numer on client. Please note: number start from 0 So
	  	            //for the first page you will see 0 second page 1 third page 2...
	  	            //Un-comment below alert to see page number
	  	        	//alert("Current page number: "+this.fnPagingInfo().iPage);    
	  	        },         
	  	        "sAjaxSource": ctx+"/listuser",
	  	      	"columnDefs" : [ {
					"className" : "text-center",
					"targets" : 0
				},{
					"className" : "text-center",
					"targets" : 5
				},{
					"className" : "text-center",
					"targets" : 2
				},{
					"className" : "text-center",
					"targets" : 3
				},{
					"className" : "text-center",
					"targets" : 4,
					"bSortable": true,
				}],
	  	        "aoColumns": [
	  	            { "data": "id" },
	  	            { "data": "name" },
	  	            { "data": "birthday" },
	  	            { "data": "gender",render: function(data,type,row){
	  	            	if(data==1){
	  	            		return "Nam";
	  	            	}else if(data==2){
	  	            		return "Nữ";
	  	            	}else if(data=3){
	  	            		return "Khác";
	  	            	}
	  	            } },
	  	            { "data": "address" },
	  	         	{ "data": "action",
	  	            	render: function (data, type, row) {
	  	                    return ' <a class="btn btn-primary btn-sm btn-edit" href="javascript:;" id="'+row.id+'"  title="Sửa"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> <spring:message code="edit"></spring:message></a> <a id="'+row.id+'" class="btn btn-danger btn-sm btn-delete " href="javascript:;" title="Xóa" ><i id="deleteUnit" class="fa fa-trash-o" aria-hidden="true"></i> <spring:message code="delete"></spring:message></a>';
	  	            	} },
	  	             
	  	        ]
	  	    } );
  		
  		
  				
  		$('.datepicker').datepicker({
  		    format: 'yyyy/mm/dd'
  		});
  		$("#tableuser_length").parent().css('clear','both');
  		//add
  		$(".btn-add").on('click',function(){
  			$("#err_name").html("");
  			$("#err_birthday").html("");
  			$("#err_add").html("");
  		});
  			
  		
  	    $('#frm-add').on('submit',function(e){
  	        	  e.preventDefault();
  	              var form= $('#frm-add');
  	              var formData= form.serialize();
  	              $.ajax({
  	                type:'POST',
  	                url:  ctx+"/list", 
  	              	dataType : 'json',
  	                data:formData,	
  	               	success:function(response){
  	               		if(response.status == "SUCCESS"){
  	               			$("#myModal").modal('hide');
  	               			$("#frm-add")[0].reset();
  	               			$('#tableuser').DataTable().ajax.reload();
  	               			toastr.success("Thêm mới thành công !");
  	               		}else{
  	               			for(var i = 0; i < response.result.length;i++){
	               				if(response.result[i].field=="name"){
	               					var err_name = response.result[i].codes[3];
	               					$("#err_name").html(err_name);
	               				}
	               				if(response.result[i].field=="birthday"){
               						var err_birthday = response.result[i].codes[3];
               						$("#err_birthday").html(err_birthday);
               					}
	               				if(response.result[i].field=="address"){
           							var err_add = response.result[i].codes[3];
           							$("#err_add").html(err_add);
           						}
	               				if(response.result[i].field=="gender"){
           							var err_gender = response.result[i].codes[3];
           							$("#err_gender").html(err_birthday);
           						}
	               			}
	  	               	}
  	               		
  	                },
  	                error: function (xhr, ajaxOptions, thrownError)
  	                {
						toastr.error(thrownError);
  	                }
  	              });
  	});
  		//edit
  		$("#tableuser").on('click','.btn-edit',function(){
  			$("#err_edit_name").html("");
  			$("#err_edit_birthday").html("");
  			$("#err_edit_add").html("");
  			$("#err_edit_gender").html("");
  			$('#modal_edit').modal('show');
  			$("#id").val($(this).attr('id'));
  			var name = $(this).parent().parent().find('td:eq(1)').html();
  			$("#edit_name").val(name);
  			var birthday = $(this).parent().parent().find('td:eq(2)').html();
  			$("#edit_birthday").val(birthday);
  			var gender = $(this).parent().parent().find('td:eq(3)').html();
  			if(gender=="Nam"){
  				$('input[name=gender]:nth-child(1)').attr('checked', 'checked');
  			}else if(gender=="Nữ"){
  				$('input[name=gender]:nth-child(2)').attr('checked', 'checked');
  			}else if(gender=="Khác"){
  				$('input[name=gender]:nth-child(3)').attr('checked', 'checked');
  			}
  			var address = $(this).parent().parent().find('td:eq(4)').html();
  			$("#edit_address").val(address);
  			$("#frm-edit").on("submit",function(e){
  				e.preventDefault();
  				 var form= $('#frm-edit');
 	              var formData= form.serialize();
 	              $.ajax({
 	                type:'POST',
 	                url:  ctx+"/list", 
 	              	dataType : 'json',
 	                data:formData,	
 	               	success:function(response){
 	               		if(response.status == "SUCCESS"){
 	               			$("#modal_edit").modal('hide');
 	               			$('#tableuser').DataTable().ajax.reload();
 	               			toastr.success("Cập nhật thành công !");
 	               		}else{
 	               			console.log(response);
 	               			for(var i = 0; i < response.result.length;i++){
 	               				if(response.result[i].field=="name"){
 	               					var err_name = response.result[i].codes[3];
 	               					$("#err_edit_name").html(err_name);
 	               				}
 	               				if(response.result[i].field=="birthday"){
	               					var err_birthday = response.result[i].codes[3];
	               					$("#err_edit_birthday").html(err_birthday);
	               				}
 	               				if(response.result[i].field=="address"){
               						var err_add = response.result[i].codes[3];
               						$("#err_edit_add").html(err_add);
               					}
 	               				if(response.result[i].field=="gender"){
               						var err_gender = response.result[i].codes[3];
               						$("#err_edit_gender").html(err_birthday);
               					}
 	               			}
  	               		
	  	               	}
 	               		
 	                },
 	                error: function (xhr, ajaxOptions, thrownError)
 	                {
						toastr.error(thrownError);
 	                }
 	              });
  				
  			});
  			
  	        
  		});
  		//delete
  		$("#tableuser").on('click','.btn-delete',function(){
  			var code = $(this).attr('id');
  			swal({
  			  title: 'Bạn có chắc chắn xóa ?',
  			  text: "",
  			  type: 'warning',
  			  showCancelButton: true,
  			  confirmButtonText: 'Vâng, xóa nó!',
  			  cancelButtonText: 'Không, đừng xóa !',
  			  confirmButtonClass: 'btn btn-success',
  			  cancelButtonClass: 'btn btn-danger',
  			  buttonsStyling: false,
  			  reverseButtons: true
  			}).then((result) => {
  			  if (result.value) {
  			   /*  swal(
  			      'Deleted!',
  			      'success'
  			    ) */
  			 	 $.ajax({
		              type: "POST",
		              url: ctx+"/list",
		              data:{
		            	  action: 'delete',
		            	  id: code
		              },
		              success: function(res)
		              {
		                if(res.status=="SUCCESS") {
		                  	$('#tableuser').DataTable().ajax.reload();   
		                  	toastr.success('Xóa thành công!');
		                }
		              },
		              error: function (xhr, ajaxOptions, thrownError) {
		                toastr.error(thrownError);
		              }
		        }); 
  			  } else if (result.dismiss === swal.DismissReason.cancel) {
  			    swal(
  			      'Cancelled',
  			      'Your imaginary file is safe :)',
  			      'error'
  			    )
  			  }
  			});
  		});
});

			
	
</script>