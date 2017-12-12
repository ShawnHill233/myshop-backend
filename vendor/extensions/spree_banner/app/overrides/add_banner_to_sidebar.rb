Deface::Override.new(virtual_path: 'spree/admin/shared/sub_menu/_product',
                     name: 'add_banner_to_sidebar',
                     insert_after: "erb[loud]:contains('tab :products')",
                     text: "<%= tab :banners, match_path: '/banners' %>
")