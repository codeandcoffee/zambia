class BackboneController < ApplicationController
  def hashify_path
    redirect_to "##{params[:path]}"
  end
end