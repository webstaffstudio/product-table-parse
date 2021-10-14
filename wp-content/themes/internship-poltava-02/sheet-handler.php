<?php
define("TABLE_PATH",  trailingslashit(WP_CONTENT_DIR) . 'tables-dir/'  );
add_action('admin_menu', 'table_menu_page');

function table_menu_page()
{

	add_menu_page(
		'Загрузка Таблицы', // page <title>Title</title>
		'Таблица', // menu link text
		'manage_options', // capability to access the page
		'table_uploader', // page URL slug
		'table_uploader_page_content', // callback function /w content
		'dashicons-database-import', // menu icon
		5 // priority
	);

}

function table_uploader_page_content()
{

	echo '<div class="wrap">
	<h1>Форма загрузки XLSX таблиц</h1>
	<form id="upload_table_form" method="post" style="margin-top: 30px">
	<label class="custom-file-upload">
    <input name="file" id="file" type="file" required accept=".xlsx">
    	</br>
    ' . __('Загрузите .xlsx файл.', 'table_td') . '
	</label>
	</br>
	 <input type="submit" value="Загрузить таблицу" style="margin-top: 20px;">
	';
	echo '</form></div>';

}


add_action('wp_ajax_upload_table', 'upload_table');
function upload_table()
{
	foreach ($_FILES as $file) :
		if ($file['error'] == UPLOAD_ERR_NO_FILE) :
			continue;
		endif;

		$valid_ext = array('jpg', 'jpeg', 'png', 'doc', 'docx', 'pdf', 'xls', 'xlsx');
		$extension_upload = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
		if (in_array($extension_upload, $valid_ext)) :
			$name_upload = $file['name'];
			$url_insert = TABLE_PATH;
			wp_mkdir_p($url_insert);
			$name_insert = $url_insert . $name_upload;
			$action = move_uploaded_file($file['tmp_name'], $name_insert);
			$msg_true = 'Upload ok ';
			sheet_write($name_upload);
		else :
			$msg_error = 'Upload error';
		endif;
	endforeach;

	$result = !isset($msg_error);
	$msg = array();

	if ($result) :
		$msg['error'] = 'true';
		$msg['true'] = $msg_true;
	else :
		$msg['error'] = 'false';
		$msg['false'] = $msg_error;
	endif;


	header('Content-Type: application/json');
	echo json_encode($msg);
//	$data = $_POST;
	wp_die();
}

add_action('wp_ajax_send_order_table', 'send_order_table');
add_action('wp_ajax_nopriv_send_order_table', 'send_order_table');
function send_order_table()
{
	if (isset($_POST['formData']) && $_POST['formData']):
		$data = $_POST['formData'];
		parse_str($data, $output);
		$admin_email = get_option('admin_email');
		$message = 'Новый заказ по товару <b>' . $output['product_name'] . '</b>';
		$message .= '</br>';
		$message .= 'Имя: ' . $output['name'];
		$message .= '</br>';
		$message .= 'Номер телефона: ' . $output['tel_number'];
		wp_mail($admin_email, 'Новый заказ', $message);
	endif;
	wp_die();
}

function wpse27856_set_content_type()
{
	return "text/html";
}

add_filter('wp_mail_content_type', 'wpse27856_set_content_type');


function sheet_write($name)
{
	require_once($_SERVER['DOCUMENT_ROOT'] . '/simplexlsx-master/src/SimpleXLSX.php');
//$xlsx =  SimpleXLSX::parse('price.xlsx')->toHTML();
	if ($xlsx = SimpleXLSX::parse(TABLE_PATH . $name)) {
		$subcategory_cell = $xlsx->getCell(0, 'L');
		$categories = $xlsx->sheetNames();
		$column = array_column($xlsx->rows(), 0);

		$arr = array();
		$rows = $xlsx->rows();
		$i = 0;
		foreach ($rows as $row):
			if ($i != 0):
				array_push($arr, $row);
			endif;
			$i++;
		endforeach;
		$json_data = json_encode($arr);
		file_put_contents(TABLE_PATH.'sheet-content.json', $json_data);
	}

}

function get_sheet_properties()
{
	$filename = 'sheet-content.json';
	$filepath = TABLE_PATH . $filename;
	if (file_exists($filepath)) {
		$sheet_content = file_get_contents($filepath);
		$sheet_content = json_decode($sheet_content);
		return $sheet_content;
	} else {
		return false;
	}
}

?>
