<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="panel-body">
	<table class="table table-bordered table-hober">
		<thead>
			<tr>
				<th>번호</th>
				<th>식당명</th>
				<th>도로주소</th>
				<th>지번주소</th>
				<th>식당번호</th>
				<th>업태명</th>
				<th>허가명</th>
				<th>식당설명</th>
			</tr>
		</thead>
		<tbody>
		    <c:forEach var="vo" items="${vo }" varStatus="loop">
				<tr>
					<td>${vo.id}</td>
					<td>${vo.resturantName}</td>
					<td>${vo.loadaddress}</td>
					<td>${vo.address }</td>
					<td>${vo.restPhone }</td>
					<td>${vo.restSector }</td>
					<td>${vo.restSectorName }</td>
					<td>${vo.restContent }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>