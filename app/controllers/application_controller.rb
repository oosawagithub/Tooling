class ApplicationController < ActionController::Base
	#deviseを利用する機能（ユーザ登録、ログイン認証など）が実行される前に、configure_permitted_parametersが実行されます。
	before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

	def after_sign_up_path_for(resource)
	 admins_posts_path
    end

    def after_sign_in_path_for(resource)
      admins_posts_path
    end

    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

    protected
	def configure_permitted_parameters
	 	devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
	 end
  #deviseのコントローラを使用するときにdevise-layoutを呼び出してヘッダー非表示にしてる
  def layout_by_resource
    if devise_controller?
      "devise-layout"
    else
      "application"
    end
  end
end
