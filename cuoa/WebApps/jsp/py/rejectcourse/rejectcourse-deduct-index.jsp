<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/include/header.inc"%>
		<script type="text/javascript">
		
		
		var leaveId = "<s:property value='condition.ids'/>";
		
		 //提交
         function f_submit(){
         
         	var  url = contextPath;
         	var check = "<s:property value='condition.isCheckAttendance'/>"
         	var label = "";
			var message = "";
         	if(check == "1")
         	{
         		url = url + "/py-rejectcourse/rejectcourse!auditDelete.action"
         		label = "废除操作";
				message = "确认废除吗？";
         	}
         	else if(check == "0")
         	{
         		url = url + "/py-rejectcourse/rejectcourse!unlock.action"
         		label = "解锁操作";
				message = "确认解锁吗？";
         	}	
         	else
         		return;
         
         	confirm(label, message, function() {
		        	var param={ids:"<s:property value='condition.ids'/>"};
		        	$.post(url, param, function(json){
						if(json.success){
							alert(json.message,"success");
						  	home_fresh();
						  	closeWindow();
						}else{
							alert(json.message,"error");
						}
					});
				}); 
          }
		
		
		
	var grid = null;
	$(function() {
		var g = {
			gridid : "maingrid",
			conditon : "condition",
			url : contextPath + "/py-rejectcourse/rejectcourse!dataForDeduct.action",
			formid:"conditionForm",
			frozen: true,
			showToggleColBtn: false,
			checkbox : false,
			rownumbers:false,
			columns : [
						{ display : '考勤状态',minWidth:60, name : 'isModifyStr',isSort:false,
				         	render: function(item){
				         		var html = "";

				         			if(item.id == leaveId)
				         			{
				         				html = html + "<font color='red'>";
				         				html = html +  item.isCheckAttendanceStr;
				         				html = html + "</font >";
				         			}	
				         			else 
				         				html = html + item.isCheckAttendanceStr;
					         	return html
				         	}
				         },
			           	{display : '确认年月', minWidth:60,  name : 'verifyYearMonth',isSort:false}, 
						{ display: '分校',minWidth:60, name: 'cityName',isSort:false},
						{ display : '学期',minWidth:60, name : 'termName',isSort:false},
						{ display : '年部', minWidth:60,name : 'gtName',isSort:false},
						{ display : '年级', minWidth:80,name : 'gradeName',isSort:false},
						{ display : '学科', minWidth:60,name : 'subjectNames',isSort:false},
						{ display : '班次', minWidth:100, name : 'classlevelName',isSort:false},
						{ display : '班级名称',minWidth:150, name : 'courseName',isSort:false},
						{ display : '老师',minWidth:60, name : 'teacherNames',isSort:false},
						{ display : '班主任',minWidth:60, name : 'headteacherName',isSort:false},
						{ display : '地区', minWidth:100,name : 'areaName',isSort:false},
						{ display : '服务中心', minWidth:100,name : 'servicecenterName',isSort:false},
						{ display : '教学点', minWidth:100,name : 'venueName',isSort:false},
						{ display : '教室', minWidth:100,name : 'classroomName',isSort:false},
						{ display : '开班日期',minWidth:80, name : 'createTime',isSort:false},
						{ display : '开课日期', minWidth:80,name : 'startDate',isSort:false},
						{ display : '结课日期', minWidth:80,name : 'endDate',isSort:false},
						{ display : '上课日期', minWidth:80,name : 'createTime',isSort:false},
						{ display : '上课时间', minWidth:80,name : 'timeName',isSort:false},
						{ display : '甩班老师', minWidth:60,name : 'rejectingTeacherName',isSort:false},
						{ display : '甩班日期', minWidth:60,name : 'rejectDate',isSort:false},
						{ display : '甩班原因',minWidth:120, name : 'reason',isSort:false},
						{ display : '接课老师',minWidth:60, name : 'receivingTeacherName',isSort:false},
						{ display : '甩班类型',minWidth:60, name : 'rejectCourseTypeStr',isSort:false},
						{ display : '班级组备注',minWidth:80, name : 'remarkStr',isSort:false},
						{ display : '甩班原因分类',minWidth:150, name : 'sortOfReasonName',isSort:false},
						{ display : '具体原因分类',minWidth:150, name : 'specificSortOfReasonName',isSort:false},
						{ display : '甩班次数',minWidth:60, name : 'remark',isSort:false},
						{ display : '本学期甩班次数',minWidth:100, name : 'rejectCourseTimesOfTerm',isSort:false},
						{ display : '另扣课时',minWidth:60, name : 'deductHours',isSort:false},
						{ display : '扣课时规则',minWidth:120, name : 'deductRule',isSort:false},
						{ display : '最终扣课时',minWidth:60, name : 'finalDeductHours',isSort:false},
						{ display : '修改原因',minWidth:120, name : 'reasonForModify',isSort:false},
						{ display : '修改操作人',minWidth:120, name : 'modifierName',isSort:false},
						{ display : '状态',minWidth:60, name : 'statusStr',isSort:false},
						{ display : '审核人',minWidth:120, name : 'auditorName',isSort:false},
				        { display : '是否为班主任',minWidth:80, name : 'isHeadTeacherStr',isSort:false},
				        { display : '是否取消工资晋升资格',minWidth:150, name : 'isCancelPromoteSalaryStr',isSort:false},				         
				        { display : '是否取消全勤',minWidth:150, name : 'isCancelPerfectAttendanceStr',isSort:false},
						{ display : '是否作废',minWidth:60, name : 'isDeletedStr',isSort:false} 
						]
		};
		grid = showGrid(g);
	});
	function f_search() {
		grid.loadData();
	}
	
	
	
	
	
	
</script>
	</head>
	<body>
			<form id="conditionForm">
				<input  type="hidden" name="condition.ids" value="<s:property value='condition.ids'/>" />
			</form>
				
			</div>
			<div id="maingrid" class="grid">
			</div>


	<div class="content">
			<ul>
		   		<li>
		   			<input type="button" id="queryButton" value="确认" class="l-button"  onclick="f_submit()"/>
					<input type="button"" id="resetButton" value="取消" class="l-button" onclick="closeWindow();" />
		   		</li>
		   	</ul>
		</div>

	</body>

</html>
