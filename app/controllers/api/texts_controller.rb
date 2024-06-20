module Api
  class TextsController < ApplicationController
    before_action :authenticate_admin!, except: [:public_texts]

    def create
      text_params = params.permit(:text)
      @text = Text.new(content: text_params[:text])

      if @text.save
        TextToAdmin.create(text: @text, admin: current_admin)
        head :no_content
      else
        render json: { error: @text.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    end

    def show
      @text = current_admin.texts.last
      if @text
        render json: { text: @text.content }
      else
        render json: { error: 'No text found' }, status: :not_found
      end
    end

    def show_latest
      @text = Text.last
      if @text
        render json: { text: @text.content }
      else
        render json: { error: 'No text found' }, status: :not_found
      end
    end

    def public_texts
      @texts = Text.all
      render json: @texts.map { |text| { id: text.id, content: text.content, created_at: text.created_at } }
    end
  end
end
