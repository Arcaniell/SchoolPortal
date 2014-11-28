<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		$('#tokenfield-typeahead').tokenInput(
				"${pageContext.request.contextPath}/emailInput", {
					theme : "facebook",
					queryParam : 'tagName',
					preventDuplicates : true
				});
	});
</script>
<!-- <script type="text/javascript">
	$(function() {
		$('.animated').autosize();
	});
</script> -->

<!-- Modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog"
	aria-labelledby="composeModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Compose message</h4>
			</div>
			<div class="modal-body">

				<form action="${pageContext.request.contextPath}/compose"
					name="composeTable" class="form-horizontal" method="post"
					role="form">
					<div class="form-group">
						<label for="inputTo" class="col-sm-2 control-label">To:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="to"
								id="tokenfield-typeahead" placeholder="name or email" />
						</div>
					</div>
					<div class="form-group">
						<label for="inputSubject" class="col-sm-2 control-label">Subject:</label>
						<div class="col-sm-10">
							<input name="subject" type="text" class="form-control"
								placeholder="subject">
						</div>
					</div>
					<div class="form-group">
						<label for="inputMessage" class="col-sm-2 control-label">Message:</label>
						<div class="col-sm-10">
							<textarea placeholder="write a message..." name="text"
								class="form-control textInput animated" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" value="Send" class="btn btn-primary">Send</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
</div>