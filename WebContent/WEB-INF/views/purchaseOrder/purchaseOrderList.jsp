<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:url value="/resources/css/global.css" var="stylecss" />
<link href="${stylecss}" rel="stylesheet" />
<c:url value="/resources/js/global.js" var="confirmjs" />
<script type="text/javascript" src="${confirmjs}"></script>
<title>All Products</title>
<script type="text/javascript">
	function load() {
		var msg = '<c:if test="${!empty message}"><c:out value="${message}" /></c:if>';
		if (msg != "")
			alert(msg);
	}
</script>
<c:url value="/resources/img/b_delete.png" var="deleteImg" />
<c:url value="/resources/img/b_edit.png" var="editImg" />
<c:url value="/resources/img/b_add.png" var="addImg" />
<c:url value="/resources/img/add-small.png" var="variantImg" />

</head>
<body onload="load()">
	<h3><c:out value="${mode}" /> Purchase Orders List</h3>
	<c:if test="${!empty purchaseOrders}">
		<table align="left" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<th>SO No</th>
				<th>Date</th>
				<th>Company</th>
				<th>Total Amount</th>
				<th>Actions</th>
			</tr>
			<c:forEach items="${purchaseOrders}" var="purchaseOrder">
				<tr>
					<td><c:out value="${purchaseOrder.purchaseOrderId}" /></td>
					<td><fmt:formatDate pattern="MM-dd-yyyy"
							value="${purchaseOrder.purchaseOrderDate}" /></td>
					<td><c:out value="${purchaseOrder.supplierBean.companyName}" /></td>
					<td><c:out value="${purchaseOrder.totalCost}" /></td>
					<td align="center"><a
						href="editPurchaseOrder.html?purchaseOrderId=${purchaseOrder.purchaseOrderId}"><img src="${editImg}" /></a>
						| <a
						href="deletePurchaseOrder.html?purchaseOrderId=${purchaseOrder.purchaseOrderId}"
						onclick="return checkDelete()"><img src="${deleteImg}" /></a>
						| <a href="updatePurchaseOrder/${type}/${purchaseOrder.purchaseOrderId}"><c:out value="${type}"></c:out></a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>

</body>
</html>