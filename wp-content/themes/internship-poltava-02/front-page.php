<?php
get_header();
$rows = get_sheet_properties();
$filepath = TABLE_PATH.'price (1).xlsx';
if ($rows):
	?>
	<div class="sheet-products">
		<div class="sheet-products__categories">

		</div>
		<div class="sheet-products__table">
			<a href="<?=$filepath;?>" download="price (1).xlsx" target="_blank">Скачать Каталог</a>
			<table>
				<tr>
					<td>Наименование</td>
					<td>Цена за метр</td>
					<td>Цена за тонну</td>
					<td>Вес единицы (1м)</td>
					<td>Категория</td>
					<td>Заказ</td>
				</tr>
				<?php foreach ($rows as $row): ?>
					<tr>
						<td><?= $row[0]; ?></td>
						<td><?= $row[1]; ?></td>
						<td><?= $row[2]; ?></td>
						<td><?= $row[3]; ?></td>
						<td><?= $row[4]; ?></td>
						<td>
							<button type="button" class="buy-btn btn btn-primary" data-name="<?= $row[0]; ?>"
									data-toggle="modal"
									data-target="#formBuyModal">
								Купить
							</button>
						</td>
					</tr>
				<?php endforeach; ?>
			</table>
		</div>
		<div class="modal fade" id="formBuyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			 aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"><?= __('Сделать Заказ', 'table_td'); ?></h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="sheet-products__form">
							<form id="send-order-table" data-table-product="">
								<input name="name" type="text" required placeholder="Ваше Имя"/>
								<input name="tel_number" type="tel" required placeholder="Номер Телефона"/>
								<input name="product_name" type="hidden" id="product-name-field" value="">
								<input name="submit" type="submit" value="Отправить" style="margin-top: 20px;"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<?php get_sheet_properties(); ?>
<?php
endif;
?>
<?php
get_footer();
