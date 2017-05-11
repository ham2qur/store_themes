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

        {if !$content_only}
                    </section><!-- // Section -->
                    
                    <aside id="right-column">
                        {$HOOK_RIGHT_COLUMN}
                    </aside>
                    
                </div><!-- // Container -->
                
                <div id="push">
                    <div id="push-inner"></div>
                </div>
            </div><!-- // Wrapper -->


			<footer id="footer">
                <div id="footer-inner">

                    <ul class="footer-link">
                        <li class="header"><h3><a href="{$link->getCMSCategoryLink(2)|escape:'html'}">{l s='Customers service'}</a></h3></li>
                        <li><a href="{$link->getCMSLink(28)|escape:'html'}">{l s='Customer service with your listening at 02 41 75 97 93'}</a></li>
                        <li><a href="{$link->getCMSLink(19)|escape:'html'}">{l s='FAQ'}</a></li>
                        <li><a href="{$link->getCMSLink(5)|escape:'html'}">{l s='Secure Payment'}</a></li>
                        <li><a href="{$link->getCMSLink(24)|escape:'html'}">{l s='Money Back Guarantee'}</a></li>
                        <li><a href="{$link->getCMSLink(3)|escape:'html'}">{l s='CGV'}</a></li>
                        <li><a href="{$link->getCMSLink(2)|escape:'html'}">{l s='Legal notice'}</a></li>
                    </ul>

                    <ul class="footer-link">
                        <li class="header"><h3><a href="{$link->getCMSCategoryLink(3)|escape:'html'}">{l s='Our company'}</a></h3></li>
                        <li><a href="{$link->getCMSLink(6)|escape:'html'}">{l s='About us'}</a></li>
                        <li><a href="{$link->getCMSLink(7)|escape:'html'}">{l s='Ours products'}</a></li>
                        <!--<li><a href="{$link->getCMSLink(8)|escape:'html'}">{l s='Customization service'}</a></li>-->
                        <li><a href="{$link->getCMSLink(9)|escape:'html'}">{l s='Company'}</a></li>
                        <li><a href="{$link->getCMSLink(25)|escape:'html'}">{l s='The know-how'}</a></li>
                        <li><a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='Contact us'}</a></li>
                    </ul>

                    <img id="footer-logo" src="{$logo_url}" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if}/>

                    {$HOOK_FOOTER}

                    <div id="payment-block">
                        <h3>{l s='Payment'}</h3>
                        <img id="paiement-logo" src="{$img_dir}paiement-logo.png" alt="{l s='Paiement by mastercard, visa'}" />
                    </div>

                    <div id="footer-bottom">
                        <div id="line"></div>

                        <p id="copyright">© Les Bougies de France - 2015 • <a href="{$link->getCMSLink(2)|escape:'html'}">{l s='Legal notice'}</a> • <a href="{$link->getCMSLink(3)|escape:'html'}">{l s='CGV'}</a> • <a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='Contact us'}</a></p>

                        <p id="follow">
                            <span>{l s='Follow us on Facebook'}</span> : <a href="https://www.facebook.com/pages/Les-Bougies-de-France/104277473251800" target="_blank"></a>
                        </p>
                    </div>
                </div>
			</footer>

        {/if}
	</body>

</html>
