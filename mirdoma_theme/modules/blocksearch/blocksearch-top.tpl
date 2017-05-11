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
<!-- block seach mobile -->
{if isset($hook_mobile)}
<div class="input_search" data-role="fieldcontain">
	<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox">
		<input type="hidden" name="controller" value="search" />
		<input type="hidden" name="orderby" value="position" />
		<input type="hidden" name="orderway" value="desc" />
		<input class="search_query" type="search" id="search_query_top" name="search_query" placeholder="{l s='Search' mod='blocksearch'}" value="{$search_query|escape:'htmlall':'UTF-8'|stripslashes}" />
	</form>
</div>
{else}
<!-- Block search module TOP -->


<div class="contacts_block_top_md span8">
	<div class="row">

		<div class="span4">
			<p><a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'html':'UTF-8'}"><img class="logo" src="{$logo_url}" alt="{$shop_name|escape:'html':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if}/></a></p>
		</div>

		<div class="span4" style="width: 350px;">
			<div class="row">
		    	<div style="margin-bottom: 10px; width: 140px; float: left;" class="span2">
		    		<i class="icon-md-direction"></i> <a style="font-size: 15px;" href="http://www.mirdoma.com.ua/contact-form.php">Контакты</a>
		    	</div>
		    	<div style="margin-bottom: 10px; width: 190px; float: left;" class="span2">
		    		<a href="http://www.mirdoma.com.ua/content/1-dostavka-i-oplata" style="font-size: 15px;"><i class="icon-md-lorry"></i> Доставка <i class="icon-md-coins-in-hand"></i> Оплата</a>
		    	</div>
			</div>
			<div style="font-size:21px; line-height: 25px; " class="row">
				<div class="span4" style="margin-bottom: 5px; width: 165px;">
			    	<i class="icon-md-telephone"></i> <span class="muted">056</span> 734-07-13
				</div>
			    <div class="span4" style="margin-bottom: 5px; width: 165px;">
					<i style="" class="icon-md-kyivstar"></i> <span class="muted">068</span> 917-39-40
			    </div>
			    <div class="span4" style="margin-bottom: 5px; width: 165px;">
			    	<i class="icon-md-mts"></i> <span class="muted">095</span> 487-00-35
			    </div>
			</div>
		</div>

	</div>


	<div class="row">
		<div id="search_block_top" class="span8">
			<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox">
				<div class="input-append">
					<label for="search_query_top"><!-- image on background --></label>
					<input type="hidden" name="controller" value="search" />
					<input type="hidden" name="orderby" value="position" />
					<input type="hidden" name="orderway" value="desc" />
					<input class="search_query span8" onfocus="if(this.value=='{l s='Search' mod='blocksearch'}') this.value='';" onblur="if(this.value=='') this.value='{l s='Search' mod='blocksearch'}';" type="text" id="search_query_top" name="search_query" value="{if isset($smarty.get.search_query)}{$smarty.get.search_query|htmlentities:$ENT_QUOTES:'utf-8'|stripslashes}{else}{l s='Search' mod='blocksearch'}{/if}" />
					<button style="border-color: #ff9d44; border-width: 2px 2px 2px 1px;" type="submit" name="submit_search" title="{l s='Search' mod='blocksearch'}" class="btn"><i class="icon-search"></i></button>
				</div>
			</form>
		</div>
	</div>
</div>
{include file="$self/blocksearch-instantsearch.tpl"}
{/if}
<!-- /Block search module TOP -->
