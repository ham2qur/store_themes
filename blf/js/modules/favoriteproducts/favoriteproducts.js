$(document).ready(function(){
	$('#favoriteproducts_block_extra_add').click(function(){
		$.ajax({
			url: favorite_products_url_add + '&rand=' + new Date().getTime(),
			type: "POST",
			headers: { "cache-control": "no-cache" },
			data: {
				"id_product": favorite_products_id_product
			},
			success: function(result){
				if (result == '0')
				{
			    	$('#favoriteproducts_block_extra_add').fadeOut(function() {
			    		$('#favoriteproducts_block_extra_added').fadeIn("slow");
			    	});

				}
		 	}
		});
	});
	$('#favoriteproducts_block_extra_remove').click(function(){
		$.ajax({
			url: favorite_products_url_remove + '&rand=' + new Date().getTime(),
			type: "POST",
			headers: { "cache-control": "no-cache" },
			data: {
				"id_product": favorite_products_id_product
			},
			success: function(result){
				if (result == '0')
				{
			    	$('#favoriteproducts_block_extra_remove').fadeOut(function() {
			    		$('#favoriteproducts_block_extra_removed').fadeIn("slow");
			    	});

				}
		 	}
		});
	});
	$('#favoriteproducts_block_extra_added').click(function(){
		$.ajax({
			url: favorite_products_url_remove + '&rand=' + new Date().getTime(),
			type: "POST",
			headers: { "cache-control": "no-cache" },
			data: {
				"id_product": favorite_products_id_product
			},
			success: function(result){
				if (result == '0')
				{
			    	$('#favoriteproducts_block_extra_added').fadeOut(function() {
			    		$('#favoriteproducts_block_extra_removed').fadeIn("slow");
			    	});

				}
		 	}
		});
	});
	$('#favoriteproducts_block_extra_removed').click(function(){
		$.ajax({
			url: favorite_products_url_add + '&rand=' + new Date().getTime(),
			type: "POST",
			headers: { "cache-control": "no-cache" },
			data: {
				"id_product": favorite_products_id_product
			},
			success: function(result){
				if (result == '0')
				{
			    	$('#favoriteproducts_block_extra_removed').fadeOut(function() {
			    		$('#favoriteproducts_block_extra_added').fadeIn("slow");
			    	});

				}
		 	}
		});
	});

	$('[rel^=ajax_id_favoriteproduct_]').click(function(event)
	{
        event.stopPropagation();
		var idFavoriteProduct =  $(this).attr('rel').replace('ajax_id_favoriteproduct_', '');
		var parent = $(this).parent().parent();

		$.ajax({
			url: favorite_products_url_remove,
			type: "POST",
			data: {
				'id_product': idFavoriteProduct,
				'ajax': true
			},
			success: function(result)
			{
				if (result == '0')
				{
					parent.fadeOut("normal", function()
					{
						parent.remove();
					});
				}
 		 	}
		});
	});
});