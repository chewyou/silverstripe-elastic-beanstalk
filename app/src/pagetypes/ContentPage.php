<?php

namespace Skylark\App;

use Page;

class ContentPage extends Page {

  private static $table_name = "ContentPage";

  private static $description = "Contains Elemental Blocks to create a content page";

  private static $icon_class = "font-icon-block-content";

  private static $db = [];

  private static $has_one = [];

  private static $has_many = [];

  private static $many_many = [];

  public function getCMSFields() {
    $fields = parent::getCMSFields();
    return $fields;
  }

}