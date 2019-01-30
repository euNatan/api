Trestle.resource(:items) do
  menu do
    item :items, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #
   table do
     column :user
     column :name
     column :category
     column :price
     column :description
     column :image do |img|
       image_tag img.image.thumb
     end
     column :enable
     column :status

     actions
   end

  # Customize the form fields shown on the new/edit views.
  #
   form do |item|
     text_field :name
     text_field :price
     text_field :description
     file_field :image
     check_box :enable
     select :status_id, Status.all.collect { |s| [s.name, s.id] }
     select :user_id, User.all.collect { |s| [s.email, s.id] }
     select :category_id, Category.all.collect { |s| [s.name, s.id] }

   end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:item).permit(:name, ...)
  # end
end
