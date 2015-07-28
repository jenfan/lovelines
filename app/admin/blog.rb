ActiveAdmin.register Blog do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :subtitle, :body
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form do |f|
    f.inputs "Blog" do
      f.input :title
      f.input :subtitle
      f.inputs "Body" do
        f.text_area :body, class: "tinymce"
      end
    end
    f.actions
  end

end
