module LocationHelper
  def google_maps(lat, long, z= '16')
    content_tag(:iframe, '', src: "https://maps.google.com/?output=embed&z=#{z}&q=#{lat},#{long}", marginheight: 0, width: '100%', height: 300, frameborder: 0, marginwidth: 0)
  end
end
