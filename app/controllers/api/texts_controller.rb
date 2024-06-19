module Api
    class TextsController < ApplicationController
      before_action :authenticate_admin!, except: [:public_texts]
  
      def create
        text_params = params.permit(:text)
        @text = current_admin.texts.build(content: text_params[:text])
  
        if @text.save
          head :no_content
        else
          render json: { error: @text.errors.full_messages.join(", ") }, status: :unprocessable_entity
        end
      end
  
      def show
        @text = current_admin.texts.last
        render json: { text: @text.content }
      end
  
      def public_texts
        @texts = Text.all
        render json: @texts.map { |text| { id: text.id, content: text.content, admin_id: text.admin_id, created_at: text.created_at } }
      end
    end
  end
  