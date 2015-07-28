ActiveAdmin.register Image do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :order, :img
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    selectable_column
    column "Имя", :name
    column "Порядок", :order
    column "Картинка", :img do |image|
      image_tag image.img.url(:thumb), size: "40x40"
    end
    actions
  end

  form do |f|
    f.inputs "Project Details" do
      f.input :name
      f.input :order
      f.input :img, :as => :file, hint: image_tag(f.object.img.url(:thumb))
    end
    f.actions
  end

  show do |image|
     image.img.url
  end

end
