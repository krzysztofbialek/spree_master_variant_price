SpreeMasterVariantPrice
=======================

This is a spree extension aimed to help working with multiple variants. Changing price of each variant manualy can be a tedious,
extension add extra field to variant option 'use master price'. When checked it will use its product master variant price for display
and basket calculations.

It make chaning every variant price as easy as changing master product price.

Compatible with Spree 1.3.0

Instalation
=======

    gem 'spree_master_variant_price', github: 'krzysztofbialek/spree_master_variant_price'

    $ bundle install
    $ bundle exec rails g spree_master_variant_price:install

Accept when prompted about migration

Updating existing variants
=======

Is as simple as running this snippet in the console:

    Spree::Variant.update_all(:use_master_price, true)



Copyright (c) 2014 Krzysztof Białek, released under the New BSD License
