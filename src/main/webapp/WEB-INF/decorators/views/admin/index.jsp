<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0">User Management</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">User</li>
					</ol>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	<!-- /.content-header -->

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<!-- Info boxes -->
			<div class="row">
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box">
						<span class="info-box-icon bg-info elevation-1"><i
							class="far fa-kiss-beam"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Website Visits</span> <span
								class="info-box-number"> 20 </span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-danger elevation-1"><i
							class="fas fa-thumbs-up"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Likes</span> <span
								class="info-box-number">15</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->

				<!-- fix for small devices only -->
				<div class="clearfix hidden-md-up"></div>

				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-success elevation-1"><i
							class="fas fa-shopping-cart"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Purchase Quantity</span> <span
								class="info-box-number">${totalbuy }</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-warning elevation-1"><i
							class="fas fa-users"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">New Member</span> <span
								class="info-box-number">${userNumber}</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">Monthly summary report</h5>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="row">
								<div class="col-md-8">
									<p class="text-center">
										<strong>Customers Buy Courses: January - July 2021</strong>
									</p>

									<div class="chart">
										<!-- Sales Chart Canvas -->
										<canvas id="salesChart" height="180" style="height: 180px;"></canvas>
									</div>
									<!-- /.chart-responsive -->
								</div>
								<!-- /.col -->
								<div class="col-md-4">
									<p class="text-center">
										<strong>User Statistics</strong>
									</p>

									<div class="progress-group">
										Add to cart <span class="float-right"><b>${cartq }</b>/${userq}</span>
										<div class="progress progress-sm">
											<div class="progress-bar bg-primary"
												style="width: ${addToCart}%"></div>
										</div>
									</div>
									<!-- /.progress-group -->

									<div class="progress-group">
									Complete purchase <span class="float-right"><b>${purchaseq }</b>/${cartq }</span>
										<div class="progress progress-sm">
											<div class="progress-bar bg-danger"
												style="width: ${completePurchase}%"></div>
										</div>
									</div>

									<!-- /.progress-group -->
									<div class="progress-group">
										<span class="progress-text">Visited the store</span> <span
											class="float-right"><b>14</b>/20</span>
										<div class="progress progress-sm">
											<div class="progress-bar bg-success" style="width: 60%"></div>
										</div>
									</div>

									<!-- /.progress-group -->
									<div class="progress-group">
										Send feedback <span class="float-right"><b>4</b>/7</span>
										<div class="progress progress-sm">
											<div class="progress-bar bg-warning" style="width: 56%"></div>
										</div>
									</div>
									<!-- /.progress-group -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- ./card-body -->
						<div class="card-footer">
							<div class="row">
								<div class="col-sm-3 col-6">
									<div class="description-block border-right">
										<span class="description-percentage text-success"><i
											class="fas fa-caret-up"></i> 27%</span>
										<h5 class="description-header">16</h5>
										<span class="description-text">Website Visits</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-6">
									<div class="description-block border-right">
										<span class="description-percentage text-warning"><i
											class="fas fa-caret-up"></i> 5%</span>
									<h5 class="description-header">${userNumber }</h5>
										<span class="description-text">Members</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-6">
									<div class="description-block border-right">
										<span class="description-percentage text-success"><i
											class="fas fa-caret-up"></i> 35%</span>
										<h5 class="description-header">${totalbuy }</h5>
										<span class="description-text">Purchase Quantity</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-6">
									<div class="description-block">
										<span class="description-percentage text-danger"><i
											class="fas fa-caret-down"></i> 19%</span>
										<h5 class="description-header">39</h5>
										<span class="description-text">Likes</span>
									</div>
									<!-- /.description-block -->
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.card-footer -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<!-- Main row -->
			<div class="row">
				<!-- Left col -->
				<div class="col-md-8">
					<!-- MAP & BOX PANE -->
					<!-- /.card -->
					<div class="row">
						<div class="col-md-6">
							<!-- DIRECT CHAT -->
							<div class="card direct-chat direct-chat-warning">
								<div class="card-header">
									<h3 class="card-title">Chat online</h3>

									<div class="card-tools">
										<span title="3 New Messages" class="badge badge-warning">3</span>
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool" title="Contacts"
											data-widget="chat-pane-toggle">
											<i class="fas fa-comments"></i>
										</button>
									</div>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages">
										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Hoang Kiet</span> <span
													class="direct-chat-timestamp float-right">23 Jan
													2:00 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="asset/dist/img/ad.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Do you have kali linux ?
											</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Vo Trinh</span> <span
													class="direct-chat-timestamp float-left">23 Jan 2:05
													pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="asset/dist/img/user3-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">No, I only have ubuntu</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message. Default to the left -->
										<div class="direct-chat-msg">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-left">Hoang Kiet</span> <span
													class="direct-chat-timestamp float-right">23 Jan
													5:37 pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="asset/dist/img/ad.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Can I eat it</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

										<!-- Message to the right -->
										<div class="direct-chat-msg right">
											<div class="direct-chat-infos clearfix">
												<span class="direct-chat-name float-right">Vo Trinh</span> <span
													class="direct-chat-timestamp float-left">23 Jan 6:10
													pm</span>
											</div>
											<!-- /.direct-chat-infos -->
											<img class="direct-chat-img"
												src="asset/dist/img/user3-128x128.jpg"
												alt="message user image">
											<!-- /.direct-chat-img -->
											<div class="direct-chat-text">Of course it's delicious
												:)</div>
											<!-- /.direct-chat-text -->
										</div>
										<!-- /.direct-chat-msg -->

									</div>
									<!--/.direct-chat-messages-->

								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<form action="#" method="post">
										<div class="input-group">
											<input type="text" name="message"
												placeholder="Type Message ..." class="form-control">
											<span class="input-group-append">
												<button type="button" class="btn btn-warning">Send</button>
											</span>
										</div>
									</form>
								</div>
								<!-- /.card-footer-->
							</div>
							<!--/.direct-chat -->
						</div>
						<!-- /.col -->

						<div class="col-md-6">
							<!-- USERS LIST -->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">Members</h3>

									<div class="card-tools">
										<span class="badge badge-danger">${userNumber} New Members</span>
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>


								</div>
								<!-- /.card-header -->
								<div class="card-body p-0">
									<ul class="users-list clearfix">
										<c:forEach items="${users}" var="users">
											<li><img
												src="<c:url value = "/assets/images/avatar/${users.avatar}"/>"
												alt="User Image"> <a class="users-list-name" href="#">${users.fullname}</a>
												<span class="users-list-date">${users.date}</span>
											</li>
										</c:forEach>

									</ul>
									<!-- /.users-list -->
								</div>
								<!-- /.card-body -->
								<div class="card-footer text-center">
									<a href="javascript:">See more</a>
								</div>
								<!-- /.card-footer -->
							</div>
							<!--/.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- TABLE: LATEST ORDERS -->
					<div class="card">
						<div class="card-header border-transparent">
							<h3 class="card-title">Latest Orders</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body p-0">
							<div class="table-responsive">
								<table class="table m-0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Date</th>
											<th>Username</th>
											<th>Payment Method</th>
											<th>Status</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="lo" items="${latestorder}">
											<tr>
												<td><a href="pages/examples/invoice.html">${lo.idco }</a></td>
												<td>${lo.date }</td>
												<td>${lo.username}</td>
												<td>${lo.pmethod}</td>
												<c:choose>
													<c:when test="${lo.status == 'Completed'}">
														<td><span class="badge badge-success">${lo.status }</span></td>
													</c:when>
													<c:when test ="${lo.status == 'Pending'}">
														<td><span class="badge badge-danger">${lo.status }</span></td>
													</c:when>
													<c:otherwise>
														<td><span class="badge badge-warning">${lo.status }</span></td>
													</c:otherwise>
												</c:choose>
												<td>${lo.total }</td>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.card-body -->
						
						<!-- /.card-footer -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->

				<div class="col-md-4">

					<!-- /.info-box -->
					<div class="info-box mb-3 bg-danger">
						<span class="info-box-icon"><i
							class="fas fa-cloud-download-alt"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Download the product</span> <span
								class="info-box-number">4381</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->
					<div class="info-box mb-3 bg-info">
						<span class="info-box-icon"><i class="far fa-comment"></i></span>

						<div class="info-box-content">
							<span class="info-box-text">Chat online</span> <span
								class="info-box-number">1921</span>
						</div>
						<!-- /.info-box-content -->
					</div>
					<!-- /.info-box -->

					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Browser</h3>

							<div class="card-tools">
								<button type="button" class="btn btn-tool"
									data-card-widget="collapse">
									<i class="fas fa-minus"></i>
								</button>
								<button type="button" class="btn btn-tool"
									data-card-widget="remove">
									<i class="fas fa-times"></i>
								</button>
							</div>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<div class="row">
								<div class="col-md-8">
									<div class="chart-responsive">
										<canvas id="pieChart" height="150"></canvas>
									</div>
									<!-- ./chart-responsive -->
								</div>
								<!-- /.col -->
								<div class="col-md-4">
									<ul class="chart-legend clearfix">
										<li><i class="far fa-circle text-danger"></i> Chrome</li>
										<li><i class="far fa-circle text-success"></i> Coc Coc</li>
										<li><i class="far fa-circle text-warning"></i> FireFox</li>
										<li><i class="far fa-circle text-info"></i> Google</li>
										<li><i class="far fa-circle text-primary"></i> Opera</li>
									</ul>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>

					</div>
					<!-- /.card -->

					<!-- PRODUCT LIST -->
					<div class="card">
						<div class="card-header border-0">
							<h3 class="card-title">Loyal Customers</h3>
							<div class="card-tools"></div>
						</div>
						<div class="card-body table-responsive p-0">
							<table class="table table-striped table-valign-middle">
								<thead>
									<tr>
										<th></th>
										<th style="text-align: center;">Name</th>
										<th style="text-align: center;">Purchased</th>
										<th style="text-align: center;">Total Order</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lc" items="${loyalcus}">
										<tr>
											<td><img src="asset/images/avatar/${lc.avt}"
												alt="avatar1" class="img-circle img-size-32 mr-2" /></td>
											<td><p style="text-align: center;">${lc.username}</p></td>
											<td style="text-align: center;">$${lc.totalmoney }</td>
											<td style="text-align: center;">${lc.totalorder }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /.card-footer -->
					</div>
					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!--/. container-fluid -->
	</section>
	<!-- /.content -->
</div>