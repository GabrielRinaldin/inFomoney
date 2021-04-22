<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="entity.Moeda"%>
<%@ page import="java.util.ArrayList"%>
<%
ArrayList<Moeda> lista = (ArrayList<Moeda>) request.getAttribute("listaTodas");
%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">

<script
	src="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/js/adminlte.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/admin-lte@3.1/dist/css/adminlte.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
#content-tabble {
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 0.9em;
	min-width: 400px;
	overflow: hidden;
	border-radius: 5px 5px 0 0;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

#content-tabble tbody tr {
	border-bottom: 1px solid #dddddd;
}

#content-tabble tbody tr:nth-of-type(even) {
	background-color: #f3f3f3;
}

#content-tabble tbody tr:last-of-type {
	border-bottom: 2px solid #009879;
}

#content-tabble tbody tr.active-row {
	font-weight: bold;
	color: Grey;
}

#BT {
	height: 75px;
	width: 200px;
	color: Black;
	border-radius: 5px;
	border-bottom-left-radius: inherit;
	font-size: 13px;
	font-style: oblique;
	overflow: hidden;
	border-radius: 5px 5px 0 0;
	box-shadow: 0 0 20px rgba(0, 0, 0,2);
}

#BTAtualizar
{

	height: 75px;
	width: 200px;
	/*background-clip: content-box;*/
	border-radius: 5px;
	border-bottom-left-radius: inherit;
	font-size: 14px;
	font-style: oblique;
	overflow: hidden;
	border-radius: 5px 5px 0 0;
	box-shadow: 0 0 20px rgba(0, 0, 0, 2);

}

#content-tabble th {
	background-color: red;
	font-size-adjust: none;
}

body h1 {
	font-style: italic;
	font-size: 30px;
	
}

.sidebar
{
   color: white;
  background-color: black;
    height: 75px;
	width: 200px;
	/*background-clip: content-box;*/
	border-radius: 5px;
	border-bottom-left-radius: inherit;
	font-size: 20px;
	font-style: oblique;
	/*overflow: hidden;*/
	border-radius: 5px 5px 0 0;
	box-shadow: 0 0 20px rgba(0, 0, 0, 2);


}

.main-footer
{
 Color:black;
 text-align: center;
 font-style: oblique;
 font-size: 15px;
}

.titulo{

 Color:black;
 text-align: center;
 font-style: oblique;
 font-size: 30px;
}
</style>

</head>
<body>
	<nav>
		<!-- Left navbar links -->
		<ul>
			<li >
				<h1 class="titulo">Infomoney Cotações </h1>
			</li>
		</ul>
	</nav>
	<aside class="main-sidebar sidebar-grey-primary elevation-4">
		<div class="sidebar">
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<li class="nav-item"><a href="Dashboard.jsp" class="nav-link">
							<i class="nav-icon fas fa-home" ></i>
							<p >Dashboard</p>
							
							
					</a></li>
				</ul>
				
			</nav>
		</div>
		<div class="col-lg-1" style="left: 10px">
				<button type="button" value="USD" name="dolar"
					class="btn btn-default codecoin" id="BT" data-toggle="modal"
					data-target="#modal-xl">Dólar Americano/Real Brasileiro</button>
				<button type="button" value="AUD" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Dólar
					Australiano/Real Brasileiro</button>
				<button type="button" value="CAD" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Dólar
					Canadense/Real Brasileiro</button>
				<button type="button" value="EUR" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Euro/Real
					Brasileiro</button>
				<button type="button" value="CHF" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Franco
					Suíço/Real Brasileiro</button>
				<button type="button" value="JPY" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Iene
					Japonês/Real Brasileiro</button>
				<button type="button" value="GBP" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Libra
					Esterlina/Real Brasileiro</button>
				<button type="button" value="ILS" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Novo
					Shekel Israelense/Real Brasileiro</button>
				<button type="button" value="ARS" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Peso
					Argentino/Real Brasileiro</button>
				<button type="button" value="CNY" class="btn btn-default codecoin"
					id="BT" data-toggle="modal" data-target="#modal-xl">Yuan
					Chinês/Real Brasileiro</button>
					<form action="dollar" method="POST">
				<button class="btn btn-danger" type="submit" id = "BTAtualizar">Atualizar
					valores</button>
			</form>
			</div>
		
		
	</aside>
	<div class="container-fluid">
		<div class="row">
			<div class="col-8" style="left: 400px">
				<div class="card">
					<!-- /.card-header -->
					<div class="card-body table-responsive p-0" style="height: 790px;">
						<table class="table table-head-fixed text-nowrap"
							id="content-tabble">
							<thead>
								<tr>
									<th>CODE</th>
									<th>NAME</th>
									<th>COMPRA</th>
									<th>Venda</th>
									<th>Maximo</th>
									<th>Minimo</th>
									<th>Diferença</th>
									<th>Variacao</th>
									<th>% Variacao</th>
									<th>Conversão</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (int i = 0; i < lista.size(); i++) {
								%>
								<tr class="active-row">
									<td><%=lista.get(i).getCode()%></td>
									<td><%=lista.get(i).getName()%></td>
									<td><%=lista.get(i).getCompra()%></td>
									<td><%=lista.get(i).getVenda()%></td>
									<td><%=lista.get(i).getMaximo()%></td>
									<td><%=lista.get(i).getMinimo()%></td>
									<td><%=lista.get(i).getDiferenca_maxima_minima()%></td>
									<td><%=lista.get(i).getVariacao()%></td>
									<td><%=lista.get(i).getPorcentagem_de_variacao()%></td>
									<td><%=lista.get(i).getValor_convertido()%></td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="modal-xl" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title"></h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="card-body table-responsive p-0" style="height: 790px;">
						<table class="table table-head-fixed text-nowrap"
							id="content-tabble">
							<thead>
								<tr class="active-row">
									<th>CODE</th>
									<th>NAME</th>
									<th>COMPRA</th>
									<th>Venda</th>
									<th>Maximo</th>
									<th>Minimo</th>
									<th>Diferença</th>
									<th>Variacao</th>
									<th>% Variacao</th>
									<th>Conversão</th>
								</tr>
							</thead>
							<tbody id="openmodal">
							</tbody>
						</table>
						<div id="drawCurveTypes" style="border: 1px solid #ccc"></div>
					</div>
					<div class="modal-footer justify-content-between">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="main-footer">
		<strong>Infomoney <a
			href="https://github.com/GabrielRinaldin/inFomoney"> GitHub</a>.
		</strong> All rights reserved.
		<div class="float-right d-none d-sm-inline-block">
		</div>
	</footer>

	<script>
		$(document)
				.ready(
						function() {

							$(".codecoin")
									.click(
											function() {

												let value = this
														.getAttribute('value');
												$("#openmodal").empty();
												$("#drawChartVariacao").empty();
												$
														.ajax({
															type : "GET",
															url : "umamoeda",
															data : {
																'code' : value,
															},
															success : function(
																	data) {
																$(
																		".modal-title")
																		.text(
																				data[0].name)
																$
																		.each(
																				data,
																				function(
																						i,
																						item) {
																					$(
																							"#openmodal")
																							.append(
																									'<tr>')
																							.append(
																									'<td>'
																											+ item.code
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.name
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.compra
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.venda
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.maximo
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.minimo
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.diferenca_maxima_minima
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.variacao
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.porcentagem_de_variacao
																											+ '</td>')
																							.append(
																									'<td>'
																											+ item.valor_convertido
																											+ '</td>')
																							.append(
																									'</tr>')
																				});
															}
														})

												$
														.ajax({
															type : "GET",
															url : "umamoeda",
															data : {
																'code' : value,
															},
															dataTYPE : "JSON",
															success : function(
																	result) {
																google.charts
																		.load(
																				'current',
																				{
																					'packages' : [ 'corechart' ]
																				});
																google.charts
																		.setOnLoadCallback(function() {
																			drawCurveTypes(result);
																		});
															}
														});
												function drawCurveTypes(result) {
													var dataLine = new google.visualization.DataTable();
													dataLine.addColumn(
															'string', 'Data');
													dataLine.addColumn(
															'number',
															'Variação');
													var dataArray = [];
													$
															.each(
																	result,
																	function(i,
																			obj) {
																		dataArray
																				.push([
																						obj.data_de_criacao,
																						obj.porcentagem_de_variacao, ]);
																	});
													dataLine.addRows(dataArray);
													var options = {
														width : 1100,
														height : 500,
														series : {
															01 : {
																curveType : 'function'
															}
														}
													};

													var chart = new google.visualization.LineChart(
															document
																	.getElementById('drawCurveTypes'));
													chart.draw(dataLine,
															options);
												}

											});

						});
	</script>
</body>
</html>