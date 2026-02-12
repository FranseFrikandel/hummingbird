{**
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *}
{$componentName = 'product-miniature'}

{block name='product_miniature_item'}
  <article
    class="{$componentName} js-{$componentName}"
    data-id-product="{$product.id_product}"
    data-id-product-attribute="{$product.id_product_attribute}"
  >
    <div class="{$componentName}__inner">
      {block name='product_miniature_top'}
        <div class="{$componentName}__top">
          {include file='catalog/_partials/product-flags.tpl'}

          {include file='catalog/_partials/miniatures/product-image.tpl'}

          {include file='catalog/_partials/miniatures/product-quickview.tpl'}
        </div>
      {/block}

      {block name='product_miniature_bottom'}
        <div class="{$componentName}__bottom">
          <div class="{$componentName}__infos">
            {block name='product_name'}
              <a class="{$componentName}__title" href="{$product.url}" aria-label="{l s='View product %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Catalog'}">{$product.name}</a>
            {/block}

            {block name='product_variants'}
              {if $product.main_variants}
                <div class="{$componentName}__variants">
                  {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                </div>
              {/if}
            {/block}

            {if $product.show_price}
              <div class="{$componentName}__prices">
                {block name='product_price'}
                  {hook h='displayProductPriceBlock' product=$product type="before_price"}

                  <div class="{$componentName}__price" aria-label="{l s='Price' d='Shop.Theme.Catalog'}">
                    {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='products_list'}{/capture}
                    {if '' !== $smarty.capture.custom_price}
                      {$smarty.capture.custom_price nofilter}
                    {else}
                      {hook h='displayProductPriceBlock' product=$product type="lowest_variant_price"}
                      {* {$product.price} *}
                    {/if}
                  </div>

                  {hook h='displayProductPriceBlock' product=$product type='unit_price'}

                  {hook h='displayProductPriceBlock' product=$product type='weight'}
                {/block}

                {block name='product_discount_price'}
                  {if $product.show_price}
                    <div class="{$componentName}__discount-price">
                      {if $product.has_discount}
                        {hook h='displayProductPriceBlock' product=$product type="old_price"}

<<<<<<< HEAD
                        <span class="{$componentName}__regular-price" aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                      {/if}
                    </div>
                  {/if}
                {/block}
              </div>
            {/if}
=======
                      <span class="{$componentName}__regular-price"
                        aria-label="{l s='Regular price' d='Shop.Theme.Catalog'}">{$product.regular_price}</span>
                    {/if}
                  </div>
                {/if}
              {/block}
            </div>
>>>>>>> dc7c88c4 (fix: increase thumbnail resolution)

            {block name='product_reviews'}
              {hook h='displayProductListReviews' product=$product}
            {/block}
          </div>

          <div class="{$componentName}__actions">
            {if $product.add_to_cart_url}
<<<<<<< HEAD
              <form class="{$componentName}__form" action="{$urls.pages.cart}" method="post">
=======
              <form action="{$urls.pages.cart}" method="post"
                class="d-flex flex-wrap flex-md-nowrap gap-3 align-items-center mt-3">
>>>>>>> dc7c88c4 (fix: increase thumbnail resolution)
                <input type="hidden" value="{$product.id_product}" name="id_product">
                <input type="hidden" name="token" value="{$static_token}">

                <div class="quantity-button js-quantity-button">
                  {include file='components/qty-input.tpl'
<<<<<<< HEAD
<<<<<<< HEAD
                    attributes=[
                      "id" => "quantity_wanted_{$product.id_product}",
                      "value" => "{$product.quantity_wanted}",
                      "min" => "{$product.quantity_required}"
                    ]
=======
                          attributes=[
                            "id" => "quantity_wanted_{$product.id_product}",
=======
                                attributes=[
                                  "id" => "quantity_wanted_{$product.id_product}",
>>>>>>> 8e3b08c1 (Hook startingprice module)
                  "value" => "{$product.minimal_quantity}",
                  "min" => "{$product.minimal_quantity}"
                  ]
                  marginHelper="mb-0"
>>>>>>> dc7c88c4 (fix: increase thumbnail resolution)
                  }
                </div>

                <button 
                  data-button-action="add-to-cart" 
                  class="product-miniature__add btn btn-primary btn-square-icon"
                  aria-label="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}"
                  title="{l s='Add to cart %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Actions'}"
                  data-ps-ref="add-to-cart"
                >
                  <i class="material-icons" aria-hidden="true">&#xe854;</i>
                  <span class="product-miniature__add-text">{l s='Add to cart' d='Shop.Theme.Actions'}</span>
                </button>
              </form>
            {else}
              <a href="{$product.url}" class="product-miniature__details btn btn-outline-primary" aria-label="{l s='View product %product_name%' sprintf=['%product_name%' => $product.name] d='Shop.Theme.Catalog'}">
                {l s='See details' d='Shop.Theme.Actions'}
              </a>
            {/if}
          </div>
        </div>
      {/block}
    </div>
  </article>
{/block}
