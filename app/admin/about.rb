ActiveAdmin.register About do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :img, :body
  
  form do |f|
    f.inputs "About" do
      f.input :img, :as => :file, hint: image_tag(f.object.img.url(:thumb))
      f.inputs "Body" do
        f.text_area :body, class: "tinymce"
      end
    end
    f.actions
  end


end
