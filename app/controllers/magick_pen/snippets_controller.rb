class MagickPen::SnippetsController < ApplicationController
  protect_from_forgery

  def update
    begin
      snippet = find_snippet(permitted_attr)
      if snippet.nil?
        snippet = MagickPen::Snippet.create!(permitted_attr)
      else
        snippet.update!(permitted_attr)
      end
      render json: {
          status: 200,
          snippet: {
            pen_key: snippet.pen_key,
            id: snippet.id,
            versions:  (snippet.versions.order('id desc').map { |v| (v.event == "create" || v.event == "update") ? { id:v.id, date: v.created_at } : nil }).compact
          }
      }
    rescue => e
      render json: { status: 500, message: e.message }
    end
  end

  def version
    snippet = find_snippet(params)
    if snippet.nil?
      render json:  { status: 404 }
      return
    end
    if params[:version_id].to_i == 0
      content = snippet.content
      render json: { status: 200, snippet: {pen_key: snippet.pen_key, id: snippet.id, content: content} }
    else
      version = snippet.versions.where(id: params[:version_id]).first
      if version.present?
        if version.event == 'update'
          snippet = version.reify
          content = snippet.content
        else
          content = snippet.original_content
        end
        render json: { status: 200, snippet: {pen_key: snippet.pen_key, id: snippet.id, content: content} }
      else
        render json: { status: 404 }
      end
    end
  end

  private

  def permitted_attr
    if @_permitted_attr
      @_permitted_attr
    else
      @_permitted_attr =  params.require('magick_pen_snippet').permit(:pen_key, :action_name, :controller_name, :is_global, :content, :original_content)
    end
  end

  def find_snippet(snippet_pram)
    if snippet_pram.nil?
      snippet_pram = params
    end
    snippet =  MagickPen::Snippet.where(pen_key:  snippet_pram[:pen_key])
    if snippet_pram[:is_global].blank? || snippet_pram[:is_global].downcase == 'false'
      snippet = snippet.where(controller_name: snippet_pram[:controller_name], action_name: snippet_pram[:action_name])
    else
      snippet = snippet.where(is_global: true)
    end
    snippet.first
  end

end
