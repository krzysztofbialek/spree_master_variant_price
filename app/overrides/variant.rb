Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
                     :name => "variant_use_master_price",
                     :insert_after => "[data-hook='cost_price']",
                     :partial => "variants/use_master_price",
                     :original => '63e42c5682d28c18384e0b48a76a06924021564a' )
