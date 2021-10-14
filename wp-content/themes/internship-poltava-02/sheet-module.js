jQuery(document).ready(function () {
	const uploadTable = () => {
		$("#upload_table_form").on("submit", function () {
			var fd = new FormData();
			var file = jQuery(document).find('input[type="file"]');
			var individual_file = file[0].files[0];
			fd.append("file", individual_file);
			fd.append('action', 'upload_table');
			let files = new FormData();
			files.append('fileName', $('#file')[0].files[0]); // append selected file to the bag named 'file'
			$.ajax({
				url: adminVars.ajaxUrl,
				type: "POST",
				data: fd,
				async: false,
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (data) {
					if (data) {
						$('#upload_table_form').html(
							'<h2>Таблица успешно загружена</h2>' +
							'</br>' +
							'<p>Данные обработаны и отображаются на странице.' +
							' Пожалуйста обновите страницу, если хотите загрузить новую таблицу.</p>'
						)
					}
				},
			});
			return false;
		});
	}
	uploadTable();
});
