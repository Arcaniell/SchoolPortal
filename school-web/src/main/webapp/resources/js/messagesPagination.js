var numPerPage = 15;

var makePages = function() {
	var currentPage = 0;
	var $table = $(this);
	$table.bind('repaginate', function() {
		$table.find('tbody tr').hide().slice(currentPage * numPerPage,
				(currentPage + 1) * numPerPage).show();
	});
	$table.trigger('repaginate');
	var numRows = $table.find('tbody tr').length;
	var numPages = Math.ceil(numRows / numPerPage);
	var $bootstraplist = $('<ul class="pagination"></ul>');
	for (var page = 0; page < numPages; page++) {
		$('<li></li>').html("<a>" + (page + 1) + "</a>").bind('click', {
			newPage : page
		}, function(event) {
			currentPage = event.data['newPage'];
			$table.trigger('repaginate');
			$(this).addClass('active').siblings().removeClass('active');
		}).appendTo($bootstraplist).addClass('clickable');
	}
	$(".pages").html($bootstraplist);
	$(".pagination li").first().addClass('active');
};

$('table.paginated').each(makePages);

$(".row_count").change(function() {
	numPerPage = $(".row_count").val();
	$('table.paginated').each(makePages);
});

$("thead").click(function() {
	setTimeout(function() {
		$("li.active").each(function() {
			this.click();
		});
	}, 50);
});