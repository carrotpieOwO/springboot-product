<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Product</h2>
	<button id="all">전체보기</button>
	<button id="kitchen">주방용품</button>
	<button id="food">음식</button>
	<button id="price">가격순</button>
	<button id="order">주문순</button>

	<table border="1">

		<tr>
			<th>id</th>
			<th>name</th>
			<th>price</th>
			<th>order</th>
			<th>type</th>
		</tr>
		<c:forEach var="product" items="${products}">

			<tr id="list">
				<td class="item">${product.id}</td>
				<td class="item">${product.name}</td>
				<td class="item">${product.price}</td>
				<td class="item">${product.count}</td>
				<td class="item">${product.type}</td>
			</tr>
		</c:forEach>
	</table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<script>

		// 0  전체, 1 주방, 2 음식
		var type = '전체보기'; 
	
		var sort;
		function all(){
			$.ajax({
				type : 'GET',
				url : '/product/list',
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		}
			all();

	
		$('#all').on('click', function() {

			type = '전체보기';
			
			$.ajax({
				type : 'GET',
				url : '/product/list',
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		});
						

		$('#kitchen').on('click', function() {

			type = '주방용품';
			
			$.ajax({
				type : 'GET',
				url : '/product/' + '주방용품',
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		});

		$('#food').on('click', function() {

			type = '음식';
			
			$.ajax({
				type : 'GET',
				url : '/product/' + '음식',
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		});

		$('#price').on('click', function() {


			$.ajax({
				type : 'GET',
				url : '/product/price/' + type,
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});

			
			/* list = sort.sort(function(a, b) {
				return a.price < b.price ? -1 : a.price > b.price ? 1 : 0;
			});
			var res = "";
			for (var i = 0; i < list.length; i++) {
				var id = list[i].id;
				var name = list[i].name;
				var price = list[i].price;
				var count = list[i].count;
				var type = list[i].type;

				res += "<tr class='item'>";
				res += "<td class='item'>" + id + "</td>";
				res += "<td class='item'>" + name + "</td>";
				res += "<td class='item'>" + price + "</td>";
				res += "<td class='item'>" + count + "</td>";
				res += "<td class='item'>" + type + "</td>";
				res += "</tr>";
			}
			$('.item').remove();
			$('#list').after(res); */
		});

		/* $('#price').on('click', function() {

			$.ajax({
				type : 'GET',
				url : '/product/price',
				dataType : 'json'
			}).done(function(products) {
				var products = products;
				var res = "";

				for (var i = 0; i < products.length; i++) {
					var id = products[i].id;
					var name = products[i].name;
					var price = products[i].price;
					var count = products[i].count;
					var type = products[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		}); */

		$('#order').on('click', function() {
			$.ajax({
				type : 'GET',
				url : '/product/order/' + type,
				dataType : 'json'
			}).done(function(products) {

				sort = products;
				var res = "";

				for (var i = 0; i < sort.length; i++) {
					var id = sort[i].id;
					var name = sort[i].name;
					var price = sort[i].price;
					var count = sort[i].count;
					var type = sort[i].type;

					res += "<tr class='item'>";
					res += "<td class='item'>" + id + "</td>";
					res += "<td class='item'>" + name + "</td>";
					res += "<td class='item'>" + price + "</td>";
					res += "<td class='item'>" + count + "</td>";
					res += "<td class='item'>" + type + "</td>";
					res += "</tr>";
				}
				$('.item').remove();
				$('#list').after(res);

			});
		});
		
	</script>
</body>
</html>