<?php

// SimpleSAMLphp IdP configuration
// (see https://simplesamlphp.org/docs/1.19/simplesamlphp-idp.html#configuring-the-authentication-module)
$config = array(

    'admin' => array(
        'core:AdminPassword',
    ),

    'example-userpass' => array(
        'exampleauth:UserPass',
        'alicea:alicepass' => array(
            'email' => 'alice.admin@example.edu',
            'name'  => 'Alice Admin',
            'uid'   => 'alicea',
        ),
        'mikem:mikepass' => array(
            'email' => 'mike.moderator@example.edu',
            'name'  => 'Mike Moderator',
            'uid'   => 'mikem',
        ),
        'niajn:niajpass' => array(
            'email' => 'niaj.newbie@example.edu',
            'name'  => 'Niaj Newbie',
            'uid'   => 'niajn',
        ),
        'oliviao:oliviapass' => array(
            'email' => 'olivia.owner@example.edu',
            'name'  => 'Olivia Owner',
            'uid'   => 'oliviao',
        ),
    ),

);
