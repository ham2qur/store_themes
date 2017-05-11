
{capture name=path}{l s='Press review' mod='pressreviews'}{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

<div id="press-content">
    <h1>{l s='Press review' mod='pressreviews'}</h1>

    <div id="intro_text">
        {$intro[$cookie->id_lang]}
    </div>

    <div class="clear"></div>
    {if isset($reviews) && {$reviews|count} > 0}
        <ul id="reviews">
        {foreach from=$reviews item=review name=reviews key=i}
            {if isset($review->type) && $review->type == 'lightbox'}
                <li class="review">
                    <a class="rev_img" href="{$img_ps_dir}pr/big/{$review->id}.jpg">
                        <span class="thumb_img">
                            <img width="{$imgWidth}" height="{$imgHeight}" src="{$img_ps_dir}pr/thumb/{$review->id}.jpg" alt="" />
                        </span>
                    </a>
                    <div class="right">
                        {if $itemsDisplay['PR_ELEMENTS_DISPLAY_title']}<p class="title">{$review->title[$cookie->id_lang]}</p>{/if}
                        {if $itemsDisplay['PR_ELEMENTS_DISPLAY_date']}<span class="date">{$review->creation_date|date_format:$date_conf[$cookie->id_lang]}</span>{/if}
                        <span class="span_txt">{$review->thumb_txt[$cookie->id_lang]}</span>
                        <a class="rev_img" href="{$img_ps_dir}pr/big/{$review->id}.jpg">{l s='See' mod='pressreviews'}</a>
                    </div>
                </li>
            {elseif isset($review->type) && $review->type == 'link'}
                <li class="review">
                    <a class="rev_link" target="_blank" href="{$review->link[$cookie->id_lang]}">
                        <span class="thumb_img">
                            <img width="{$imgWidth}" height="{$imgHeight}" src="{$img_ps_dir}pr/thumb/{$review->id}.jpg" alt="" />
                        </span>
                    </a>
                    <div class="right">
                        {if $itemsDisplay['PR_ELEMENTS_DISPLAY_title']}<p class="title">{$review->title[$cookie->id_lang]}</p>{/if}
                        {if $itemsDisplay['PR_ELEMENTS_DISPLAY_date']}<span class="date">{$review->creation_date|date_format:$date_conf[$cookie->id_lang]}</span>{/if}
                        <span class="span_txt">{$review->thumb_txt[$cookie->id_lang]}</span>
                        <a class="rev_link" target="_blank" href="{$review->link[$cookie->id_lang]}">{l s='See' mod='pressreviews'}</a>
                    </div>
                </li>
            {/if}
        {/foreach}
        </ul>
        <div class="clear"></div>
        {include file="./pagination.tpl"}
    {else}
        <div class="block-center" id="block-history">
            <p class="warning">
                {l s='No article' mod='pressreviews'}
            </p>
        </div>
    {/if}
    <div class="clear"></div>
</div>