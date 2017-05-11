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

<!-- MODULE Block new products -->
<hr>
<div id="new-products_block_right" class="span9 block products_block">
	<div class="row">
		<div class="span7"><div class="title_block  clearfix"><h4><span>{l s='New products' mod='blocknewproducts'}</span></h4></div></div>
		<p class="span2 module-link-md"><a href="{$link->getPageLink('new-products')|escape:'html'}" class="button_large">{l s='All new products' mod='blocknewproducts'} <i class="icon-arrow-right"></i></a></p>
	</div>
	<div class="row block_content">
	{if $new_products !== false}
		<ul class="product_images thumbnails unstyled clearfix">
		{foreach from=$new_products item='product' name='newProducts'}
			{if $smarty.foreach.newProducts.index < 5}
				<li class="span2{if $smarty.foreach.newProducts.first} first{/if}">
					<a class="thumbnail" href="{$product.link|escape:'html'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home_default')|escape:'html'}" height="124" width="124" alt="{$product.name|escape:html:'UTF-8'}" title="{$product.name|escape:html:'UTF-8'}" /></a>
					<p class="s_title_block bymd">
						<a href="{$product.link|escape:'html'}">{$product.name|strip_tags|escape:html:'UTF-8'|truncate:55:'...'}</a>
					</p>
					<p class="s_title_block">
						{if !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}<span class="price">{if $priceDisplay != 1}{displayWtPrice p=$product.price}{else}{displayWtPrice p=$product.price_tax_exc}{/if}</span>{/if}
					</p>
					<a href="{$product.link}" class="btn btn-small btn-info lnk_view">{l s='Read more' mod='blocknewproducts'} <i class="icon-chevron-right icon-white"></i></a>
				</li>
			{/if}
		{/foreach}
		</ul>
	<!-- <dl class="products">
		{foreach from=$new_products item=newproduct name=myLoop}
			<dt class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}"><a href="{$newproduct.link|escape:'html'}" title="{$newproduct.name|escape:html:'UTF-8'}">{$newproduct.name|strip_tags|escape:html:'UTF-8'}</a></dt>
			{if $newproduct.description_short}<dd class="{if $smarty.foreach.myLoop.first}first_item{elseif $smarty.foreach.myLoop.last}last_item{else}item{/if}"><a href="{$newproduct.link|escape:'html'}">{$newproduct.description_short|strip_tags:'UTF-8'|truncate:75:'...'}</a><br /><a href="{$newproduct.link}" class="lnk_more">{l s='Read more' mod='blocknewproducts'}</a></dd>{/if}
		{/foreach}
		</dl>
		<p><a href="{$link->getPageLink('new-products')|escape:'html'}" title="{l s='All new products' mod='blocknewproducts'}" class="button_large">&raquo; {l s='All new products' mod='blocknewproducts'}</a></p> -->
	{else}
		<p>&raquo; {l s='Do not allow new products at this time.' mod='blocknewproducts'}</p>
	{/if}
	</div>
</div>
<!-- /MODULE Block new products -->