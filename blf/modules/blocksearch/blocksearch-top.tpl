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
	<div id="search">
		<form method="get" action="{$link->getPageLink('search')|escape:'html'}" id="searchbox">
			<p>
				<label for="search_query_top"><!-- image on background --></label>
				<input type="hidden" name="controller" value="search" />
				<input type="hidden" name="orderby" value="position" />
				<input type="hidden" name="orderway" value="desc" />
				<input type="submit" name="submit_search" value="{l s='Search' mod='blocksearch'}" class="button" />
				<input class="search_query" type="text" id="search_query_top" name="search_query" value="{$search_query|escape:'htmlall':'UTF-8'|stripslashes}" placeholder="{l s='Search' mod='blocksearch'}"/>
			</p>
		</form>
	</div>
	{include file="$self/blocksearch-instantsearch.tpl"}
{/if}
<!-- /Block search module TOP -->

<a id="link-newsletter" href="#">{l s='Newsletter' mod='blocklanguages'}</a>
