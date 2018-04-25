<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@include file="header.jsp"%>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Quản lý người dùng
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Danh mục quản lý</a></li>
        <li class="active">Quản lý người dùng</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="box">
      	<div class="box-header with-border">
				<h3 style="float:left;" class="box-title">Danh sách người dùng </h3>
				<div>
					 <!-- Button trigger modal -->
  		<a style="float:right;" data-toggle="modal" href="#myModal" class="btn btn-primary btn-md"><i class="fa fa-user-plus" aria-hidden="true"></i> Thêm mới</a>

		  <!-- Modal -->
		  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Thêm mới người dùng</h4>
		        </div>
		        <div class="modal-body">
		<form:form modelAttribute="addUser" action="add" method="post">
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control" required="required" id="name" placeholder="Họ và tên"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Ngày sinh</label>
			<div class="col-sm-10">
				<form:input path="birthday" type="text" class="form-control datepicker" id="birthday" required="required" placeholder="Ngày sinh"/>
			</div>
		</div>
		<div class="form-group row">
		
			<label class="col-sm-2">Giới tính</label>
			<div class="col-sm-10">
			<form:radiobutton path="gender" required="required" value="1"/>Nam
			<form:radiobutton path="gender" required="required" value="2"/>Nữ 
			<form:radiobutton path="gender" required="required" value="3"/>Khác
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Địa chỉ</label>
			<div class="col-sm-10">
				<form:input path="address" type="text" class="form-control" id="address" required="required" placeholder="Địa chỉ"/>
			</div>
		</div>
		</div>
		
		        <div class="modal-footer">
		          <form:button  type="button" class="btn btn-default" data-dismiss="modal">Hủy</form:button>
		          <form:button type="submit" class="btn btn-primary">Thêm mới</form:button>
		        </div>
		 </form:form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
		  
				</div>
		</div>
		<div class="box-body">
       		<table id="tableuser" class="table table-striped table-responsive table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Họ và tên</th>
						<th>Giới tính</th>
						<th>Ngày sinh</th>
						<th>Địa chỉ</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">
						<tr>
							<td><c:out value="${user.id}"></c:out></td>
							<td><c:out value="${user.name}"></c:out></td>
							<td>
								<c:if test="${user.gender==1}">
									<c:out value="Nam"></c:out>
								</c:if>
								<c:if test="${user.gender==2}">
									<c:out value="Nữ"></c:out>
								</c:if>
								<c:if test="${user.gender==3}">
									<c:out value="Khác"></c:out>
								</c:if>
							
							</td>
							<td><c:out value="${user.birthday}"></c:out></td>
							<td><c:out value="${user.address}"></c:out></td>
							<td>
								<a  class="btn btn-primary btn-sm purple edit"
									data-toggle="modal" href="#edit${user.id}" title='Sửa'><i
										class="fa fa-pencil-square-o" aria-hidden="true"></i> Sửa</a> 
								<a id="${user.id}" data-id="${user.id}" onclick="deleteUser(${user.id})" class="btn btn-danger btn-sm delete" href="javascript:;" title='Xóa'><i id="delete" class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a></td>
							</td>
						</tr>
						 <!-- Modal sửa -->
		  <div class="modal fade" id="edit${user.id}" tabindex="-1" role="dialog" aria-labelledby="${user.id}" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Sửa thông tin người dùng</h4>
		        </div>
		        <div class="modal-body">
		<form:form modelAttribute="addUser" action="edit" method="post">
		<form:input path="id" type="hidden" class="form-control" id="id" value="${user.id }"/>
		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 form-control-label">Họ và tên</label>
			<div class="col-sm-10">
				<form:input path="name" type="text" class="form-control" id="name" placeholder="Họ và tên" value="${user.name }"/>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Ngày sinh</label>
			<div class="col-sm-10">
				<form:input path="birthday" type="text" class="form-control datepicker" id="birthday" placeholder="Ngày sinh" value="${user.birthday}"/>
			</div>
		</div>
		<div class="form-group row">
		
			<label class="col-sm-2">Giới tính</label>
			<div class="col-sm-10">
			<form:radiobutton path="gender" value="1" checked="${user.gender == 1 ? 'checked' : '' }"/>Nam
			<form:radiobutton path="gender" value="2" checked="${user.gender == 2 ? 'checked' : '' }"/>Nữ 
			<form:radiobutton path="gender" value="3" checked="${user.gender == 3 ? 'checked' : '' }"/>Khác
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword3" class="col-sm-2 form-control-label">Địa chỉ</label>
			<div class="col-sm-10">
				<form:input path="address" type="text" class="form-control" id="address" placeholder="Địa chỉ" value="${user.address}"/>
			</div>
		</div>
		</div>
		
		        <div class="modal-footer">
		          <form:button  type="button" class="btn btn-default" data-dismiss="modal">Hủy</form:button>
		          <form:button type="submit" class="btn btn-primary"> Cập nhật</form:button>
		        </div>
		 </form:form>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		  </div><!-- /.modal -->
		  
				</div>
					</c:forEach>
				</tbody>
		</table>
		</div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="footer.jsp"%>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$('.datepicker').datepicker({
  		    format: 'dd/mm/yyyy'
  		});
  	});
	function deleteUser(x){
		var ctx = "${pageContext.request.contextPath}";
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
			    swal(
			      'Deleted!',
			      'Your file has been deleted.',
			      'success'
			    )
			    window.location.href = 'http://localhost:8080'+ctx+'/delete?id='+x;
			  } else if (result.dismiss === swal.DismissReason.cancel
			  ) {
			    swal(
			      'Cancelled',
			      'Your imaginary file is safe :)',
			      'error'
			    )
			  }
			});
			
	}
</script>