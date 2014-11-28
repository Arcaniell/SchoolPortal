var numPerPage = 20;
var makePagesLeft = function() {
	var currentPage = 0;
	var $table = $(this);
	$table.bind('repaginate', function() {
		$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	});
	$table.trigger('repaginate');
	var numRows = $table.find('tbody tr').length;
	var numPages = Math.ceil(numRows / numPerPage);
	var $pager = $('<div></div>');
	var $bootstraplist = $('<ul class="pagination"></ul>');
	for (var page = 0; page < numPages; page++) {
		$('<li class="page-number"></li>').html("<a>" + (page + 1) + "</a>").bind('click', {
			newPage : page
		}, function(event) {
			currentPage = event.data['newPage'];
			$table.trigger('repaginate');
			$(this).addClass('active').siblings().removeClass('active');
		}).appendTo($bootstraplist).addClass('clickable');
	}
	$bootstraplist.appendTo($pager);
	//$pager.appendTo($(".smallHeader")).find('li.page-number:first').addClass('active');
	$(".left_pagination").html($pager);
	$('li.page-number:first').addClass('active');
};
var makePagesRight = function() {
	var currentPage = 0;
	var $table = $(this);
	$table.bind('repaginate', function() {
		$table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	});
	$table.trigger('repaginate');
	var numRows = $table.find('tbody tr').length;
	var numPages = Math.ceil(numRows / numPerPage);
	var $pager = $('<div></div>');
	var $bootstraplist = $('<ul class="pagination"></ul>');
	for (var page = 0; page < numPages; page++) {
		$('<li class="page-number"></li>').html("<a>" + (page + 1) + "</a>").bind('click', {
			newPage : page
		}, function(event) {
			currentPage = event.data['newPage'];
			$table.trigger('repaginate');
			$(this).addClass('active').siblings().removeClass('active');
		}).appendTo($bootstraplist).addClass('clickable');
	}
	$bootstraplist.appendTo($pager);
	//$pager.appendTo($(".smallHeader")).find('li.page-number:first').addClass('active');
	$(".right_pagination").html($pager);
	$('li.page-number:first').addClass('active');
};
$('table.paginated_right').each(makePagesRight);
$('table.paginated_left').each(makePagesLeft);
//$("ul").addClass("pagination");
$(".row_count").change(function() {
	numPerPage = $(".row_count").val();
	$('table.paginated_right').each(makePagesRight);
	$('table.paginated_left').each(makePagesLeft);
});
