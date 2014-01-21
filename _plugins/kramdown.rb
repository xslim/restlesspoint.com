require 'kramdown/parser'
require 'kramdown/converter'
require 'kramdown/converter/html'

class Kramdown::Converter::Html
  
  def convert_img(el, indent)
    
    if !el.attr['src'].nil? && el.attr['src'][0] != '/'
      el.attr['src'] = '/images/' + el.attr['src']
    end
    
    html_l = ''
    html_r = ''
    
    if @stack[1].children.count == 3
      if @stack[1].children[0].type == :img && @stack[1].children[2].type == :img
        img1 = el.attr
        img2 = @stack[1].children[2].attr
        
        if !img2['src'].nil? && img2['src'][0] != '/'
          img2['src'] = '/images/' + img2['src']
        end
        
        if img1['title'] && img1['title'].length > 0 && img2['title'] && img2['title'].length > 0
          img2['title'] = ' & ' + img2['title']
        else
          img1['title']=''
          img2['title']=''
        end
        
        title = img1['title'] + img2['title']
        @stack[1].children.delete_at(2)
        html_l = '<figure class="half">'
        html_r = "</figure>"
        html_r = "<figcaption>#{title}</figcaption>" + html_r if title.length > 0
        return html_l + "<img#{html_attributes(img1)} />\n" + "<img#{html_attributes(img2)} />" + html_r
      end
    end
    
    alt_text = el.attr['alt']
    if alt_text
      if alt_text[0]=="-" # inline
        el.attr['alt'] = alt_text[1..-1]
      elsif alt_text[0]==">"
        el.attr['alt'] = alt_text[1..-1]
        html_l = '<figure class="image-right">'
        html_r = "</figure>"
        html_r = "<figcaption>#{el.attr['title']}</figcaption>" + html_r if el.attr['title']
      elsif alt_text[0]=="<"
        el.attr['alt'] = alt_text[1..-1]
        html_l = '<figure class="image-left">'
        html_r = "</figure>"
        html_r = "<figcaption>#{el.attr['title']}</figcaption>" + html_r if el.attr['title']
      end
    end
    
    return html_l + "<img#{html_attributes(el.attr)} />" + html_r
    #binding.pry
    #el.inspect.to_s
    #el.attr['alt']
    #html_attributes(el.attr)
  end
end
