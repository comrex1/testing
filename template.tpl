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

TERMS OF SERVICE



<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PWDRHZS');</script>
<!-- End Google Tag Manager -->
