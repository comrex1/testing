<?php

/**
 * @file
 * Test file for phpcs.
 */

?>

<?php if (!empty($actions)): ?>
  <ul class="action-links">
    <?php print render($actions); ?>
  </ul>
<?php endif; ?>


<?php

add_hook('ClientAreaPrimaryNavbar', 1, function($primaryNavbar)
{
   $primaryNavbar->addChild('terms', array(
       'uri' => 'terms.php',
       'label' => Lang::trans('ordertos'),
       'order' => 100,
       'icon' => 'fa-gavel',
   ));
});
