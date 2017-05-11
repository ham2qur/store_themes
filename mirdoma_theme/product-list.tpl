{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($products)}
	<!-- Products list -->
	<ul id="product_list" class="row">
	{foreach from=$products item=product name=products}
		<li class="ajax_block_product {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{/if} {if $smarty.foreach.products.index % 2}alternate_item{else}item{/if} span9 clearfix">
			<div class="row">
				<div class="left_block span2">
					<a href="{$product.link|escape:'html':'UTF-8'}" class="product_img_link thumbnail">
						<img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" alt="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" title="{if !empty($product.legend)}{$product.legend|escape:'html':'UTF-8'}{else}{$product.name|escape:'html':'UTF-8'}{/if}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} />
						{if isset($product.new) && $product.new == 1}<span class="new">{l s='New'}</span>{/if}
					</a>
				</div>
				<div class="center_block span5">
					<h3>{if isset($product.pack_quantity) && $product.pack_quantity}{$product.pack_quantity|intval|cat:' x '}{/if}<a href="{$product.link|escape:'html':'UTF-8'}">{$product.name|escape:'html':'UTF-8'}</a></h3>
					<div class="product_desc">{$product.description_short}</div>
					<a class="btn btn-small btn-info lnk_view" href="{$product.link|escape:'html':'UTF-8'}">{l s='View'} <i class="icon-chevron-right icon-white"></i></a>
				</div>
				<div class="right_block span2">
					{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<span class="on_sale">{l s='On sale!'}</span>
					{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<div><span class="label label-important">{l s='Reduced price!'}</span></div>{/if}
					{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
					<div class="content_price">
						{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}<span class="price" style="display: inline;">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span><br />{/if}
						{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}<span class="availability">{if ($product.allow_oosp || $product.quantity > 0)}{l s='Available'}{elseif (isset($product.quantity_all_versions) && $product.quantity_all_versions > 0)}{l s='Product available with different options'}{else}{l s='Out of stock'}{/if}</span>{/if}
					</div>
					{if isset($product.online_only) && $product.online_only}<span class="online_only">{l s='Online only'}</span>{/if}
					{/if}
					{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && $product.minimal_quantity <= 1 && $product.customizable != 2 && !$PS_CATALOG_MODE}
						{if ($product.allow_oosp || $product.quantity > 0)}
							{if isset($static_token)}
								<a class="btn btn-small ajax_add_to_cart_button exclusive" data-cartprod="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}", false)|escape:'html':'UTF-8'}"><i class="icon-shopping-cart"></i> {l s='Add to cart'}</a>
							{else}
								<a class="btn btn-small ajax_add_to_cart_button exclusive" data-cartprod="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart',false, NULL, "add=1&amp;id_product={$product.id_product|intval}", false)|escape:'html':'UTF-8'}"><i class="icon-shopping-cart"></i> {l s='Add to cart'}</a>
							{/if}						
						{else}
							<span class="exclusive btn btn-small disabled"><i class="icon-ban-circle"></i> {l s='Add to cart'}</span>
						{/if}
					{/if}
					{if isset($comparator_max_item) && $comparator_max_item}
						<p class="compare">
							<label for="comparator_item_{$product.id_product}" class="checkbox">{l s='Select to compare'}<input type="checkbox" class="comparator" id="comparator_item_{$product.id_product}" value="comparator_item_{$product.id_product}" {if isset($compareProducts) && in_array($product.id_product, $compareProducts)}checked="checked"{/if} autocomplete="off"/></label>
						</p>
					{/if}
				</div>
			</div>
			{if !$smarty.foreach.products.last}<hr>{/if}
		</li>
	{/foreach}
	</ul>
	<!-- /Products list -->
{/if}
