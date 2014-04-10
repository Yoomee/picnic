module ConnectionsHelper
  
  def render_connection(connection)
    render("connections/connection", :connection => connection)
  end
  
  def render_connections(connections)
    connections.inject('') do |memo, connection|
      memo + render_connection(connection)
    end
  end
  
end
