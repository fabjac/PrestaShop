<?php

class LinksControllerCore extends FrontController
{
	public $php_self = 'links';

	/**
	 * Assign template vars related to page content
	 * @see FrontController::initContent()
	 */
	public function initContent()
	{
		parent::initContent();

		$this->setTemplate(_PS_THEME_DIR_.'links.tpl');
	}
}
