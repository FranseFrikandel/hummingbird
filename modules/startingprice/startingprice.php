<?php
if (!defined('_PS_VERSION_')) {
    exit;
}

class StartingPrice extends Module
{
    public function __construct()
    {
        $this->name = 'startingprice';
        $this->tab = 'front_office_features';
        $this->version = '0.0.1';
        $this->author = 'Romain Coumans';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = [
            'min' => '8.0.0.0',
            'max' => '9.99.99',
        ];
        $this->bootstrap = false;

        parent::__construct();

        $this->displayName = $this->trans('Starting Price module', [], 'Modules.Mymodule.Admin');
        $this->description = $this->trans('Adds the ability to show the starting price of a product with variations.', [], 'Modules.Mymodule.Admin');

        $this->confirmUninstall = $this->trans('Are you sure you want to uninstall?', [], 'Modules.Mymodule.Admin');

        if (!Configuration::get('MYMODULE_NAME')) {
            $this->warning = $this->trans('No name provided', [], 'Modules.Mymodule.Admin');
        }
    }

    public function install()
    {
        return parent::install() && $this->registerHook('displayProductPriceBlock');
    }

    public function uninstall()
    {
        return parent::uninstall();
    }

    public function hookDisplayProductPriceBlock(array $param) {
        if (!isset($param['product']) || !isset($param['type'])) {
            return;
        }

        if ($param['type'] == 'before_price' && $param['product']['product_type'] == 'combinations') {
            return '<span class="pe-1">' . $this->trans('From', array(), 'Modules.Legalcompliance.Shop') . '</span>';
        } elseif ($param['type'] == 'lowest_variant_price') {
            $iso_code = Context::getContext()->currency->iso_code;
            if ($param['product']['product_type'] == 'combinations') {
                $product = new Product($param['product']['id']);
                foreach ($product->getAttributeCombinations() as $combination) {
                    if ($combination['price'] == 0) {
                        return Context::getContext()->currentLocale->formatPrice($product->getPrice(true, $combination['id_product_attribute']), $iso_code);
                    }
                }
            } else {
                return $param['product']['price'];
            }
        }
    }
}