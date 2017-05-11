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

<!-- Right -->
						<div id="right_column" class="row">
							{$HOOK_RIGHT_COLUMN}
						</div>
					</div>
				</div>
			</div>

<!-- Footer -->
		</div>
		<div id="footer">
			<div class="container">
				<div class="row">
					<div class="span12">
						<div class="row">
							<div class="span3">
								 &copy; Интернет-магазин мебели &laquo;Мир Дома&raquo; 2008-2015
							</div>
							{$HOOK_FOOTER}
							{if $PS_ALLOW_MOBILE_DEVICE}
								<div class="span3"><p class="center clearBoth"><a href="{$link->getPageLink('index', true)}?mobile_theme_ok">{l s='Browse the mobile site'}</a></p></div>
							{/if}
						</div>
					</div>
				</div>
			</div>
		</div>
	{/if}
		<script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"></script>
		<script type="text/javascript" src="//vk.com/js/api/openapi.js?101"></script>
		{literal}
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter33634149 = new Ya.Metrika({
                    id:33634149,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/33634149" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
		{/literal}
	</body>
</html>
