module ApplicationHelper
  def menu_principal
    @menu = %w(cliente qualificacao restaurante)
    menu_principal = "<ul>"
    @menu.each do |item|
      menu_principal << "<li>" + link_to(item, :controller => item.pluralize) + "</li>"
    end
    menu_principal << "</ul>"
    menu_principal.html_safe
  end

  def comentarios(comentavel)
    comentarios = "<div id='comentarios'>"
    comentarios << "<h3>Comentarios</h3>"
    comentarios << render(:partial => "comentarios/comentario",
                          :collection => comentavel.comentarios)
    comentarios << "</div>"
    comentarios << render(:partial => "comentarios/novo_comentario",
                          :local => {:comentavel => comentavel})
    comentarios.html_safe
  end

  def valor_formatado(number)
    number_to_currency(number, :unit => "R$", :separator => ",", :delimiter => ".")
  end
end
